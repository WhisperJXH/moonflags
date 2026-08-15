///|
test "rollout picker respects basis point order" {
  let rollout = Rollout([
    WeightedVariant("a", 2500),
    WeightedVariant("b", 2500),
    WeightedVariant("c", 5000),
  ])
  debug_inspect(rollout.pick(0), content="Some(\"a\")")
  debug_inspect(rollout.pick(2499), content="Some(\"a\")")
  debug_inspect(rollout.pick(2500), content="Some(\"b\")")
  debug_inspect(rollout.pick(5000), content="Some(\"c\")")
  debug_inspect(rollout.pick(9999), content="Some(\"c\")")
  debug_inspect(rollout.pick(10000), content="None")
}

///|
test "rollout bucket stays inside expected range" {
  for user in ["u1", "u2", "u3", "u4", "u5"] {
    let bucket = rollout_bucket("seed", "flag", user)
    assert_true(bucket >= 0)
    assert_true(bucket < 10000)
  }
}

///|
test "segment conditions require all predicates" {
  let segment = Segment("paid-cn", conditions=[
    str_eq("country", "CN"),
    bool_eq("paid", true),
  ])
  let pass = Context(user_key="p")
    .with_str("country", "CN")
    .with_bool("paid", true)
  let fail = Context(user_key="f")
    .with_str("country", "CN")
    .with_bool("paid", false)
  inspect(segment.matches(pass), content="true")
  inspect(segment.matches(fail), content="false")
}
