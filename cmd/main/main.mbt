fn main {
  let rollout = @moonflags.Rollout([
    @moonflags.WeightedVariant("control", 6000),
    @moonflags.WeightedVariant("beta", 4000),
  ], seed="checkout-v1")
  let paid_rule = @moonflags.Rule(
    "paid-cn-users",
    conditions=[
      @moonflags.str_eq("country", "CN"),
      @moonflags.bool_eq("paid", true),
    ],
    rollout~,
    reason="paid_user_rollout",
  )
  let flag = @moonflags.Flag(
    "checkout_flow",
    ["control", "beta"],
    "control",
    rules=[paid_rule],
    fallthrough_variant="control",
  )
  let ctx = @moonflags.Context(user_key="demo-user-42")
    .with_str("country", "CN")
    .with_bool("paid", true)
  let result = flag.evaluate(ctx)
  println("MoonFlags example")
  println("flag: " + result.flag_key)
  println("variant: " + result.variant)
  println("reason: " + result.reason)
  println("bucket: " + show_bucket(result.bucket))
  println("diagnostics: " + @moonflags.validate_flag(flag).length().to_string())
}

fn show_bucket(bucket : Int?) -> String {
  match bucket {
    Some(value) => value.to_string()
    None => "none"
  }
}
