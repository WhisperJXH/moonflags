///|
/// Create a context for evaluating flags.
#alias(new, deprecated="Use `Context()` instead")
pub fn Context::Context(
  user_key? : StringView,
  attributes? : Map[String, Attribute] = Map([]),
) -> Context {
  { user_key: user_key.map(v => v.to_owned()), attributes }
}

///|
/// Attach a string attribute and return the same context for chaining.
pub fn Context::with_str(
  self : Context,
  key : StringView,
  value : StringView,
) -> Context {
  self.attributes[key.to_owned()] = Str(value.to_owned())
  self
}

///|
/// Attach an integer attribute and return the same context for chaining.
pub fn Context::with_int(
  self : Context,
  key : StringView,
  value : Int,
) -> Context {
  self.attributes[key.to_owned()] = Int(value)
  self
}

///|
/// Attach a boolean attribute and return the same context for chaining.
pub fn Context::with_bool(
  self : Context,
  key : StringView,
  value : Bool,
) -> Context {
  self.attributes[key.to_owned()] = Bool(value)
  self
}

///|
/// Attach a string-list attribute and return the same context for chaining.
pub fn Context::with_strings(
  self : Context,
  key : StringView,
  values : ArrayView[String],
) -> Context {
  self.attributes[key.to_owned()] = Strings(values.to_owned())
  self
}

///|
/// Read an attribute by key.
pub fn Context::get(self : Context, key : StringView) -> Attribute? {
  self.attributes.get(key.to_owned())
}

///|
/// Check whether the context contains an attribute key.
pub fn Context::contains(self : Context, key : StringView) -> Bool {
  self.attributes.contains(key.to_owned())
}

///|
/// Create a single string attribute.
pub fn attr_str(value : StringView) -> Attribute {
  Str(value.to_owned())
}

///|
/// Create a single integer attribute.
pub fn attr_int(value : Int) -> Attribute {
  Int(value)
}

///|
/// Create a single boolean attribute.
pub fn attr_bool(value : Bool) -> Attribute {
  Bool(value)
}

///|
/// Create a string-list attribute.
pub fn attr_strings(values : ArrayView[String]) -> Attribute {
  Strings(values.to_owned())
}

///|
/// Create an empty flag set.
#alias(new, deprecated="Use `FlagSet()` instead")
pub fn FlagSet::FlagSet(
  flags? : ArrayView[Flag] = [],
  segments? : ArrayView[Segment] = [],
) -> FlagSet {
  let flag_map : Map[String, Flag] = Map([])
  for flag in flags {
    flag_map[flag.key] = flag
  }
  let segment_map : Map[String, Segment] = Map([])
  for segment in segments {
    segment_map[segment.key] = segment
  }
  { flags: flag_map, segments: segment_map }
}

///|
/// Add or replace a flag in a flag set.
pub fn FlagSet::with_flag(self : FlagSet, flag : Flag) -> FlagSet {
  self.flags[flag.key] = flag
  self
}

///|
/// Add or replace a segment in a flag set.
pub fn FlagSet::with_segment(self : FlagSet, segment : Segment) -> FlagSet {
  self.segments[segment.key] = segment
  self
}
