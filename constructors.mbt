///|
/// Build a condition.
#alias(new, deprecated="Use `Condition()` instead")
pub fn Condition::Condition(attr : StringView, matcher : Matcher) -> Condition {
  { attr: attr.to_owned(), matcher }
}

///|
/// Attribute exists.
pub fn exists(attr : StringView) -> Condition {
  Condition(attr, Exists)
}

///|
/// Attribute is missing.
pub fn missing(attr : StringView) -> Condition {
  Condition(attr, Missing)
}

///|
/// Attribute equals a string value.
pub fn str_eq(attr : StringView, value : StringView) -> Condition {
  Condition(attr, Is(Str(value.to_owned())))
}

///|
/// Attribute does not equal a string value.
pub fn str_not_eq(attr : StringView, value : StringView) -> Condition {
  Condition(attr, IsNot(Str(value.to_owned())))
}

///|
/// Attribute equals an integer value.
pub fn int_eq(attr : StringView, value : Int) -> Condition {
  Condition(attr, Is(Int(value)))
}

///|
/// Attribute equals a boolean value.
pub fn bool_eq(attr : StringView, value : Bool) -> Condition {
  Condition(attr, Is(Bool(value)))
}

///|
/// String attribute is one of the given values.
pub fn str_one_of(attr : StringView, values : ArrayView[String]) -> Condition {
  let attrs : Array[Attribute] = []
  for value in values {
    attrs.push(Str(value))
  }
  Condition(attr, OneOf(attrs))
}

///|
/// String or list attribute contains a value.
pub fn contains(attr : StringView, value : StringView) -> Condition {
  Condition(attr, Contains(value.to_owned()))
}

///|
/// String-list attribute contains at least one value from the expected set.
pub fn contains_any(attr : StringView, values : ArrayView[String]) -> Condition {
  Condition(attr, ContainsAny(values.to_owned()))
}

///|
/// String attribute starts with a prefix.
pub fn starts_with(attr : StringView, prefix : StringView) -> Condition {
  Condition(attr, StartsWith(prefix.to_owned()))
}

///|
/// String attribute ends with a suffix.
pub fn ends_with(attr : StringView, suffix : StringView) -> Condition {
  Condition(attr, EndsWith(suffix.to_owned()))
}

///|
/// Integer attribute is greater than a threshold.
pub fn greater_than(attr : StringView, value : Int) -> Condition {
  Condition(attr, GreaterThan(value))
}

///|
/// Integer attribute is greater than or equal to a threshold.
pub fn greater_eq(attr : StringView, value : Int) -> Condition {
  Condition(attr, GreaterEq(value))
}

///|
/// Integer attribute is less than a threshold.
pub fn less_than(attr : StringView, value : Int) -> Condition {
  Condition(attr, LessThan(value))
}

///|
/// Integer attribute is less than or equal to a threshold.
pub fn less_eq(attr : StringView, value : Int) -> Condition {
  Condition(attr, LessEq(value))
}

///|
/// Build a segment.
#alias(new, deprecated="Use `Segment()` instead")
pub fn Segment::Segment(
  key : StringView,
  include_users? : ArrayView[String] = [],
  exclude_users? : ArrayView[String] = [],
  conditions? : ArrayView[Condition] = [],
) -> Segment {
  {
    key: key.to_owned(),
    include_users: include_users.to_owned(),
    exclude_users: exclude_users.to_owned(),
    conditions: conditions.to_owned(),
  }
}

///|
/// Build a weighted variant.
#alias(new, deprecated="Use `WeightedVariant()` instead")
pub fn WeightedVariant::WeightedVariant(
  variant : StringView,
  weight : Int,
) -> WeightedVariant {
  { variant: variant.to_owned(), weight }
}

///|
/// Build a deterministic rollout.
#alias(new, deprecated="Use `Rollout()` instead")
pub fn Rollout::Rollout(
  allocations : ArrayView[WeightedVariant],
  seed? : StringView = "",
) -> Rollout {
  { seed: seed.to_owned(), allocations: allocations.to_owned() }
}

///|
/// Build a targeting rule.
#alias(new, deprecated="Use `Rule()` instead")
pub fn Rule::Rule(
  key : StringView,
  conditions? : ArrayView[Condition] = [],
  segments? : ArrayView[String] = [],
  variant? : StringView,
  rollout? : Rollout,
  reason? : StringView = "target_match",
) -> Rule {
  {
    key: key.to_owned(),
    conditions: conditions.to_owned(),
    segments: segments.to_owned(),
    variant: variant.map(v => v.to_owned()),
    rollout,
    reason: reason.to_owned(),
  }
}

///|
/// Build a feature flag.
#alias(new, deprecated="Use `Flag()` instead")
pub fn Flag::Flag(
  key : StringView,
  variants : ArrayView[String],
  default_variant : StringView,
  enabled? : Bool = true,
  off_variant? : StringView,
  rules? : ArrayView[Rule] = [],
  fallthrough_variant? : StringView,
  fallthrough_rollout? : Rollout,
) -> Flag {
  let default_variant = default_variant.to_owned()
  {
    key: key.to_owned(),
    enabled,
    variants: variants.to_owned(),
    default_variant,
    off_variant: off_variant.map(v => v.to_owned()).unwrap_or(default_variant),
    rules: rules.to_owned(),
    fallthrough_variant: fallthrough_variant.map(v => v.to_owned()),
    fallthrough_rollout,
  }
}
