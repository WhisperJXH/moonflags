///|
/// Evaluate a single flag without named segments.
pub fn Flag::evaluate(self : Flag, ctx : Context) -> Evaluation {
  evaluate_flag_with_segments(self, ctx, Map([]))
}

///|
/// Evaluate a flag from a flag set.
pub fn FlagSet::evaluate(self : FlagSet, flag_key : StringView, ctx : Context) -> Evaluation? {
  match self.flags.get(flag_key.to_owned()) {
    Some(flag) => Some(evaluate_flag_with_segments(flag, ctx, self.segments))
    None => None
  }
}

///|
/// Evaluate all flags in a set and return results in insertion order.
pub fn FlagSet::evaluate_all(self : FlagSet, ctx : Context) -> Array[Evaluation] {
  let results : Array[Evaluation] = []
  self.flags.each((_key, flag) => results.push(
    evaluate_flag_with_segments(flag, ctx, self.segments),
  ))
  results
}

///|
/// Deterministically map a user to a rollout bucket in the range `0..<10000`.
pub fn rollout_bucket(
  seed : StringView,
  flag_key : StringView,
  user_key : StringView,
) -> Int {
  let text = seed.to_owned() + ":" + flag_key.to_owned() + ":" + user_key.to_owned()
  let mut hash = 2161
  for unit in text.code_units() {
    hash = (hash * 131 + unit.to_int()) % 10000
  }
  hash
}

///|
/// Pick a variant from a rollout for a bucket.
pub fn Rollout::pick(self : Rollout, bucket : Int) -> String? {
  let mut cursor = 0
  for allocation in self.allocations {
    if allocation.weight > 0 {
      cursor = cursor + allocation.weight
      if bucket < cursor {
        return Some(allocation.variant)
      }
    }
  }
  None
}

///|
/// Check whether a rule targets a context.
pub fn Rule::matches(
  self : Rule,
  ctx : Context,
  segments : Map[String, Segment],
) -> Bool {
  if !all_conditions_match(self.conditions, ctx) {
    return false
  }
  for segment_key in self.segments {
    match segments.get(segment_key) {
      Some(segment) =>
        if !segment.matches(ctx) {
          return false
        }
      None => return false
    }
  }
  true
}

///|
fn evaluate_flag_with_segments(
  flag : Flag,
  ctx : Context,
  segments : Map[String, Segment],
) -> Evaluation {
  let warnings = missing_segment_warnings(flag, segments)
  if !flag.enabled {
    return evaluation(
      flag_key=flag.key,
      variant=flag.off_variant,
      reason="flag_off",
      matched=false,
      rule_key=None,
      bucket=None,
      warnings~,
    )
  }

  for rule in flag.rules {
    if rule.matches(ctx, segments) {
      return evaluate_rule_result(flag, rule, ctx, warnings)
    }
  }

  match flag.fallthrough_rollout {
    Some(rollout) =>
      match evaluate_rollout(flag.key, rollout, ctx, flag.default_variant) {
        (variant, bucket, rollout_warnings) =>
          evaluation(
            flag_key=flag.key,
            variant~,
            reason="fallthrough_rollout",
            matched=false,
            rule_key=None,
            bucket~,
            warnings=warnings + rollout_warnings,
          )
      }
    None => {
      let variant = flag.fallthrough_variant.unwrap_or(flag.default_variant)
      evaluation(
        flag_key=flag.key,
        variant~,
        reason="fallthrough",
        matched=false,
        rule_key=None,
        bucket=None,
        warnings~,
      )
    }
  }
}

///|
fn evaluate_rule_result(
  flag : Flag,
  rule : Rule,
  ctx : Context,
  warnings : Array[String],
) -> Evaluation {
  match rule.rollout {
    Some(rollout) =>
      match evaluate_rollout(flag.key, rollout, ctx, flag.default_variant) {
        (variant, bucket, rollout_warnings) =>
          evaluation(
            flag_key=flag.key,
            variant~,
            reason=rule.reason,
            matched=true,
            rule_key=Some(rule.key),
            bucket~,
            warnings=warnings + rollout_warnings,
          )
      }
    None => {
      let variant = rule.variant.unwrap_or(flag.default_variant)
      evaluation(
        flag_key=flag.key,
        variant~,
        reason=rule.reason,
        matched=true,
        rule_key=Some(rule.key),
        bucket=None,
        warnings~,
      )
    }
  }
}

///|
fn evaluate_rollout(
  flag_key : String,
  rollout : Rollout,
  ctx : Context,
  default_variant : String,
) -> (String, Int?, Array[String]) {
  match ctx.user_key {
    Some(user_key) => {
      let bucket = rollout_bucket(rollout.seed, flag_key, user_key)
      match rollout.pick(bucket) {
        Some(variant) => (variant, Some(bucket), [])
        None => (
          default_variant,
          Some(bucket),
          ["rollout allocations did not cover the computed bucket"],
        )
      }
    }
    None => (
      default_variant,
      None,
      ["rollout requires Context.user_key; default variant was used"],
    )
  }
}

///|
fn missing_segment_warnings(
  flag : Flag,
  segments : Map[String, Segment],
) -> Array[String] {
  let warnings : Array[String] = []
  for rule in flag.rules {
    for segment_key in rule.segments {
      if !segments.contains(segment_key) {
        warnings.push(
          "rule " + rule.key + " references unknown segment " + segment_key,
        )
      }
    }
  }
  warnings
}

///|
fn evaluation(
  flag_key~ : String,
  variant~ : String,
  reason~ : String,
  matched~ : Bool,
  rule_key~ : String?,
  bucket~ : Int?,
  warnings~ : Array[String],
) -> Evaluation {
  {
    flag_key,
    variant,
    reason,
    matched,
    rule_key,
    bucket,
    warnings,
  }
}
