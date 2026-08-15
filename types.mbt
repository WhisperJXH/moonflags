///|
/// Values that can be attached to an evaluation context.
pub(all) enum Attribute {
  Str(String)
  Int(Int)
  Bool(Bool)
  Strings(Array[String])
} derive(Eq, @debug.Debug)

///|
/// Matchers supported by MoonFlags conditions.
pub(all) enum Matcher {
  Exists
  Missing
  Is(Attribute)
  IsNot(Attribute)
  OneOf(Array[Attribute])
  Contains(String)
  ContainsAny(Array[String])
  StartsWith(String)
  EndsWith(String)
  GreaterThan(Int)
  GreaterEq(Int)
  LessThan(Int)
  LessEq(Int)
} derive(Eq, @debug.Debug)

///|
/// A single attribute predicate.
pub struct Condition {
  attr : String
  matcher : Matcher
} derive(Eq, @debug.Debug)

///|
/// Named segment used to reuse a targeting predicate across flags.
pub struct Segment {
  key : String
  include_users : Array[String]
  exclude_users : Array[String]
  conditions : Array[Condition]
} derive(Eq, @debug.Debug)

///|
/// One weighted variant inside a percentage rollout.
///
/// Weight is expressed in basis points: `10000` means 100%.
pub struct WeightedVariant {
  variant : String
  weight : Int
} derive(Eq, @debug.Debug)

///|
/// Deterministic percentage rollout configuration.
pub struct Rollout {
  seed : String
  allocations : Array[WeightedVariant]
} derive(Eq, @debug.Debug)

///|
/// A targeting rule. All `conditions` must pass. Referenced `segments` must
/// also pass when a `FlagSet` is used for evaluation.
pub struct Rule {
  key : String
  conditions : Array[Condition]
  segments : Array[String]
  variant : String?
  rollout : Rollout?
  reason : String
} derive(Eq, @debug.Debug)

///|
/// A feature flag with ordered rules and a fallthrough behavior.
pub struct Flag {
  key : String
  enabled : Bool
  variants : Array[String]
  default_variant : String
  off_variant : String
  rules : Array[Rule]
  fallthrough_variant : String?
  fallthrough_rollout : Rollout?
} derive(Eq, @debug.Debug)

///|
/// A reusable collection of flags and named segments.
pub struct FlagSet {
  flags : Map[String, Flag]
  segments : Map[String, Segment]
} derive(Eq, @debug.Debug)

///|
/// Request attributes used for a single flag evaluation.
pub struct Context {
  user_key : String?
  attributes : Map[String, Attribute]
} derive(Eq, @debug.Debug)

///|
/// Result returned by flag evaluation.
pub struct Evaluation {
  flag_key : String
  variant : String
  reason : String
  matched : Bool
  rule_key : String?
  bucket : Int?
  warnings : Array[String]
} derive(Eq, @debug.Debug)

///|
/// Validation severity.
pub(all) enum Severity {
  Error
  Warning
} derive(Eq, @debug.Debug)

///|
/// Validation message returned by `validate_flag` and `validate_set`.
pub struct Diagnostic {
  severity : Severity
  path : String
  message : String
} derive(Eq, @debug.Debug)
