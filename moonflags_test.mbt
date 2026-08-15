///|
test "condition helpers match context attributes" {
  let ctx = @moonflags.Context(user_key="user-1")
    .with_str("country", "CN")
    .with_int("age", 23)
    .with_bool("paid", true)
    .with_strings("roles", ["admin", "editor"])
  assert_true(@moonflags.str_eq("country", "CN").matches(ctx))
  assert_true(@moonflags.greater_eq("age", 18).matches(ctx))
  assert_true(@moonflags.bool_eq("paid", true).matches(ctx))
  assert_true(@moonflags.contains("roles", "admin").matches(ctx))
  assert_true(@moonflags.missing("plan").matches(ctx))
}

///|
test "flag returns direct rule variant before fallthrough" {
  let rule = @moonflags.Rule(
    "cn-beta",
    conditions=[@moonflags.str_eq("country", "CN")],
    variant="beta",
    reason="country_target",
  )
  let flag = @moonflags.Flag(
    "checkout_flow",
    ["control", "beta"],
    "control",
    rules=[rule],
    fallthrough_variant="control",
  )
  let ctx = @moonflags.Context(user_key="u-100").with_str("country", "CN")
  let result = flag.evaluate(ctx)
  inspect(result.variant, content="beta")
  inspect(result.reason, content="country_target")
  inspect(result.matched, content="true")
  debug_inspect(result.rule_key, content="Some(\"cn-beta\")")
}

///|
test "disabled flag returns off variant" {
  let flag = @moonflags.Flag(
    "new_nav",
    ["off", "on"],
    "off",
    enabled=false,
    off_variant="off",
    fallthrough_variant="on",
  )
  let result = flag.evaluate(@moonflags.Context(user_key="u-1"))
  inspect(result.variant, content="off")
  inspect(result.reason, content="flag_off")
  inspect(result.matched, content="false")
}

///|
test "segment include and exclude lists affect rules" {
  let segment = @moonflags.Segment(
    "internal",
    include_users=["alice"],
    exclude_users=["blocked"],
    conditions=[@moonflags.str_eq("team", "platform")],
  )
  let rule = @moonflags.Rule(
    "internal-rule",
    segments=["internal"],
    variant="on",
  )
  let flag = @moonflags.Flag("console", ["off", "on"], "off", rules=[rule])
  let set = @moonflags.FlagSet(flags=[flag], segments=[segment])
  let included = set.evaluate("console", @moonflags.Context(user_key="alice"))
  let blocked = set.evaluate(
    "console",
    @moonflags.Context(user_key="blocked").with_str("team", "platform"),
  )
  let by_attr = set.evaluate(
    "console",
    @moonflags.Context(user_key="carol").with_str("team", "platform"),
  )
  debug_inspect(included.map(result => result.variant), content="Some(\"on\")")
  debug_inspect(blocked.map(result => result.variant), content="Some(\"off\")")
  debug_inspect(by_attr.map(result => result.variant), content="Some(\"on\")")
}

///|
test "rollout bucket is deterministic for a user" {
  let rollout = @moonflags.Rollout(
    [
      @moonflags.WeightedVariant("control", 5000),
      @moonflags.WeightedVariant("beta", 5000),
    ],
    seed="checkout-v1",
  )
  let flag = @moonflags.Flag(
    "checkout",
    ["control", "beta"],
    "control",
    fallthrough_rollout=rollout,
  )
  let ctx = @moonflags.Context(user_key="same-user")
  let first = flag.evaluate(ctx)
  let second = flag.evaluate(ctx)
  assert_eq(first.bucket, second.bucket)
  assert_eq(first.variant, second.variant)
  assert_true(first.variant == "control" || first.variant == "beta")
}

///|
test "rollout without user key returns default and warning" {
  let rollout = @moonflags.Rollout(
    [@moonflags.WeightedVariant("on", 10000)],
    seed="needs-user",
  )
  let flag = @moonflags.Flag(
    "gate",
    ["off", "on"],
    "off",
    fallthrough_rollout=rollout,
  )
  let result = flag.evaluate(@moonflags.Context())
  inspect(result.variant, content="off")
  inspect(result.bucket is None, content="true")
  inspect(result.warnings.length(), content="1")
}

///|
test "validation reports invalid variants and unknown segment" {
  let rollout = @moonflags.Rollout([@moonflags.WeightedVariant("ghost", 12000)])
  let rule = @moonflags.Rule("bad", segments=["missing"], rollout~)
  let flag = @moonflags.Flag(
    "bad_flag",
    ["off", "off"],
    "off",
    off_variant="missing-off",
    rules=[rule],
  )
  let set = @moonflags.FlagSet(flags=[flag])
  let diagnostics = @moonflags.validate_set(set)
  inspect(@moonflags.has_errors(diagnostics), content="true")
  assert_true(diagnostics.length() >= 4)
}

///|
test "evaluate_all returns one result per flag" {
  let first = @moonflags.Flag(
    "one",
    ["off", "on"],
    "off",
    fallthrough_variant="on",
  )
  let second = @moonflags.Flag("two", ["a", "b"], "a", fallthrough_variant="b")
  let set = @moonflags.FlagSet(flags=[first, second])
  let results = set.evaluate_all(@moonflags.Context(user_key="u"))
  inspect(results.length(), content="2")
}
