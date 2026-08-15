///|
/// Build a diagnostic message.
#alias(new, deprecated="Use `Diagnostic()` instead")
pub fn Diagnostic::Diagnostic(
  severity : Severity,
  path : StringView,
  message : StringView,
) -> Diagnostic {
  { severity, path: path.to_owned(), message: message.to_owned() }
}

///|
/// Build an error diagnostic.
pub fn Diagnostic::error(path : StringView, message : StringView) -> Diagnostic {
  Diagnostic(Error, path, message)
}

///|
/// Build a warning diagnostic.
pub fn Diagnostic::warning(path : StringView, message : StringView) -> Diagnostic {
  Diagnostic(Warning, path, message)
}

///|
/// Return true if diagnostics contain at least one error.
pub fn has_errors(diagnostics : ArrayView[Diagnostic]) -> Bool {
  for diagnostic in diagnostics {
    if diagnostic.severity is Error {
      return true
    }
  }
  false
}

///|
/// Validate a single flag without segment cross-reference checks.
pub fn validate_flag(flag : Flag) -> Array[Diagnostic] {
  let diagnostics : Array[Diagnostic] = []
  validate_flag_shape(flag, diagnostics)
  validate_rules(flag, Map([]), false, diagnostics)
  diagnostics
}

///|
/// Validate a flag set including segment references.
pub fn validate_set(set : FlagSet) -> Array[Diagnostic] {
  let diagnostics : Array[Diagnostic] = []
  set.flags.each((_key, flag) => {
    validate_flag_shape(flag, diagnostics)
    validate_rules(flag, set.segments, true, diagnostics)
  })
  set.segments.each((_key, segment) => validate_segment(segment, diagnostics))
  diagnostics
}

///|
fn validate_flag_shape(flag : Flag, diagnostics : Array[Diagnostic]) -> Unit {
  let path = "flags." + flag.key
  if flag.key.is_empty() {
    diagnostics.push(Diagnostic::error("flags", "flag key must not be empty"))
  }
  if flag.variants.is_empty() {
    diagnostics.push(Diagnostic::error(path, "flag must define at least one variant"))
  }
  push_duplicate_warnings(path + ".variants", flag.variants, diagnostics)
  if !flag.variants.contains(flag.default_variant) {
    diagnostics.push(
      Diagnostic::error(
        path + ".default_variant",
        "default variant must be listed in variants",
      ),
    )
  }
  if !flag.variants.contains(flag.off_variant) {
    diagnostics.push(
      Diagnostic::error(
        path + ".off_variant",
        "off variant must be listed in variants",
      ),
    )
  }
  match flag.fallthrough_variant {
    Some(variant) =>
      if !flag.variants.contains(variant) {
        diagnostics.push(
          Diagnostic::error(
            path + ".fallthrough_variant",
            "fallthrough variant must be listed in variants",
          ),
        )
      }
    None => ()
  }
  match flag.fallthrough_rollout {
    Some(rollout) => validate_rollout(path + ".fallthrough_rollout", rollout, flag, diagnostics)
    None => ()
  }
}

///|
fn validate_rules(
  flag : Flag,
  segments : Map[String, Segment],
  check_segments : Bool,
  diagnostics : Array[Diagnostic],
) -> Unit {
  let seen : Map[String, Bool] = Map([])
  for i, rule in flag.rules {
    let path = "flags." + flag.key + ".rules[" + i.to_string() + "]"
    if rule.key.is_empty() {
      diagnostics.push(Diagnostic::error(path, "rule key must not be empty"))
    } else if seen.contains(rule.key) {
      diagnostics.push(Diagnostic::warning(path, "rule key is duplicated"))
    } else {
      seen[rule.key] = true
    }
    if rule.conditions.is_empty() && rule.segments.is_empty() {
      diagnostics.push(
        Diagnostic::warning(path, "rule has no conditions or segments and will match every context"),
      )
    }
    match rule.variant {
      Some(variant) =>
        if !flag.variants.contains(variant) {
          diagnostics.push(
            Diagnostic::error(path + ".variant", "rule variant must be listed in flag variants"),
          )
        }
      None => ()
    }
    match rule.rollout {
      Some(rollout) => validate_rollout(path + ".rollout", rollout, flag, diagnostics)
      None =>
        if rule.variant is None {
          diagnostics.push(
            Diagnostic::warning(path, "rule has neither variant nor rollout and will use default"),
          )
        }
    }
    if rule.variant is Some(_) && rule.rollout is Some(_) {
      diagnostics.push(
        Diagnostic::warning(path, "rule defines both variant and rollout; rollout takes precedence"),
      )
    }
    if check_segments {
      for segment_key in rule.segments {
        if !segments.contains(segment_key) {
          diagnostics.push(
            Diagnostic::error(path + ".segments", "unknown segment: " + segment_key),
          )
        }
      }
    }
  }
}

///|
fn validate_rollout(
  path : String,
  rollout : Rollout,
  flag : Flag,
  diagnostics : Array[Diagnostic],
) -> Unit {
  if rollout.allocations.is_empty() {
    diagnostics.push(Diagnostic::error(path, "rollout must define allocations"))
    return
  }
  let mut total = 0
  for i, allocation in rollout.allocations {
    let item_path = path + ".allocations[" + i.to_string() + "]"
    if allocation.variant.is_empty() {
      diagnostics.push(Diagnostic::error(item_path, "allocation variant must not be empty"))
    }
    if !flag.variants.contains(allocation.variant) {
      diagnostics.push(
        Diagnostic::error(item_path, "allocation variant must be listed in flag variants"),
      )
    }
    if allocation.weight < 0 {
      diagnostics.push(Diagnostic::error(item_path, "allocation weight must be >= 0"))
    }
    if allocation.weight > 10000 {
      diagnostics.push(Diagnostic::error(item_path, "allocation weight must be <= 10000"))
    }
    total = total + allocation.weight
  }
  if total > 10000 {
    diagnostics.push(Diagnostic::error(path, "rollout total weight must be <= 10000"))
  } else if total < 10000 {
    diagnostics.push(
      Diagnostic::warning(
        path,
        "rollout total weight is below 10000; uncovered buckets use default variant",
      ),
    )
  }
}

///|
fn validate_segment(segment : Segment, diagnostics : Array[Diagnostic]) -> Unit {
  let path = "segments." + segment.key
  if segment.key.is_empty() {
    diagnostics.push(Diagnostic::error("segments", "segment key must not be empty"))
  }
  if segment.include_users.is_empty() && segment.conditions.is_empty() {
    diagnostics.push(
      Diagnostic::warning(
        path,
        "segment has no include users or conditions and only matches contexts explicitly excluded from nothing",
      ),
    )
  }
  for user in segment.include_users {
    if segment.exclude_users.contains(user) {
      diagnostics.push(
        Diagnostic::error(path, "user " + user + " appears in both include and exclude lists"),
      )
    }
  }
  push_duplicate_warnings(path + ".include_users", segment.include_users, diagnostics)
  push_duplicate_warnings(path + ".exclude_users", segment.exclude_users, diagnostics)
}

///|
fn push_duplicate_warnings(
  path : String,
  values : Array[String],
  diagnostics : Array[Diagnostic],
) -> Unit {
  let seen : Map[String, Bool] = Map([])
  for value in values {
    if seen.contains(value) {
      diagnostics.push(Diagnostic::warning(path, "duplicate value: " + value))
    } else {
      seen[value] = true
    }
  }
}
