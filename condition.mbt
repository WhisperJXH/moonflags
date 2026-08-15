///|
/// Evaluate one condition against a context.
pub fn Condition::matches(self : Condition, ctx : Context) -> Bool {
  match self.matcher {
    Exists => ctx.contains(self.attr)
    Missing => !ctx.contains(self.attr)
    Is(expected) =>
      match ctx.get(self.attr) {
        Some(actual) => actual == expected
        None => false
      }
    IsNot(expected) =>
      match ctx.get(self.attr) {
        Some(actual) => actual != expected
        None => true
      }
    OneOf(expected) =>
      match ctx.get(self.attr) {
        Some(actual) => expected.contains(actual)
        None => false
      }
    Contains(value) =>
      match ctx.get(self.attr) {
        Some(Str(actual)) => actual.contains(value)
        Some(Strings(values)) => values.contains(value)
        _ => false
      }
    ContainsAny(expected) =>
      match ctx.get(self.attr) {
        Some(Strings(values)) => any_string_overlap(values, expected)
        Some(Str(actual)) => expected.any(value => actual.contains(value))
        _ => false
      }
    StartsWith(prefix) =>
      match ctx.get(self.attr) {
        Some(Str(actual)) => actual.has_prefix(prefix)
        _ => false
      }
    EndsWith(suffix) =>
      match ctx.get(self.attr) {
        Some(Str(actual)) => actual.has_suffix(suffix)
        _ => false
      }
    GreaterThan(limit) =>
      match ctx.get(self.attr) {
        Some(Int(actual)) => actual > limit
        _ => false
      }
    GreaterEq(limit) =>
      match ctx.get(self.attr) {
        Some(Int(actual)) => actual >= limit
        _ => false
      }
    LessThan(limit) =>
      match ctx.get(self.attr) {
        Some(Int(actual)) => actual < limit
        _ => false
      }
    LessEq(limit) =>
      match ctx.get(self.attr) {
        Some(Int(actual)) => actual <= limit
        _ => false
      }
  }
}

///|
/// Evaluate all conditions with AND semantics.
pub fn all_conditions_match(
  conditions : ArrayView[Condition],
  ctx : Context,
) -> Bool {
  for condition in conditions {
    if !condition.matches(ctx) {
      return false
    }
  }
  true
}

///|
/// Evaluate any condition with OR semantics.
pub fn any_condition_matches(
  conditions : ArrayView[Condition],
  ctx : Context,
) -> Bool {
  for condition in conditions {
    if condition.matches(ctx) {
      return true
    }
  }
  false
}

///|
/// Evaluate a segment.
pub fn Segment::matches(self : Segment, ctx : Context) -> Bool {
  match ctx.user_key {
    Some(user) => {
      if self.exclude_users.contains(user) {
        return false
      }
      if self.include_users.contains(user) {
        return true
      }
    }
    None => ()
  }
  all_conditions_match(self.conditions, ctx)
}

///|
/// Return a compact explanation for why a condition passed or failed.
pub fn Condition::explain(self : Condition, ctx : Context) -> String {
  let state = if self.matches(ctx) { "pass" } else { "fail" }
  state + ":" + self.attr
}

///|
fn any_string_overlap(left : Array[String], right : Array[String]) -> Bool {
  for item in left {
    if right.contains(item) {
      return true
    }
  }
  false
}
