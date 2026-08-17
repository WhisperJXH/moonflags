///|
/// Common feature-flag recipes for application teams.
///
/// The catalog is intentionally API-based so projects can start with
/// strongly typed MoonBit declarations and later move selected recipes
/// into their own configuration layer.

///|
pub fn preset_checkout_cn_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1000), WeightedVariant("treatment", 9000)],
    seed="checkout_cn_free_viewer",
  )
  Rule(
    "checkout_cn_free_viewer",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 16),
    ],
    rollout~,
    reason="preset_checkout_cn_free_viewer",
  )
}

///|
pub fn preset_checkout_cn_free_viewer_flag() -> Flag {
  Flag(
    "checkout_cn_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_checkout_cn_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_checkout_cn_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 16)
}

///|
pub fn preset_checkout_us_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1137), WeightedVariant("treatment", 8863)],
    seed="checkout_us_pro_editor",
  )
  Rule(
    "checkout_us_pro_editor",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 17),
    ],
    rollout~,
    reason="preset_checkout_us_pro_editor",
  )
}

///|
pub fn preset_checkout_us_pro_editor_flag() -> Flag {
  Flag(
    "checkout_us_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_checkout_us_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_checkout_us_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 17)
}

///|
pub fn preset_checkout_jp_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1274), WeightedVariant("treatment", 8726)],
    seed="checkout_jp_team_admin",
  )
  Rule(
    "checkout_jp_team_admin",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 18),
    ],
    rollout~,
    reason="preset_checkout_jp_team_admin",
  )
}

///|
pub fn preset_checkout_jp_team_admin_flag() -> Flag {
  Flag(
    "checkout_jp_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_checkout_jp_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_checkout_jp_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 18)
}

///|
pub fn preset_checkout_sg_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1411), WeightedVariant("treatment", 8589)],
    seed="checkout_sg_enterprise_operator",
  )
  Rule(
    "checkout_sg_enterprise_operator",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 19),
    ],
    rollout~,
    reason="preset_checkout_sg_enterprise_operator",
  )
}

///|
pub fn preset_checkout_sg_enterprise_operator_flag() -> Flag {
  Flag(
    "checkout_sg_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_checkout_sg_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_checkout_sg_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 19)
}

///|
pub fn preset_checkout_de_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1548), WeightedVariant("treatment", 8452)],
    seed="checkout_de_trial_owner",
  )
  Rule(
    "checkout_de_trial_owner",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 20),
    ],
    rollout~,
    reason="preset_checkout_de_trial_owner",
  )
}

///|
pub fn preset_checkout_de_trial_owner_flag() -> Flag {
  Flag(
    "checkout_de_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_checkout_de_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_checkout_de_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 20)
}

///|
pub fn preset_checkout_fr_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1685), WeightedVariant("treatment", 8315)],
    seed="checkout_fr_free_viewer",
  )
  Rule(
    "checkout_fr_free_viewer",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 21),
    ],
    rollout~,
    reason="preset_checkout_fr_free_viewer",
  )
}

///|
pub fn preset_checkout_fr_free_viewer_flag() -> Flag {
  Flag(
    "checkout_fr_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_checkout_fr_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_checkout_fr_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 21)
}

///|
pub fn preset_checkout_br_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1822), WeightedVariant("treatment", 8178)],
    seed="checkout_br_pro_editor",
  )
  Rule(
    "checkout_br_pro_editor",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 22),
    ],
    rollout~,
    reason="preset_checkout_br_pro_editor",
  )
}

///|
pub fn preset_checkout_br_pro_editor_flag() -> Flag {
  Flag(
    "checkout_br_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_checkout_br_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_checkout_br_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 22)
}

///|
pub fn preset_navigation_cn_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1959), WeightedVariant("treatment", 8041)],
    seed="navigation_cn_team_admin",
  )
  Rule(
    "navigation_cn_team_admin",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 23),
    ],
    rollout~,
    reason="preset_navigation_cn_team_admin",
  )
}

///|
pub fn preset_navigation_cn_team_admin_flag() -> Flag {
  Flag(
    "navigation_cn_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_navigation_cn_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_navigation_cn_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 23)
}

///|
pub fn preset_navigation_us_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2096), WeightedVariant("treatment", 7904)],
    seed="navigation_us_enterprise_operator",
  )
  Rule(
    "navigation_us_enterprise_operator",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 24),
    ],
    rollout~,
    reason="preset_navigation_us_enterprise_operator",
  )
}

///|
pub fn preset_navigation_us_enterprise_operator_flag() -> Flag {
  Flag(
    "navigation_us_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_navigation_us_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_navigation_us_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 24)
}

///|
pub fn preset_navigation_jp_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2233), WeightedVariant("treatment", 7767)],
    seed="navigation_jp_trial_owner",
  )
  Rule(
    "navigation_jp_trial_owner",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 25),
    ],
    rollout~,
    reason="preset_navigation_jp_trial_owner",
  )
}

///|
pub fn preset_navigation_jp_trial_owner_flag() -> Flag {
  Flag(
    "navigation_jp_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_navigation_jp_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_navigation_jp_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 25)
}

///|
pub fn preset_navigation_sg_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2370), WeightedVariant("treatment", 7630)],
    seed="navigation_sg_free_viewer",
  )
  Rule(
    "navigation_sg_free_viewer",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 26),
    ],
    rollout~,
    reason="preset_navigation_sg_free_viewer",
  )
}

///|
pub fn preset_navigation_sg_free_viewer_flag() -> Flag {
  Flag(
    "navigation_sg_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_navigation_sg_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_navigation_sg_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 26)
}

///|
pub fn preset_navigation_de_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2507), WeightedVariant("treatment", 7493)],
    seed="navigation_de_pro_editor",
  )
  Rule(
    "navigation_de_pro_editor",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 27),
    ],
    rollout~,
    reason="preset_navigation_de_pro_editor",
  )
}

///|
pub fn preset_navigation_de_pro_editor_flag() -> Flag {
  Flag(
    "navigation_de_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_navigation_de_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_navigation_de_pro_editor_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 27)
}

///|
pub fn preset_navigation_fr_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2644), WeightedVariant("treatment", 7356)],
    seed="navigation_fr_team_admin",
  )
  Rule(
    "navigation_fr_team_admin",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 28),
    ],
    rollout~,
    reason="preset_navigation_fr_team_admin",
  )
}

///|
pub fn preset_navigation_fr_team_admin_flag() -> Flag {
  Flag(
    "navigation_fr_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_navigation_fr_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_navigation_fr_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 28)
}

///|
pub fn preset_navigation_br_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2781), WeightedVariant("treatment", 7219)],
    seed="navigation_br_enterprise_operator",
  )
  Rule(
    "navigation_br_enterprise_operator",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 29),
    ],
    rollout~,
    reason="preset_navigation_br_enterprise_operator",
  )
}

///|
pub fn preset_navigation_br_enterprise_operator_flag() -> Flag {
  Flag(
    "navigation_br_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_navigation_br_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_navigation_br_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 29)
}

///|
pub fn preset_pricing_cn_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2918), WeightedVariant("treatment", 7082)],
    seed="pricing_cn_trial_owner",
  )
  Rule(
    "pricing_cn_trial_owner",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 30),
    ],
    rollout~,
    reason="preset_pricing_cn_trial_owner",
  )
}

///|
pub fn preset_pricing_cn_trial_owner_flag() -> Flag {
  Flag(
    "pricing_cn_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_pricing_cn_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_pricing_cn_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 30)
}

///|
pub fn preset_pricing_us_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3055), WeightedVariant("treatment", 6945)],
    seed="pricing_us_free_viewer",
  )
  Rule(
    "pricing_us_free_viewer",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 31),
    ],
    rollout~,
    reason="preset_pricing_us_free_viewer",
  )
}

///|
pub fn preset_pricing_us_free_viewer_flag() -> Flag {
  Flag(
    "pricing_us_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_pricing_us_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_pricing_us_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 31)
}

///|
pub fn preset_pricing_jp_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3192), WeightedVariant("treatment", 6808)],
    seed="pricing_jp_pro_editor",
  )
  Rule(
    "pricing_jp_pro_editor",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 32),
    ],
    rollout~,
    reason="preset_pricing_jp_pro_editor",
  )
}

///|
pub fn preset_pricing_jp_pro_editor_flag() -> Flag {
  Flag(
    "pricing_jp_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_pricing_jp_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_pricing_jp_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 32)
}

///|
pub fn preset_pricing_sg_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3329), WeightedVariant("treatment", 6671)],
    seed="pricing_sg_team_admin",
  )
  Rule(
    "pricing_sg_team_admin",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 33),
    ],
    rollout~,
    reason="preset_pricing_sg_team_admin",
  )
}

///|
pub fn preset_pricing_sg_team_admin_flag() -> Flag {
  Flag(
    "pricing_sg_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_pricing_sg_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_pricing_sg_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 33)
}

///|
pub fn preset_pricing_de_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3466), WeightedVariant("treatment", 6534)],
    seed="pricing_de_enterprise_operator",
  )
  Rule(
    "pricing_de_enterprise_operator",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 34),
    ],
    rollout~,
    reason="preset_pricing_de_enterprise_operator",
  )
}

///|
pub fn preset_pricing_de_enterprise_operator_flag() -> Flag {
  Flag(
    "pricing_de_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_pricing_de_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_pricing_de_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 34)
}

///|
pub fn preset_pricing_fr_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3603), WeightedVariant("treatment", 6397)],
    seed="pricing_fr_trial_owner",
  )
  Rule(
    "pricing_fr_trial_owner",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 35),
    ],
    rollout~,
    reason="preset_pricing_fr_trial_owner",
  )
}

///|
pub fn preset_pricing_fr_trial_owner_flag() -> Flag {
  Flag(
    "pricing_fr_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_pricing_fr_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_pricing_fr_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 35)
}

///|
pub fn preset_pricing_br_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3740), WeightedVariant("treatment", 6260)],
    seed="pricing_br_free_viewer",
  )
  Rule(
    "pricing_br_free_viewer",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 36),
    ],
    rollout~,
    reason="preset_pricing_br_free_viewer",
  )
}

///|
pub fn preset_pricing_br_free_viewer_flag() -> Flag {
  Flag(
    "pricing_br_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_pricing_br_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_pricing_br_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 36)
}

///|
pub fn preset_search_cn_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3877), WeightedVariant("treatment", 6123)],
    seed="search_cn_pro_editor",
  )
  Rule(
    "search_cn_pro_editor",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 37),
    ],
    rollout~,
    reason="preset_search_cn_pro_editor",
  )
}

///|
pub fn preset_search_cn_pro_editor_flag() -> Flag {
  Flag(
    "search_cn_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_search_cn_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_search_cn_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 37)
}

///|
pub fn preset_search_us_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4014), WeightedVariant("treatment", 5986)],
    seed="search_us_team_admin",
  )
  Rule(
    "search_us_team_admin",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 38),
    ],
    rollout~,
    reason="preset_search_us_team_admin",
  )
}

///|
pub fn preset_search_us_team_admin_flag() -> Flag {
  Flag(
    "search_us_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_search_us_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_search_us_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 38)
}

///|
pub fn preset_search_jp_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4151), WeightedVariant("treatment", 5849)],
    seed="search_jp_enterprise_operator",
  )
  Rule(
    "search_jp_enterprise_operator",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 39),
    ],
    rollout~,
    reason="preset_search_jp_enterprise_operator",
  )
}

///|
pub fn preset_search_jp_enterprise_operator_flag() -> Flag {
  Flag(
    "search_jp_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_search_jp_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_search_jp_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 39)
}

///|
pub fn preset_search_sg_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4288), WeightedVariant("treatment", 5712)],
    seed="search_sg_trial_owner",
  )
  Rule(
    "search_sg_trial_owner",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 40),
    ],
    rollout~,
    reason="preset_search_sg_trial_owner",
  )
}

///|
pub fn preset_search_sg_trial_owner_flag() -> Flag {
  Flag(
    "search_sg_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_search_sg_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_search_sg_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 40)
}

///|
pub fn preset_search_de_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4425), WeightedVariant("treatment", 5575)],
    seed="search_de_free_viewer",
  )
  Rule(
    "search_de_free_viewer",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 41),
    ],
    rollout~,
    reason="preset_search_de_free_viewer",
  )
}

///|
pub fn preset_search_de_free_viewer_flag() -> Flag {
  Flag(
    "search_de_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_search_de_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_search_de_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 41)
}

///|
pub fn preset_search_fr_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4562), WeightedVariant("treatment", 5438)],
    seed="search_fr_pro_editor",
  )
  Rule(
    "search_fr_pro_editor",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 42),
    ],
    rollout~,
    reason="preset_search_fr_pro_editor",
  )
}

///|
pub fn preset_search_fr_pro_editor_flag() -> Flag {
  Flag(
    "search_fr_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_search_fr_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_search_fr_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 42)
}

///|
pub fn preset_search_br_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4699), WeightedVariant("treatment", 5301)],
    seed="search_br_team_admin",
  )
  Rule(
    "search_br_team_admin",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 43),
    ],
    rollout~,
    reason="preset_search_br_team_admin",
  )
}

///|
pub fn preset_search_br_team_admin_flag() -> Flag {
  Flag(
    "search_br_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_search_br_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_search_br_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 43)
}

///|
pub fn preset_recommendation_cn_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4836), WeightedVariant("treatment", 5164)],
    seed="recommendation_cn_enterprise_operator",
  )
  Rule(
    "recommendation_cn_enterprise_operator",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 44),
    ],
    rollout~,
    reason="preset_recommendation_cn_enterprise_operator",
  )
}

///|
pub fn preset_recommendation_cn_enterprise_operator_flag() -> Flag {
  Flag(
    "recommendation_cn_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_recommendation_cn_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_recommendation_cn_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 44)
}

///|
pub fn preset_recommendation_us_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4973), WeightedVariant("treatment", 5027)],
    seed="recommendation_us_trial_owner",
  )
  Rule(
    "recommendation_us_trial_owner",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 45),
    ],
    rollout~,
    reason="preset_recommendation_us_trial_owner",
  )
}

///|
pub fn preset_recommendation_us_trial_owner_flag() -> Flag {
  Flag(
    "recommendation_us_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_recommendation_us_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_recommendation_us_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 45)
}

///|
pub fn preset_recommendation_jp_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5110), WeightedVariant("treatment", 4890)],
    seed="recommendation_jp_free_viewer",
  )
  Rule(
    "recommendation_jp_free_viewer",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 46),
    ],
    rollout~,
    reason="preset_recommendation_jp_free_viewer",
  )
}

///|
pub fn preset_recommendation_jp_free_viewer_flag() -> Flag {
  Flag(
    "recommendation_jp_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_recommendation_jp_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_recommendation_jp_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 46)
}

///|
pub fn preset_recommendation_sg_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5247), WeightedVariant("treatment", 4753)],
    seed="recommendation_sg_pro_editor",
  )
  Rule(
    "recommendation_sg_pro_editor",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 47),
    ],
    rollout~,
    reason="preset_recommendation_sg_pro_editor",
  )
}

///|
pub fn preset_recommendation_sg_pro_editor_flag() -> Flag {
  Flag(
    "recommendation_sg_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_recommendation_sg_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_recommendation_sg_pro_editor_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 47)
}

///|
pub fn preset_recommendation_de_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5384), WeightedVariant("treatment", 4616)],
    seed="recommendation_de_team_admin",
  )
  Rule(
    "recommendation_de_team_admin",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 48),
    ],
    rollout~,
    reason="preset_recommendation_de_team_admin",
  )
}

///|
pub fn preset_recommendation_de_team_admin_flag() -> Flag {
  Flag(
    "recommendation_de_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_recommendation_de_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_recommendation_de_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 48)
}

///|
pub fn preset_recommendation_fr_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5521), WeightedVariant("treatment", 4479)],
    seed="recommendation_fr_enterprise_operator",
  )
  Rule(
    "recommendation_fr_enterprise_operator",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 49),
    ],
    rollout~,
    reason="preset_recommendation_fr_enterprise_operator",
  )
}

///|
pub fn preset_recommendation_fr_enterprise_operator_flag() -> Flag {
  Flag(
    "recommendation_fr_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_recommendation_fr_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_recommendation_fr_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 49)
}

///|
pub fn preset_recommendation_br_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5658), WeightedVariant("treatment", 4342)],
    seed="recommendation_br_trial_owner",
  )
  Rule(
    "recommendation_br_trial_owner",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 50),
    ],
    rollout~,
    reason="preset_recommendation_br_trial_owner",
  )
}

///|
pub fn preset_recommendation_br_trial_owner_flag() -> Flag {
  Flag(
    "recommendation_br_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_recommendation_br_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_recommendation_br_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 50)
}

///|
pub fn preset_onboarding_cn_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5795), WeightedVariant("treatment", 4205)],
    seed="onboarding_cn_free_viewer",
  )
  Rule(
    "onboarding_cn_free_viewer",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 16),
    ],
    rollout~,
    reason="preset_onboarding_cn_free_viewer",
  )
}

///|
pub fn preset_onboarding_cn_free_viewer_flag() -> Flag {
  Flag(
    "onboarding_cn_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_onboarding_cn_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_onboarding_cn_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 16)
}

///|
pub fn preset_onboarding_us_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5932), WeightedVariant("treatment", 4068)],
    seed="onboarding_us_pro_editor",
  )
  Rule(
    "onboarding_us_pro_editor",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 17),
    ],
    rollout~,
    reason="preset_onboarding_us_pro_editor",
  )
}

///|
pub fn preset_onboarding_us_pro_editor_flag() -> Flag {
  Flag(
    "onboarding_us_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_onboarding_us_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_onboarding_us_pro_editor_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 17)
}

///|
pub fn preset_onboarding_jp_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6069), WeightedVariant("treatment", 3931)],
    seed="onboarding_jp_team_admin",
  )
  Rule(
    "onboarding_jp_team_admin",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 18),
    ],
    rollout~,
    reason="preset_onboarding_jp_team_admin",
  )
}

///|
pub fn preset_onboarding_jp_team_admin_flag() -> Flag {
  Flag(
    "onboarding_jp_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_onboarding_jp_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_onboarding_jp_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 18)
}

///|
pub fn preset_onboarding_sg_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6206), WeightedVariant("treatment", 3794)],
    seed="onboarding_sg_enterprise_operator",
  )
  Rule(
    "onboarding_sg_enterprise_operator",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 19),
    ],
    rollout~,
    reason="preset_onboarding_sg_enterprise_operator",
  )
}

///|
pub fn preset_onboarding_sg_enterprise_operator_flag() -> Flag {
  Flag(
    "onboarding_sg_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_onboarding_sg_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_onboarding_sg_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 19)
}

///|
pub fn preset_onboarding_de_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6343), WeightedVariant("treatment", 3657)],
    seed="onboarding_de_trial_owner",
  )
  Rule(
    "onboarding_de_trial_owner",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 20),
    ],
    rollout~,
    reason="preset_onboarding_de_trial_owner",
  )
}

///|
pub fn preset_onboarding_de_trial_owner_flag() -> Flag {
  Flag(
    "onboarding_de_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_onboarding_de_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_onboarding_de_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 20)
}

///|
pub fn preset_onboarding_fr_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6480), WeightedVariant("treatment", 3520)],
    seed="onboarding_fr_free_viewer",
  )
  Rule(
    "onboarding_fr_free_viewer",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 21),
    ],
    rollout~,
    reason="preset_onboarding_fr_free_viewer",
  )
}

///|
pub fn preset_onboarding_fr_free_viewer_flag() -> Flag {
  Flag(
    "onboarding_fr_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_onboarding_fr_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_onboarding_fr_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 21)
}

///|
pub fn preset_onboarding_br_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6617), WeightedVariant("treatment", 3383)],
    seed="onboarding_br_pro_editor",
  )
  Rule(
    "onboarding_br_pro_editor",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 22),
    ],
    rollout~,
    reason="preset_onboarding_br_pro_editor",
  )
}

///|
pub fn preset_onboarding_br_pro_editor_flag() -> Flag {
  Flag(
    "onboarding_br_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_onboarding_br_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_onboarding_br_pro_editor_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 22)
}

///|
pub fn preset_billing_cn_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6754), WeightedVariant("treatment", 3246)],
    seed="billing_cn_team_admin",
  )
  Rule(
    "billing_cn_team_admin",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 23),
    ],
    rollout~,
    reason="preset_billing_cn_team_admin",
  )
}

///|
pub fn preset_billing_cn_team_admin_flag() -> Flag {
  Flag(
    "billing_cn_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_billing_cn_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_billing_cn_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 23)
}

///|
pub fn preset_billing_us_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6891), WeightedVariant("treatment", 3109)],
    seed="billing_us_enterprise_operator",
  )
  Rule(
    "billing_us_enterprise_operator",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 24),
    ],
    rollout~,
    reason="preset_billing_us_enterprise_operator",
  )
}

///|
pub fn preset_billing_us_enterprise_operator_flag() -> Flag {
  Flag(
    "billing_us_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_billing_us_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_billing_us_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 24)
}

///|
pub fn preset_billing_jp_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7028), WeightedVariant("treatment", 2972)],
    seed="billing_jp_trial_owner",
  )
  Rule(
    "billing_jp_trial_owner",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 25),
    ],
    rollout~,
    reason="preset_billing_jp_trial_owner",
  )
}

///|
pub fn preset_billing_jp_trial_owner_flag() -> Flag {
  Flag(
    "billing_jp_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_billing_jp_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_billing_jp_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 25)
}

///|
pub fn preset_billing_sg_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7165), WeightedVariant("treatment", 2835)],
    seed="billing_sg_free_viewer",
  )
  Rule(
    "billing_sg_free_viewer",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 26),
    ],
    rollout~,
    reason="preset_billing_sg_free_viewer",
  )
}

///|
pub fn preset_billing_sg_free_viewer_flag() -> Flag {
  Flag(
    "billing_sg_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_billing_sg_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_billing_sg_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 26)
}

///|
pub fn preset_billing_de_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7302), WeightedVariant("treatment", 2698)],
    seed="billing_de_pro_editor",
  )
  Rule(
    "billing_de_pro_editor",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 27),
    ],
    rollout~,
    reason="preset_billing_de_pro_editor",
  )
}

///|
pub fn preset_billing_de_pro_editor_flag() -> Flag {
  Flag(
    "billing_de_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_billing_de_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_billing_de_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 27)
}

///|
pub fn preset_billing_fr_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7439), WeightedVariant("treatment", 2561)],
    seed="billing_fr_team_admin",
  )
  Rule(
    "billing_fr_team_admin",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 28),
    ],
    rollout~,
    reason="preset_billing_fr_team_admin",
  )
}

///|
pub fn preset_billing_fr_team_admin_flag() -> Flag {
  Flag(
    "billing_fr_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_billing_fr_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_billing_fr_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 28)
}

///|
pub fn preset_billing_br_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7576), WeightedVariant("treatment", 2424)],
    seed="billing_br_enterprise_operator",
  )
  Rule(
    "billing_br_enterprise_operator",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 29),
    ],
    rollout~,
    reason="preset_billing_br_enterprise_operator",
  )
}

///|
pub fn preset_billing_br_enterprise_operator_flag() -> Flag {
  Flag(
    "billing_br_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_billing_br_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_billing_br_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 29)
}

///|
pub fn preset_analytics_cn_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7713), WeightedVariant("treatment", 2287)],
    seed="analytics_cn_trial_owner",
  )
  Rule(
    "analytics_cn_trial_owner",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 30),
    ],
    rollout~,
    reason="preset_analytics_cn_trial_owner",
  )
}

///|
pub fn preset_analytics_cn_trial_owner_flag() -> Flag {
  Flag(
    "analytics_cn_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_analytics_cn_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_analytics_cn_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 30)
}

///|
pub fn preset_analytics_us_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7850), WeightedVariant("treatment", 2150)],
    seed="analytics_us_free_viewer",
  )
  Rule(
    "analytics_us_free_viewer",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 31),
    ],
    rollout~,
    reason="preset_analytics_us_free_viewer",
  )
}

///|
pub fn preset_analytics_us_free_viewer_flag() -> Flag {
  Flag(
    "analytics_us_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_analytics_us_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_analytics_us_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 31)
}

///|
pub fn preset_analytics_jp_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7987), WeightedVariant("treatment", 2013)],
    seed="analytics_jp_pro_editor",
  )
  Rule(
    "analytics_jp_pro_editor",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 32),
    ],
    rollout~,
    reason="preset_analytics_jp_pro_editor",
  )
}

///|
pub fn preset_analytics_jp_pro_editor_flag() -> Flag {
  Flag(
    "analytics_jp_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_analytics_jp_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_analytics_jp_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 32)
}

///|
pub fn preset_analytics_sg_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8124), WeightedVariant("treatment", 1876)],
    seed="analytics_sg_team_admin",
  )
  Rule(
    "analytics_sg_team_admin",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 33),
    ],
    rollout~,
    reason="preset_analytics_sg_team_admin",
  )
}

///|
pub fn preset_analytics_sg_team_admin_flag() -> Flag {
  Flag(
    "analytics_sg_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_analytics_sg_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_analytics_sg_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 33)
}

///|
pub fn preset_analytics_de_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8261), WeightedVariant("treatment", 1739)],
    seed="analytics_de_enterprise_operator",
  )
  Rule(
    "analytics_de_enterprise_operator",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 34),
    ],
    rollout~,
    reason="preset_analytics_de_enterprise_operator",
  )
}

///|
pub fn preset_analytics_de_enterprise_operator_flag() -> Flag {
  Flag(
    "analytics_de_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_analytics_de_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_analytics_de_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 34)
}

///|
pub fn preset_analytics_fr_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8398), WeightedVariant("treatment", 1602)],
    seed="analytics_fr_trial_owner",
  )
  Rule(
    "analytics_fr_trial_owner",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 35),
    ],
    rollout~,
    reason="preset_analytics_fr_trial_owner",
  )
}

///|
pub fn preset_analytics_fr_trial_owner_flag() -> Flag {
  Flag(
    "analytics_fr_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_analytics_fr_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_analytics_fr_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 35)
}

///|
pub fn preset_analytics_br_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8535), WeightedVariant("treatment", 1465)],
    seed="analytics_br_free_viewer",
  )
  Rule(
    "analytics_br_free_viewer",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 36),
    ],
    rollout~,
    reason="preset_analytics_br_free_viewer",
  )
}

///|
pub fn preset_analytics_br_free_viewer_flag() -> Flag {
  Flag(
    "analytics_br_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_analytics_br_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_analytics_br_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 36)
}

///|
pub fn preset_notification_cn_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8672), WeightedVariant("treatment", 1328)],
    seed="notification_cn_pro_editor",
  )
  Rule(
    "notification_cn_pro_editor",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 37),
    ],
    rollout~,
    reason="preset_notification_cn_pro_editor",
  )
}

///|
pub fn preset_notification_cn_pro_editor_flag() -> Flag {
  Flag(
    "notification_cn_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_notification_cn_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_notification_cn_pro_editor_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 37)
}

///|
pub fn preset_notification_us_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8809), WeightedVariant("treatment", 1191)],
    seed="notification_us_team_admin",
  )
  Rule(
    "notification_us_team_admin",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 38),
    ],
    rollout~,
    reason="preset_notification_us_team_admin",
  )
}

///|
pub fn preset_notification_us_team_admin_flag() -> Flag {
  Flag(
    "notification_us_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_notification_us_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_notification_us_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 38)
}

///|
pub fn preset_notification_jp_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8946), WeightedVariant("treatment", 1054)],
    seed="notification_jp_enterprise_operator",
  )
  Rule(
    "notification_jp_enterprise_operator",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 39),
    ],
    rollout~,
    reason="preset_notification_jp_enterprise_operator",
  )
}

///|
pub fn preset_notification_jp_enterprise_operator_flag() -> Flag {
  Flag(
    "notification_jp_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_notification_jp_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_notification_jp_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 39)
}

///|
pub fn preset_notification_sg_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1083), WeightedVariant("treatment", 8917)],
    seed="notification_sg_trial_owner",
  )
  Rule(
    "notification_sg_trial_owner",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 40),
    ],
    rollout~,
    reason="preset_notification_sg_trial_owner",
  )
}

///|
pub fn preset_notification_sg_trial_owner_flag() -> Flag {
  Flag(
    "notification_sg_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_notification_sg_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_notification_sg_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 40)
}

///|
pub fn preset_notification_de_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1220), WeightedVariant("treatment", 8780)],
    seed="notification_de_free_viewer",
  )
  Rule(
    "notification_de_free_viewer",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 41),
    ],
    rollout~,
    reason="preset_notification_de_free_viewer",
  )
}

///|
pub fn preset_notification_de_free_viewer_flag() -> Flag {
  Flag(
    "notification_de_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_notification_de_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_notification_de_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 41)
}

///|
pub fn preset_notification_fr_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1357), WeightedVariant("treatment", 8643)],
    seed="notification_fr_pro_editor",
  )
  Rule(
    "notification_fr_pro_editor",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 42),
    ],
    rollout~,
    reason="preset_notification_fr_pro_editor",
  )
}

///|
pub fn preset_notification_fr_pro_editor_flag() -> Flag {
  Flag(
    "notification_fr_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_notification_fr_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_notification_fr_pro_editor_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 42)
}

///|
pub fn preset_notification_br_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1494), WeightedVariant("treatment", 8506)],
    seed="notification_br_team_admin",
  )
  Rule(
    "notification_br_team_admin",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 43),
    ],
    rollout~,
    reason="preset_notification_br_team_admin",
  )
}

///|
pub fn preset_notification_br_team_admin_flag() -> Flag {
  Flag(
    "notification_br_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_notification_br_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_notification_br_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 43)
}

///|
pub fn preset_profile_cn_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1631), WeightedVariant("treatment", 8369)],
    seed="profile_cn_enterprise_operator",
  )
  Rule(
    "profile_cn_enterprise_operator",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 44),
    ],
    rollout~,
    reason="preset_profile_cn_enterprise_operator",
  )
}

///|
pub fn preset_profile_cn_enterprise_operator_flag() -> Flag {
  Flag(
    "profile_cn_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_profile_cn_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_profile_cn_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 44)
}

///|
pub fn preset_profile_us_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1768), WeightedVariant("treatment", 8232)],
    seed="profile_us_trial_owner",
  )
  Rule(
    "profile_us_trial_owner",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 45),
    ],
    rollout~,
    reason="preset_profile_us_trial_owner",
  )
}

///|
pub fn preset_profile_us_trial_owner_flag() -> Flag {
  Flag(
    "profile_us_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_profile_us_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_profile_us_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 45)
}

///|
pub fn preset_profile_jp_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1905), WeightedVariant("treatment", 8095)],
    seed="profile_jp_free_viewer",
  )
  Rule(
    "profile_jp_free_viewer",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 46),
    ],
    rollout~,
    reason="preset_profile_jp_free_viewer",
  )
}

///|
pub fn preset_profile_jp_free_viewer_flag() -> Flag {
  Flag(
    "profile_jp_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_profile_jp_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_profile_jp_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 46)
}

///|
pub fn preset_profile_sg_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2042), WeightedVariant("treatment", 7958)],
    seed="profile_sg_pro_editor",
  )
  Rule(
    "profile_sg_pro_editor",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 47),
    ],
    rollout~,
    reason="preset_profile_sg_pro_editor",
  )
}

///|
pub fn preset_profile_sg_pro_editor_flag() -> Flag {
  Flag(
    "profile_sg_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_profile_sg_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_profile_sg_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 47)
}

///|
pub fn preset_profile_de_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2179), WeightedVariant("treatment", 7821)],
    seed="profile_de_team_admin",
  )
  Rule(
    "profile_de_team_admin",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 48),
    ],
    rollout~,
    reason="preset_profile_de_team_admin",
  )
}

///|
pub fn preset_profile_de_team_admin_flag() -> Flag {
  Flag(
    "profile_de_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_profile_de_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_profile_de_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 48)
}

///|
pub fn preset_profile_fr_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2316), WeightedVariant("treatment", 7684)],
    seed="profile_fr_enterprise_operator",
  )
  Rule(
    "profile_fr_enterprise_operator",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 49),
    ],
    rollout~,
    reason="preset_profile_fr_enterprise_operator",
  )
}

///|
pub fn preset_profile_fr_enterprise_operator_flag() -> Flag {
  Flag(
    "profile_fr_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_profile_fr_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_profile_fr_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 49)
}

///|
pub fn preset_profile_br_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2453), WeightedVariant("treatment", 7547)],
    seed="profile_br_trial_owner",
  )
  Rule(
    "profile_br_trial_owner",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 50),
    ],
    rollout~,
    reason="preset_profile_br_trial_owner",
  )
}

///|
pub fn preset_profile_br_trial_owner_flag() -> Flag {
  Flag(
    "profile_br_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_profile_br_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_profile_br_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 50)
}

///|
pub fn preset_editor_cn_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2590), WeightedVariant("treatment", 7410)],
    seed="editor_cn_free_viewer",
  )
  Rule(
    "editor_cn_free_viewer",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 16),
    ],
    rollout~,
    reason="preset_editor_cn_free_viewer",
  )
}

///|
pub fn preset_editor_cn_free_viewer_flag() -> Flag {
  Flag(
    "editor_cn_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_editor_cn_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_editor_cn_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 16)
}

///|
pub fn preset_editor_us_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2727), WeightedVariant("treatment", 7273)],
    seed="editor_us_pro_editor",
  )
  Rule(
    "editor_us_pro_editor",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 17),
    ],
    rollout~,
    reason="preset_editor_us_pro_editor",
  )
}

///|
pub fn preset_editor_us_pro_editor_flag() -> Flag {
  Flag(
    "editor_us_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_editor_us_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_editor_us_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 17)
}

///|
pub fn preset_editor_jp_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2864), WeightedVariant("treatment", 7136)],
    seed="editor_jp_team_admin",
  )
  Rule(
    "editor_jp_team_admin",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 18),
    ],
    rollout~,
    reason="preset_editor_jp_team_admin",
  )
}

///|
pub fn preset_editor_jp_team_admin_flag() -> Flag {
  Flag(
    "editor_jp_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_editor_jp_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_editor_jp_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 18)
}

///|
pub fn preset_editor_sg_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3001), WeightedVariant("treatment", 6999)],
    seed="editor_sg_enterprise_operator",
  )
  Rule(
    "editor_sg_enterprise_operator",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 19),
    ],
    rollout~,
    reason="preset_editor_sg_enterprise_operator",
  )
}

///|
pub fn preset_editor_sg_enterprise_operator_flag() -> Flag {
  Flag(
    "editor_sg_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_editor_sg_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_editor_sg_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 19)
}

///|
pub fn preset_editor_de_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3138), WeightedVariant("treatment", 6862)],
    seed="editor_de_trial_owner",
  )
  Rule(
    "editor_de_trial_owner",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 20),
    ],
    rollout~,
    reason="preset_editor_de_trial_owner",
  )
}

///|
pub fn preset_editor_de_trial_owner_flag() -> Flag {
  Flag(
    "editor_de_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_editor_de_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_editor_de_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 20)
}

///|
pub fn preset_editor_fr_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3275), WeightedVariant("treatment", 6725)],
    seed="editor_fr_free_viewer",
  )
  Rule(
    "editor_fr_free_viewer",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 21),
    ],
    rollout~,
    reason="preset_editor_fr_free_viewer",
  )
}

///|
pub fn preset_editor_fr_free_viewer_flag() -> Flag {
  Flag(
    "editor_fr_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_editor_fr_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_editor_fr_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 21)
}

///|
pub fn preset_editor_br_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3412), WeightedVariant("treatment", 6588)],
    seed="editor_br_pro_editor",
  )
  Rule(
    "editor_br_pro_editor",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 22),
    ],
    rollout~,
    reason="preset_editor_br_pro_editor",
  )
}

///|
pub fn preset_editor_br_pro_editor_flag() -> Flag {
  Flag(
    "editor_br_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_editor_br_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_editor_br_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 22)
}

///|
pub fn preset_dashboard_cn_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3549), WeightedVariant("treatment", 6451)],
    seed="dashboard_cn_team_admin",
  )
  Rule(
    "dashboard_cn_team_admin",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 23),
    ],
    rollout~,
    reason="preset_dashboard_cn_team_admin",
  )
}

///|
pub fn preset_dashboard_cn_team_admin_flag() -> Flag {
  Flag(
    "dashboard_cn_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_dashboard_cn_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_dashboard_cn_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 23)
}

///|
pub fn preset_dashboard_us_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3686), WeightedVariant("treatment", 6314)],
    seed="dashboard_us_enterprise_operator",
  )
  Rule(
    "dashboard_us_enterprise_operator",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 24),
    ],
    rollout~,
    reason="preset_dashboard_us_enterprise_operator",
  )
}

///|
pub fn preset_dashboard_us_enterprise_operator_flag() -> Flag {
  Flag(
    "dashboard_us_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_dashboard_us_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_dashboard_us_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 24)
}

///|
pub fn preset_dashboard_jp_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3823), WeightedVariant("treatment", 6177)],
    seed="dashboard_jp_trial_owner",
  )
  Rule(
    "dashboard_jp_trial_owner",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 25),
    ],
    rollout~,
    reason="preset_dashboard_jp_trial_owner",
  )
}

///|
pub fn preset_dashboard_jp_trial_owner_flag() -> Flag {
  Flag(
    "dashboard_jp_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_dashboard_jp_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_dashboard_jp_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 25)
}

///|
pub fn preset_dashboard_sg_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3960), WeightedVariant("treatment", 6040)],
    seed="dashboard_sg_free_viewer",
  )
  Rule(
    "dashboard_sg_free_viewer",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 26),
    ],
    rollout~,
    reason="preset_dashboard_sg_free_viewer",
  )
}

///|
pub fn preset_dashboard_sg_free_viewer_flag() -> Flag {
  Flag(
    "dashboard_sg_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_dashboard_sg_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_dashboard_sg_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 26)
}

///|
pub fn preset_dashboard_de_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4097), WeightedVariant("treatment", 5903)],
    seed="dashboard_de_pro_editor",
  )
  Rule(
    "dashboard_de_pro_editor",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 27),
    ],
    rollout~,
    reason="preset_dashboard_de_pro_editor",
  )
}

///|
pub fn preset_dashboard_de_pro_editor_flag() -> Flag {
  Flag(
    "dashboard_de_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_dashboard_de_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_dashboard_de_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 27)
}

///|
pub fn preset_dashboard_fr_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4234), WeightedVariant("treatment", 5766)],
    seed="dashboard_fr_team_admin",
  )
  Rule(
    "dashboard_fr_team_admin",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 28),
    ],
    rollout~,
    reason="preset_dashboard_fr_team_admin",
  )
}

///|
pub fn preset_dashboard_fr_team_admin_flag() -> Flag {
  Flag(
    "dashboard_fr_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_dashboard_fr_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_dashboard_fr_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 28)
}

///|
pub fn preset_dashboard_br_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4371), WeightedVariant("treatment", 5629)],
    seed="dashboard_br_enterprise_operator",
  )
  Rule(
    "dashboard_br_enterprise_operator",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 29),
    ],
    rollout~,
    reason="preset_dashboard_br_enterprise_operator",
  )
}

///|
pub fn preset_dashboard_br_enterprise_operator_flag() -> Flag {
  Flag(
    "dashboard_br_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_dashboard_br_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_dashboard_br_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 29)
}

///|
pub fn preset_workspace_cn_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4508), WeightedVariant("treatment", 5492)],
    seed="workspace_cn_trial_owner",
  )
  Rule(
    "workspace_cn_trial_owner",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 30),
    ],
    rollout~,
    reason="preset_workspace_cn_trial_owner",
  )
}

///|
pub fn preset_workspace_cn_trial_owner_flag() -> Flag {
  Flag(
    "workspace_cn_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_workspace_cn_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_workspace_cn_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 30)
}

///|
pub fn preset_workspace_us_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4645), WeightedVariant("treatment", 5355)],
    seed="workspace_us_free_viewer",
  )
  Rule(
    "workspace_us_free_viewer",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 31),
    ],
    rollout~,
    reason="preset_workspace_us_free_viewer",
  )
}

///|
pub fn preset_workspace_us_free_viewer_flag() -> Flag {
  Flag(
    "workspace_us_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_workspace_us_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_workspace_us_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 31)
}

///|
pub fn preset_workspace_jp_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4782), WeightedVariant("treatment", 5218)],
    seed="workspace_jp_pro_editor",
  )
  Rule(
    "workspace_jp_pro_editor",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 32),
    ],
    rollout~,
    reason="preset_workspace_jp_pro_editor",
  )
}

///|
pub fn preset_workspace_jp_pro_editor_flag() -> Flag {
  Flag(
    "workspace_jp_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_workspace_jp_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_workspace_jp_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 32)
}

///|
pub fn preset_workspace_sg_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4919), WeightedVariant("treatment", 5081)],
    seed="workspace_sg_team_admin",
  )
  Rule(
    "workspace_sg_team_admin",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 33),
    ],
    rollout~,
    reason="preset_workspace_sg_team_admin",
  )
}

///|
pub fn preset_workspace_sg_team_admin_flag() -> Flag {
  Flag(
    "workspace_sg_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_workspace_sg_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_workspace_sg_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 33)
}

///|
pub fn preset_workspace_de_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5056), WeightedVariant("treatment", 4944)],
    seed="workspace_de_enterprise_operator",
  )
  Rule(
    "workspace_de_enterprise_operator",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 34),
    ],
    rollout~,
    reason="preset_workspace_de_enterprise_operator",
  )
}

///|
pub fn preset_workspace_de_enterprise_operator_flag() -> Flag {
  Flag(
    "workspace_de_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_workspace_de_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_workspace_de_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 34)
}

///|
pub fn preset_workspace_fr_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5193), WeightedVariant("treatment", 4807)],
    seed="workspace_fr_trial_owner",
  )
  Rule(
    "workspace_fr_trial_owner",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 35),
    ],
    rollout~,
    reason="preset_workspace_fr_trial_owner",
  )
}

///|
pub fn preset_workspace_fr_trial_owner_flag() -> Flag {
  Flag(
    "workspace_fr_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_workspace_fr_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_workspace_fr_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 35)
}

///|
pub fn preset_workspace_br_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5330), WeightedVariant("treatment", 4670)],
    seed="workspace_br_free_viewer",
  )
  Rule(
    "workspace_br_free_viewer",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 36),
    ],
    rollout~,
    reason="preset_workspace_br_free_viewer",
  )
}

///|
pub fn preset_workspace_br_free_viewer_flag() -> Flag {
  Flag(
    "workspace_br_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_workspace_br_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_workspace_br_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 36)
}

///|
pub fn preset_reporting_cn_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5467), WeightedVariant("treatment", 4533)],
    seed="reporting_cn_pro_editor",
  )
  Rule(
    "reporting_cn_pro_editor",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 37),
    ],
    rollout~,
    reason="preset_reporting_cn_pro_editor",
  )
}

///|
pub fn preset_reporting_cn_pro_editor_flag() -> Flag {
  Flag(
    "reporting_cn_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_reporting_cn_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_reporting_cn_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 37)
}

///|
pub fn preset_reporting_us_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5604), WeightedVariant("treatment", 4396)],
    seed="reporting_us_team_admin",
  )
  Rule(
    "reporting_us_team_admin",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 38),
    ],
    rollout~,
    reason="preset_reporting_us_team_admin",
  )
}

///|
pub fn preset_reporting_us_team_admin_flag() -> Flag {
  Flag(
    "reporting_us_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_reporting_us_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_reporting_us_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 38)
}

///|
pub fn preset_reporting_jp_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5741), WeightedVariant("treatment", 4259)],
    seed="reporting_jp_enterprise_operator",
  )
  Rule(
    "reporting_jp_enterprise_operator",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 39),
    ],
    rollout~,
    reason="preset_reporting_jp_enterprise_operator",
  )
}

///|
pub fn preset_reporting_jp_enterprise_operator_flag() -> Flag {
  Flag(
    "reporting_jp_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_reporting_jp_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_reporting_jp_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 39)
}

///|
pub fn preset_reporting_sg_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5878), WeightedVariant("treatment", 4122)],
    seed="reporting_sg_trial_owner",
  )
  Rule(
    "reporting_sg_trial_owner",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 40),
    ],
    rollout~,
    reason="preset_reporting_sg_trial_owner",
  )
}

///|
pub fn preset_reporting_sg_trial_owner_flag() -> Flag {
  Flag(
    "reporting_sg_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_reporting_sg_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_reporting_sg_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 40)
}

///|
pub fn preset_reporting_de_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6015), WeightedVariant("treatment", 3985)],
    seed="reporting_de_free_viewer",
  )
  Rule(
    "reporting_de_free_viewer",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 41),
    ],
    rollout~,
    reason="preset_reporting_de_free_viewer",
  )
}

///|
pub fn preset_reporting_de_free_viewer_flag() -> Flag {
  Flag(
    "reporting_de_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_reporting_de_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_reporting_de_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 41)
}

///|
pub fn preset_reporting_fr_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6152), WeightedVariant("treatment", 3848)],
    seed="reporting_fr_pro_editor",
  )
  Rule(
    "reporting_fr_pro_editor",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 42),
    ],
    rollout~,
    reason="preset_reporting_fr_pro_editor",
  )
}

///|
pub fn preset_reporting_fr_pro_editor_flag() -> Flag {
  Flag(
    "reporting_fr_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_reporting_fr_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_reporting_fr_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 42)
}

///|
pub fn preset_reporting_br_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6289), WeightedVariant("treatment", 3711)],
    seed="reporting_br_team_admin",
  )
  Rule(
    "reporting_br_team_admin",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 43),
    ],
    rollout~,
    reason="preset_reporting_br_team_admin",
  )
}

///|
pub fn preset_reporting_br_team_admin_flag() -> Flag {
  Flag(
    "reporting_br_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_reporting_br_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_reporting_br_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 43)
}

///|
pub fn preset_export_cn_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6426), WeightedVariant("treatment", 3574)],
    seed="export_cn_enterprise_operator",
  )
  Rule(
    "export_cn_enterprise_operator",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 44),
    ],
    rollout~,
    reason="preset_export_cn_enterprise_operator",
  )
}

///|
pub fn preset_export_cn_enterprise_operator_flag() -> Flag {
  Flag(
    "export_cn_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_export_cn_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_export_cn_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 44)
}

///|
pub fn preset_export_us_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6563), WeightedVariant("treatment", 3437)],
    seed="export_us_trial_owner",
  )
  Rule(
    "export_us_trial_owner",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 45),
    ],
    rollout~,
    reason="preset_export_us_trial_owner",
  )
}

///|
pub fn preset_export_us_trial_owner_flag() -> Flag {
  Flag(
    "export_us_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_export_us_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_export_us_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 45)
}

///|
pub fn preset_export_jp_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6700), WeightedVariant("treatment", 3300)],
    seed="export_jp_free_viewer",
  )
  Rule(
    "export_jp_free_viewer",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 46),
    ],
    rollout~,
    reason="preset_export_jp_free_viewer",
  )
}

///|
pub fn preset_export_jp_free_viewer_flag() -> Flag {
  Flag(
    "export_jp_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_export_jp_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_export_jp_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 46)
}

///|
pub fn preset_export_sg_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6837), WeightedVariant("treatment", 3163)],
    seed="export_sg_pro_editor",
  )
  Rule(
    "export_sg_pro_editor",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 47),
    ],
    rollout~,
    reason="preset_export_sg_pro_editor",
  )
}

///|
pub fn preset_export_sg_pro_editor_flag() -> Flag {
  Flag(
    "export_sg_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_export_sg_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_export_sg_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 47)
}

///|
pub fn preset_export_de_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6974), WeightedVariant("treatment", 3026)],
    seed="export_de_team_admin",
  )
  Rule(
    "export_de_team_admin",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 48),
    ],
    rollout~,
    reason="preset_export_de_team_admin",
  )
}

///|
pub fn preset_export_de_team_admin_flag() -> Flag {
  Flag(
    "export_de_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_export_de_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_export_de_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 48)
}

///|
pub fn preset_export_fr_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7111), WeightedVariant("treatment", 2889)],
    seed="export_fr_enterprise_operator",
  )
  Rule(
    "export_fr_enterprise_operator",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 49),
    ],
    rollout~,
    reason="preset_export_fr_enterprise_operator",
  )
}

///|
pub fn preset_export_fr_enterprise_operator_flag() -> Flag {
  Flag(
    "export_fr_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_export_fr_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_export_fr_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 49)
}

///|
pub fn preset_export_br_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7248), WeightedVariant("treatment", 2752)],
    seed="export_br_trial_owner",
  )
  Rule(
    "export_br_trial_owner",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 50),
    ],
    rollout~,
    reason="preset_export_br_trial_owner",
  )
}

///|
pub fn preset_export_br_trial_owner_flag() -> Flag {
  Flag(
    "export_br_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_export_br_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_export_br_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 50)
}

///|
pub fn preset_import_cn_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7385), WeightedVariant("treatment", 2615)],
    seed="import_cn_free_viewer",
  )
  Rule(
    "import_cn_free_viewer",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 16),
    ],
    rollout~,
    reason="preset_import_cn_free_viewer",
  )
}

///|
pub fn preset_import_cn_free_viewer_flag() -> Flag {
  Flag(
    "import_cn_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_import_cn_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_import_cn_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 16)
}

///|
pub fn preset_import_us_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7522), WeightedVariant("treatment", 2478)],
    seed="import_us_pro_editor",
  )
  Rule(
    "import_us_pro_editor",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 17),
    ],
    rollout~,
    reason="preset_import_us_pro_editor",
  )
}

///|
pub fn preset_import_us_pro_editor_flag() -> Flag {
  Flag(
    "import_us_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_import_us_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_import_us_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 17)
}

///|
pub fn preset_import_jp_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7659), WeightedVariant("treatment", 2341)],
    seed="import_jp_team_admin",
  )
  Rule(
    "import_jp_team_admin",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 18),
    ],
    rollout~,
    reason="preset_import_jp_team_admin",
  )
}

///|
pub fn preset_import_jp_team_admin_flag() -> Flag {
  Flag(
    "import_jp_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_import_jp_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_import_jp_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 18)
}

///|
pub fn preset_import_sg_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7796), WeightedVariant("treatment", 2204)],
    seed="import_sg_enterprise_operator",
  )
  Rule(
    "import_sg_enterprise_operator",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 19),
    ],
    rollout~,
    reason="preset_import_sg_enterprise_operator",
  )
}

///|
pub fn preset_import_sg_enterprise_operator_flag() -> Flag {
  Flag(
    "import_sg_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_import_sg_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_import_sg_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 19)
}

///|
pub fn preset_import_de_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7933), WeightedVariant("treatment", 2067)],
    seed="import_de_trial_owner",
  )
  Rule(
    "import_de_trial_owner",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 20),
    ],
    rollout~,
    reason="preset_import_de_trial_owner",
  )
}

///|
pub fn preset_import_de_trial_owner_flag() -> Flag {
  Flag(
    "import_de_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_import_de_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_import_de_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 20)
}

///|
pub fn preset_import_fr_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8070), WeightedVariant("treatment", 1930)],
    seed="import_fr_free_viewer",
  )
  Rule(
    "import_fr_free_viewer",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 21),
    ],
    rollout~,
    reason="preset_import_fr_free_viewer",
  )
}

///|
pub fn preset_import_fr_free_viewer_flag() -> Flag {
  Flag(
    "import_fr_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_import_fr_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_import_fr_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 21)
}

///|
pub fn preset_import_br_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8207), WeightedVariant("treatment", 1793)],
    seed="import_br_pro_editor",
  )
  Rule(
    "import_br_pro_editor",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 22),
    ],
    rollout~,
    reason="preset_import_br_pro_editor",
  )
}

///|
pub fn preset_import_br_pro_editor_flag() -> Flag {
  Flag(
    "import_br_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_import_br_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_import_br_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 22)
}

///|
pub fn preset_integration_cn_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8344), WeightedVariant("treatment", 1656)],
    seed="integration_cn_team_admin",
  )
  Rule(
    "integration_cn_team_admin",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 23),
    ],
    rollout~,
    reason="preset_integration_cn_team_admin",
  )
}

///|
pub fn preset_integration_cn_team_admin_flag() -> Flag {
  Flag(
    "integration_cn_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_integration_cn_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_integration_cn_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 23)
}

///|
pub fn preset_integration_us_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8481), WeightedVariant("treatment", 1519)],
    seed="integration_us_enterprise_operator",
  )
  Rule(
    "integration_us_enterprise_operator",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 24),
    ],
    rollout~,
    reason="preset_integration_us_enterprise_operator",
  )
}

///|
pub fn preset_integration_us_enterprise_operator_flag() -> Flag {
  Flag(
    "integration_us_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_integration_us_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_integration_us_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 24)
}

///|
pub fn preset_integration_jp_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8618), WeightedVariant("treatment", 1382)],
    seed="integration_jp_trial_owner",
  )
  Rule(
    "integration_jp_trial_owner",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 25),
    ],
    rollout~,
    reason="preset_integration_jp_trial_owner",
  )
}

///|
pub fn preset_integration_jp_trial_owner_flag() -> Flag {
  Flag(
    "integration_jp_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_integration_jp_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_integration_jp_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 25)
}

///|
pub fn preset_integration_sg_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8755), WeightedVariant("treatment", 1245)],
    seed="integration_sg_free_viewer",
  )
  Rule(
    "integration_sg_free_viewer",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 26),
    ],
    rollout~,
    reason="preset_integration_sg_free_viewer",
  )
}

///|
pub fn preset_integration_sg_free_viewer_flag() -> Flag {
  Flag(
    "integration_sg_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_integration_sg_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_integration_sg_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 26)
}

///|
pub fn preset_integration_de_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8892), WeightedVariant("treatment", 1108)],
    seed="integration_de_pro_editor",
  )
  Rule(
    "integration_de_pro_editor",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 27),
    ],
    rollout~,
    reason="preset_integration_de_pro_editor",
  )
}

///|
pub fn preset_integration_de_pro_editor_flag() -> Flag {
  Flag(
    "integration_de_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_integration_de_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_integration_de_pro_editor_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 27)
}

///|
pub fn preset_integration_fr_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1029), WeightedVariant("treatment", 8971)],
    seed="integration_fr_team_admin",
  )
  Rule(
    "integration_fr_team_admin",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 28),
    ],
    rollout~,
    reason="preset_integration_fr_team_admin",
  )
}

///|
pub fn preset_integration_fr_team_admin_flag() -> Flag {
  Flag(
    "integration_fr_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_integration_fr_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_integration_fr_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 28)
}

///|
pub fn preset_integration_br_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1166), WeightedVariant("treatment", 8834)],
    seed="integration_br_enterprise_operator",
  )
  Rule(
    "integration_br_enterprise_operator",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 29),
    ],
    rollout~,
    reason="preset_integration_br_enterprise_operator",
  )
}

///|
pub fn preset_integration_br_enterprise_operator_flag() -> Flag {
  Flag(
    "integration_br_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_integration_br_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_integration_br_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 29)
}

///|
pub fn preset_security_cn_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1303), WeightedVariant("treatment", 8697)],
    seed="security_cn_trial_owner",
  )
  Rule(
    "security_cn_trial_owner",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 30),
    ],
    rollout~,
    reason="preset_security_cn_trial_owner",
  )
}

///|
pub fn preset_security_cn_trial_owner_flag() -> Flag {
  Flag(
    "security_cn_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_security_cn_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_security_cn_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 30)
}

///|
pub fn preset_security_us_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1440), WeightedVariant("treatment", 8560)],
    seed="security_us_free_viewer",
  )
  Rule(
    "security_us_free_viewer",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 31),
    ],
    rollout~,
    reason="preset_security_us_free_viewer",
  )
}

///|
pub fn preset_security_us_free_viewer_flag() -> Flag {
  Flag(
    "security_us_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_security_us_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_security_us_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 31)
}

///|
pub fn preset_security_jp_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1577), WeightedVariant("treatment", 8423)],
    seed="security_jp_pro_editor",
  )
  Rule(
    "security_jp_pro_editor",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 32),
    ],
    rollout~,
    reason="preset_security_jp_pro_editor",
  )
}

///|
pub fn preset_security_jp_pro_editor_flag() -> Flag {
  Flag(
    "security_jp_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_security_jp_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_security_jp_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 32)
}

///|
pub fn preset_security_sg_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1714), WeightedVariant("treatment", 8286)],
    seed="security_sg_team_admin",
  )
  Rule(
    "security_sg_team_admin",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 33),
    ],
    rollout~,
    reason="preset_security_sg_team_admin",
  )
}

///|
pub fn preset_security_sg_team_admin_flag() -> Flag {
  Flag(
    "security_sg_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_security_sg_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_security_sg_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 33)
}

///|
pub fn preset_security_de_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1851), WeightedVariant("treatment", 8149)],
    seed="security_de_enterprise_operator",
  )
  Rule(
    "security_de_enterprise_operator",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 34),
    ],
    rollout~,
    reason="preset_security_de_enterprise_operator",
  )
}

///|
pub fn preset_security_de_enterprise_operator_flag() -> Flag {
  Flag(
    "security_de_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_security_de_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_security_de_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 34)
}

///|
pub fn preset_security_fr_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 1988), WeightedVariant("treatment", 8012)],
    seed="security_fr_trial_owner",
  )
  Rule(
    "security_fr_trial_owner",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 35),
    ],
    rollout~,
    reason="preset_security_fr_trial_owner",
  )
}

///|
pub fn preset_security_fr_trial_owner_flag() -> Flag {
  Flag(
    "security_fr_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_security_fr_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_security_fr_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 35)
}

///|
pub fn preset_security_br_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2125), WeightedVariant("treatment", 7875)],
    seed="security_br_free_viewer",
  )
  Rule(
    "security_br_free_viewer",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 36),
    ],
    rollout~,
    reason="preset_security_br_free_viewer",
  )
}

///|
pub fn preset_security_br_free_viewer_flag() -> Flag {
  Flag(
    "security_br_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_security_br_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_security_br_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 36)
}

///|
pub fn preset_messaging_cn_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2262), WeightedVariant("treatment", 7738)],
    seed="messaging_cn_pro_editor",
  )
  Rule(
    "messaging_cn_pro_editor",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 37),
    ],
    rollout~,
    reason="preset_messaging_cn_pro_editor",
  )
}

///|
pub fn preset_messaging_cn_pro_editor_flag() -> Flag {
  Flag(
    "messaging_cn_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_messaging_cn_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_messaging_cn_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 37)
}

///|
pub fn preset_messaging_us_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2399), WeightedVariant("treatment", 7601)],
    seed="messaging_us_team_admin",
  )
  Rule(
    "messaging_us_team_admin",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 38),
    ],
    rollout~,
    reason="preset_messaging_us_team_admin",
  )
}

///|
pub fn preset_messaging_us_team_admin_flag() -> Flag {
  Flag(
    "messaging_us_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_messaging_us_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_messaging_us_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 38)
}

///|
pub fn preset_messaging_jp_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2536), WeightedVariant("treatment", 7464)],
    seed="messaging_jp_enterprise_operator",
  )
  Rule(
    "messaging_jp_enterprise_operator",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 39),
    ],
    rollout~,
    reason="preset_messaging_jp_enterprise_operator",
  )
}

///|
pub fn preset_messaging_jp_enterprise_operator_flag() -> Flag {
  Flag(
    "messaging_jp_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_messaging_jp_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_messaging_jp_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 39)
}

///|
pub fn preset_messaging_sg_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2673), WeightedVariant("treatment", 7327)],
    seed="messaging_sg_trial_owner",
  )
  Rule(
    "messaging_sg_trial_owner",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 40),
    ],
    rollout~,
    reason="preset_messaging_sg_trial_owner",
  )
}

///|
pub fn preset_messaging_sg_trial_owner_flag() -> Flag {
  Flag(
    "messaging_sg_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_messaging_sg_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_messaging_sg_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 40)
}

///|
pub fn preset_messaging_de_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2810), WeightedVariant("treatment", 7190)],
    seed="messaging_de_free_viewer",
  )
  Rule(
    "messaging_de_free_viewer",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 41),
    ],
    rollout~,
    reason="preset_messaging_de_free_viewer",
  )
}

///|
pub fn preset_messaging_de_free_viewer_flag() -> Flag {
  Flag(
    "messaging_de_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_messaging_de_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_messaging_de_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 41)
}

///|
pub fn preset_messaging_fr_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 2947), WeightedVariant("treatment", 7053)],
    seed="messaging_fr_pro_editor",
  )
  Rule(
    "messaging_fr_pro_editor",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 42),
    ],
    rollout~,
    reason="preset_messaging_fr_pro_editor",
  )
}

///|
pub fn preset_messaging_fr_pro_editor_flag() -> Flag {
  Flag(
    "messaging_fr_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_messaging_fr_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_messaging_fr_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 42)
}

///|
pub fn preset_messaging_br_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3084), WeightedVariant("treatment", 6916)],
    seed="messaging_br_team_admin",
  )
  Rule(
    "messaging_br_team_admin",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 43),
    ],
    rollout~,
    reason="preset_messaging_br_team_admin",
  )
}

///|
pub fn preset_messaging_br_team_admin_flag() -> Flag {
  Flag(
    "messaging_br_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_messaging_br_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_messaging_br_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 43)
}

///|
pub fn preset_scheduler_cn_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3221), WeightedVariant("treatment", 6779)],
    seed="scheduler_cn_enterprise_operator",
  )
  Rule(
    "scheduler_cn_enterprise_operator",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 44),
    ],
    rollout~,
    reason="preset_scheduler_cn_enterprise_operator",
  )
}

///|
pub fn preset_scheduler_cn_enterprise_operator_flag() -> Flag {
  Flag(
    "scheduler_cn_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_scheduler_cn_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_scheduler_cn_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 44)
}

///|
pub fn preset_scheduler_us_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3358), WeightedVariant("treatment", 6642)],
    seed="scheduler_us_trial_owner",
  )
  Rule(
    "scheduler_us_trial_owner",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 45),
    ],
    rollout~,
    reason="preset_scheduler_us_trial_owner",
  )
}

///|
pub fn preset_scheduler_us_trial_owner_flag() -> Flag {
  Flag(
    "scheduler_us_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_scheduler_us_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_scheduler_us_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 45)
}

///|
pub fn preset_scheduler_jp_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3495), WeightedVariant("treatment", 6505)],
    seed="scheduler_jp_free_viewer",
  )
  Rule(
    "scheduler_jp_free_viewer",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 46),
    ],
    rollout~,
    reason="preset_scheduler_jp_free_viewer",
  )
}

///|
pub fn preset_scheduler_jp_free_viewer_flag() -> Flag {
  Flag(
    "scheduler_jp_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_scheduler_jp_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_scheduler_jp_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 46)
}

///|
pub fn preset_scheduler_sg_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3632), WeightedVariant("treatment", 6368)],
    seed="scheduler_sg_pro_editor",
  )
  Rule(
    "scheduler_sg_pro_editor",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 47),
    ],
    rollout~,
    reason="preset_scheduler_sg_pro_editor",
  )
}

///|
pub fn preset_scheduler_sg_pro_editor_flag() -> Flag {
  Flag(
    "scheduler_sg_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_scheduler_sg_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_scheduler_sg_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 47)
}

///|
pub fn preset_scheduler_de_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3769), WeightedVariant("treatment", 6231)],
    seed="scheduler_de_team_admin",
  )
  Rule(
    "scheduler_de_team_admin",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 48),
    ],
    rollout~,
    reason="preset_scheduler_de_team_admin",
  )
}

///|
pub fn preset_scheduler_de_team_admin_flag() -> Flag {
  Flag(
    "scheduler_de_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_scheduler_de_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_scheduler_de_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 48)
}

///|
pub fn preset_scheduler_fr_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 3906), WeightedVariant("treatment", 6094)],
    seed="scheduler_fr_enterprise_operator",
  )
  Rule(
    "scheduler_fr_enterprise_operator",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 49),
    ],
    rollout~,
    reason="preset_scheduler_fr_enterprise_operator",
  )
}

///|
pub fn preset_scheduler_fr_enterprise_operator_flag() -> Flag {
  Flag(
    "scheduler_fr_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_scheduler_fr_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_scheduler_fr_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 49)
}

///|
pub fn preset_scheduler_br_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4043), WeightedVariant("treatment", 5957)],
    seed="scheduler_br_trial_owner",
  )
  Rule(
    "scheduler_br_trial_owner",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 50),
    ],
    rollout~,
    reason="preset_scheduler_br_trial_owner",
  )
}

///|
pub fn preset_scheduler_br_trial_owner_flag() -> Flag {
  Flag(
    "scheduler_br_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_scheduler_br_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_scheduler_br_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 50)
}

///|
pub fn preset_campaign_cn_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4180), WeightedVariant("treatment", 5820)],
    seed="campaign_cn_free_viewer",
  )
  Rule(
    "campaign_cn_free_viewer",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 16),
    ],
    rollout~,
    reason="preset_campaign_cn_free_viewer",
  )
}

///|
pub fn preset_campaign_cn_free_viewer_flag() -> Flag {
  Flag(
    "campaign_cn_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_campaign_cn_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_campaign_cn_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 16)
}

///|
pub fn preset_campaign_us_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4317), WeightedVariant("treatment", 5683)],
    seed="campaign_us_pro_editor",
  )
  Rule(
    "campaign_us_pro_editor",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 17),
    ],
    rollout~,
    reason="preset_campaign_us_pro_editor",
  )
}

///|
pub fn preset_campaign_us_pro_editor_flag() -> Flag {
  Flag(
    "campaign_us_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_campaign_us_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_campaign_us_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 17)
}

///|
pub fn preset_campaign_jp_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4454), WeightedVariant("treatment", 5546)],
    seed="campaign_jp_team_admin",
  )
  Rule(
    "campaign_jp_team_admin",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 18),
    ],
    rollout~,
    reason="preset_campaign_jp_team_admin",
  )
}

///|
pub fn preset_campaign_jp_team_admin_flag() -> Flag {
  Flag(
    "campaign_jp_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_campaign_jp_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_campaign_jp_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 18)
}

///|
pub fn preset_campaign_sg_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4591), WeightedVariant("treatment", 5409)],
    seed="campaign_sg_enterprise_operator",
  )
  Rule(
    "campaign_sg_enterprise_operator",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 19),
    ],
    rollout~,
    reason="preset_campaign_sg_enterprise_operator",
  )
}

///|
pub fn preset_campaign_sg_enterprise_operator_flag() -> Flag {
  Flag(
    "campaign_sg_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_campaign_sg_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_campaign_sg_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 19)
}

///|
pub fn preset_campaign_de_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4728), WeightedVariant("treatment", 5272)],
    seed="campaign_de_trial_owner",
  )
  Rule(
    "campaign_de_trial_owner",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 20),
    ],
    rollout~,
    reason="preset_campaign_de_trial_owner",
  )
}

///|
pub fn preset_campaign_de_trial_owner_flag() -> Flag {
  Flag(
    "campaign_de_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_campaign_de_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_campaign_de_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 20)
}

///|
pub fn preset_campaign_fr_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 4865), WeightedVariant("treatment", 5135)],
    seed="campaign_fr_free_viewer",
  )
  Rule(
    "campaign_fr_free_viewer",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 21),
    ],
    rollout~,
    reason="preset_campaign_fr_free_viewer",
  )
}

///|
pub fn preset_campaign_fr_free_viewer_flag() -> Flag {
  Flag(
    "campaign_fr_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_campaign_fr_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_campaign_fr_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 21)
}

///|
pub fn preset_campaign_br_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5002), WeightedVariant("treatment", 4998)],
    seed="campaign_br_pro_editor",
  )
  Rule(
    "campaign_br_pro_editor",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 22),
    ],
    rollout~,
    reason="preset_campaign_br_pro_editor",
  )
}

///|
pub fn preset_campaign_br_pro_editor_flag() -> Flag {
  Flag(
    "campaign_br_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_campaign_br_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_campaign_br_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 22)
}

///|
pub fn preset_catalog_cn_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5139), WeightedVariant("treatment", 4861)],
    seed="catalog_cn_team_admin",
  )
  Rule(
    "catalog_cn_team_admin",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 23),
    ],
    rollout~,
    reason="preset_catalog_cn_team_admin",
  )
}

///|
pub fn preset_catalog_cn_team_admin_flag() -> Flag {
  Flag(
    "catalog_cn_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_catalog_cn_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_catalog_cn_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 23)
}

///|
pub fn preset_catalog_us_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5276), WeightedVariant("treatment", 4724)],
    seed="catalog_us_enterprise_operator",
  )
  Rule(
    "catalog_us_enterprise_operator",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 24),
    ],
    rollout~,
    reason="preset_catalog_us_enterprise_operator",
  )
}

///|
pub fn preset_catalog_us_enterprise_operator_flag() -> Flag {
  Flag(
    "catalog_us_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_catalog_us_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_catalog_us_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 24)
}

///|
pub fn preset_catalog_jp_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5413), WeightedVariant("treatment", 4587)],
    seed="catalog_jp_trial_owner",
  )
  Rule(
    "catalog_jp_trial_owner",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 25),
    ],
    rollout~,
    reason="preset_catalog_jp_trial_owner",
  )
}

///|
pub fn preset_catalog_jp_trial_owner_flag() -> Flag {
  Flag(
    "catalog_jp_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_catalog_jp_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_catalog_jp_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 25)
}

///|
pub fn preset_catalog_sg_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5550), WeightedVariant("treatment", 4450)],
    seed="catalog_sg_free_viewer",
  )
  Rule(
    "catalog_sg_free_viewer",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 26),
    ],
    rollout~,
    reason="preset_catalog_sg_free_viewer",
  )
}

///|
pub fn preset_catalog_sg_free_viewer_flag() -> Flag {
  Flag(
    "catalog_sg_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_catalog_sg_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_catalog_sg_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 26)
}

///|
pub fn preset_catalog_de_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5687), WeightedVariant("treatment", 4313)],
    seed="catalog_de_pro_editor",
  )
  Rule(
    "catalog_de_pro_editor",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 27),
    ],
    rollout~,
    reason="preset_catalog_de_pro_editor",
  )
}

///|
pub fn preset_catalog_de_pro_editor_flag() -> Flag {
  Flag(
    "catalog_de_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_catalog_de_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_catalog_de_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 27)
}

///|
pub fn preset_catalog_fr_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5824), WeightedVariant("treatment", 4176)],
    seed="catalog_fr_team_admin",
  )
  Rule(
    "catalog_fr_team_admin",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 28),
    ],
    rollout~,
    reason="preset_catalog_fr_team_admin",
  )
}

///|
pub fn preset_catalog_fr_team_admin_flag() -> Flag {
  Flag(
    "catalog_fr_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_catalog_fr_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_catalog_fr_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 28)
}

///|
pub fn preset_catalog_br_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 5961), WeightedVariant("treatment", 4039)],
    seed="catalog_br_enterprise_operator",
  )
  Rule(
    "catalog_br_enterprise_operator",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 29),
    ],
    rollout~,
    reason="preset_catalog_br_enterprise_operator",
  )
}

///|
pub fn preset_catalog_br_enterprise_operator_flag() -> Flag {
  Flag(
    "catalog_br_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_catalog_br_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_catalog_br_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 29)
}

///|
pub fn preset_inventory_cn_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6098), WeightedVariant("treatment", 3902)],
    seed="inventory_cn_trial_owner",
  )
  Rule(
    "inventory_cn_trial_owner",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 30),
    ],
    rollout~,
    reason="preset_inventory_cn_trial_owner",
  )
}

///|
pub fn preset_inventory_cn_trial_owner_flag() -> Flag {
  Flag(
    "inventory_cn_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_inventory_cn_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_inventory_cn_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 30)
}

///|
pub fn preset_inventory_us_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6235), WeightedVariant("treatment", 3765)],
    seed="inventory_us_free_viewer",
  )
  Rule(
    "inventory_us_free_viewer",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 31),
    ],
    rollout~,
    reason="preset_inventory_us_free_viewer",
  )
}

///|
pub fn preset_inventory_us_free_viewer_flag() -> Flag {
  Flag(
    "inventory_us_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_inventory_us_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_inventory_us_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 31)
}

///|
pub fn preset_inventory_jp_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6372), WeightedVariant("treatment", 3628)],
    seed="inventory_jp_pro_editor",
  )
  Rule(
    "inventory_jp_pro_editor",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 32),
    ],
    rollout~,
    reason="preset_inventory_jp_pro_editor",
  )
}

///|
pub fn preset_inventory_jp_pro_editor_flag() -> Flag {
  Flag(
    "inventory_jp_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_inventory_jp_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_inventory_jp_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 32)
}

///|
pub fn preset_inventory_sg_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6509), WeightedVariant("treatment", 3491)],
    seed="inventory_sg_team_admin",
  )
  Rule(
    "inventory_sg_team_admin",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 33),
    ],
    rollout~,
    reason="preset_inventory_sg_team_admin",
  )
}

///|
pub fn preset_inventory_sg_team_admin_flag() -> Flag {
  Flag(
    "inventory_sg_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_inventory_sg_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_inventory_sg_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 33)
}

///|
pub fn preset_inventory_de_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6646), WeightedVariant("treatment", 3354)],
    seed="inventory_de_enterprise_operator",
  )
  Rule(
    "inventory_de_enterprise_operator",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 34),
    ],
    rollout~,
    reason="preset_inventory_de_enterprise_operator",
  )
}

///|
pub fn preset_inventory_de_enterprise_operator_flag() -> Flag {
  Flag(
    "inventory_de_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_inventory_de_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_inventory_de_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 34)
}

///|
pub fn preset_inventory_fr_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6783), WeightedVariant("treatment", 3217)],
    seed="inventory_fr_trial_owner",
  )
  Rule(
    "inventory_fr_trial_owner",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 35),
    ],
    rollout~,
    reason="preset_inventory_fr_trial_owner",
  )
}

///|
pub fn preset_inventory_fr_trial_owner_flag() -> Flag {
  Flag(
    "inventory_fr_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_inventory_fr_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_inventory_fr_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 35)
}

///|
pub fn preset_inventory_br_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 6920), WeightedVariant("treatment", 3080)],
    seed="inventory_br_free_viewer",
  )
  Rule(
    "inventory_br_free_viewer",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 36),
    ],
    rollout~,
    reason="preset_inventory_br_free_viewer",
  )
}

///|
pub fn preset_inventory_br_free_viewer_flag() -> Flag {
  Flag(
    "inventory_br_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_inventory_br_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_inventory_br_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 36)
}

///|
pub fn preset_support_cn_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7057), WeightedVariant("treatment", 2943)],
    seed="support_cn_pro_editor",
  )
  Rule(
    "support_cn_pro_editor",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 37),
    ],
    rollout~,
    reason="preset_support_cn_pro_editor",
  )
}

///|
pub fn preset_support_cn_pro_editor_flag() -> Flag {
  Flag(
    "support_cn_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_support_cn_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_support_cn_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 37)
}

///|
pub fn preset_support_us_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7194), WeightedVariant("treatment", 2806)],
    seed="support_us_team_admin",
  )
  Rule(
    "support_us_team_admin",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 38),
    ],
    rollout~,
    reason="preset_support_us_team_admin",
  )
}

///|
pub fn preset_support_us_team_admin_flag() -> Flag {
  Flag(
    "support_us_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_support_us_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_support_us_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 38)
}

///|
pub fn preset_support_jp_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7331), WeightedVariant("treatment", 2669)],
    seed="support_jp_enterprise_operator",
  )
  Rule(
    "support_jp_enterprise_operator",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 39),
    ],
    rollout~,
    reason="preset_support_jp_enterprise_operator",
  )
}

///|
pub fn preset_support_jp_enterprise_operator_flag() -> Flag {
  Flag(
    "support_jp_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_support_jp_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_support_jp_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 39)
}

///|
pub fn preset_support_sg_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7468), WeightedVariant("treatment", 2532)],
    seed="support_sg_trial_owner",
  )
  Rule(
    "support_sg_trial_owner",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 40),
    ],
    rollout~,
    reason="preset_support_sg_trial_owner",
  )
}

///|
pub fn preset_support_sg_trial_owner_flag() -> Flag {
  Flag(
    "support_sg_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_support_sg_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_support_sg_trial_owner_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 40)
}

///|
pub fn preset_support_de_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7605), WeightedVariant("treatment", 2395)],
    seed="support_de_free_viewer",
  )
  Rule(
    "support_de_free_viewer",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 41),
    ],
    rollout~,
    reason="preset_support_de_free_viewer",
  )
}

///|
pub fn preset_support_de_free_viewer_flag() -> Flag {
  Flag(
    "support_de_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_support_de_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_support_de_free_viewer_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 41)
}

///|
pub fn preset_support_fr_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7742), WeightedVariant("treatment", 2258)],
    seed="support_fr_pro_editor",
  )
  Rule(
    "support_fr_pro_editor",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 42),
    ],
    rollout~,
    reason="preset_support_fr_pro_editor",
  )
}

///|
pub fn preset_support_fr_pro_editor_flag() -> Flag {
  Flag(
    "support_fr_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_support_fr_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_support_fr_pro_editor_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 42)
}

///|
pub fn preset_support_br_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 7879), WeightedVariant("treatment", 2121)],
    seed="support_br_team_admin",
  )
  Rule(
    "support_br_team_admin",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 43),
    ],
    rollout~,
    reason="preset_support_br_team_admin",
  )
}

///|
pub fn preset_support_br_team_admin_flag() -> Flag {
  Flag(
    "support_br_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_support_br_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_support_br_team_admin_context(user_key : StringView) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 43)
}

///|
pub fn preset_moderation_cn_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8016), WeightedVariant("treatment", 1984)],
    seed="moderation_cn_enterprise_operator",
  )
  Rule(
    "moderation_cn_enterprise_operator",
    conditions=[
      str_eq("country", "CN"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 44),
    ],
    rollout~,
    reason="preset_moderation_cn_enterprise_operator",
  )
}

///|
pub fn preset_moderation_cn_enterprise_operator_flag() -> Flag {
  Flag(
    "moderation_cn_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_moderation_cn_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_moderation_cn_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "CN")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 44)
}

///|
pub fn preset_moderation_us_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8153), WeightedVariant("treatment", 1847)],
    seed="moderation_us_trial_owner",
  )
  Rule(
    "moderation_us_trial_owner",
    conditions=[
      str_eq("country", "US"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 45),
    ],
    rollout~,
    reason="preset_moderation_us_trial_owner",
  )
}

///|
pub fn preset_moderation_us_trial_owner_flag() -> Flag {
  Flag(
    "moderation_us_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_moderation_us_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_moderation_us_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "US")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 45)
}

///|
pub fn preset_moderation_jp_free_viewer_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8290), WeightedVariant("treatment", 1710)],
    seed="moderation_jp_free_viewer",
  )
  Rule(
    "moderation_jp_free_viewer",
    conditions=[
      str_eq("country", "JP"),
      str_eq("plan", "free"),
      contains("roles", "viewer"),
      greater_eq("age", 46),
    ],
    rollout~,
    reason="preset_moderation_jp_free_viewer",
  )
}

///|
pub fn preset_moderation_jp_free_viewer_flag() -> Flag {
  Flag(
    "moderation_jp_free_viewer",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_moderation_jp_free_viewer_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_moderation_jp_free_viewer_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "JP")
  .with_str("plan", "free")
  .with_strings("roles", ["viewer"])
  .with_int("age", 46)
}

///|
pub fn preset_moderation_sg_pro_editor_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8427), WeightedVariant("treatment", 1573)],
    seed="moderation_sg_pro_editor",
  )
  Rule(
    "moderation_sg_pro_editor",
    conditions=[
      str_eq("country", "SG"),
      str_eq("plan", "pro"),
      contains("roles", "editor"),
      greater_eq("age", 47),
    ],
    rollout~,
    reason="preset_moderation_sg_pro_editor",
  )
}

///|
pub fn preset_moderation_sg_pro_editor_flag() -> Flag {
  Flag(
    "moderation_sg_pro_editor",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_moderation_sg_pro_editor_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_moderation_sg_pro_editor_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "SG")
  .with_str("plan", "pro")
  .with_strings("roles", ["editor"])
  .with_int("age", 47)
}

///|
pub fn preset_moderation_de_team_admin_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8564), WeightedVariant("treatment", 1436)],
    seed="moderation_de_team_admin",
  )
  Rule(
    "moderation_de_team_admin",
    conditions=[
      str_eq("country", "DE"),
      str_eq("plan", "team"),
      contains("roles", "admin"),
      greater_eq("age", 48),
    ],
    rollout~,
    reason="preset_moderation_de_team_admin",
  )
}

///|
pub fn preset_moderation_de_team_admin_flag() -> Flag {
  Flag(
    "moderation_de_team_admin",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_moderation_de_team_admin_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_moderation_de_team_admin_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "DE")
  .with_str("plan", "team")
  .with_strings("roles", ["admin"])
  .with_int("age", 48)
}

///|
pub fn preset_moderation_fr_enterprise_operator_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8701), WeightedVariant("treatment", 1299)],
    seed="moderation_fr_enterprise_operator",
  )
  Rule(
    "moderation_fr_enterprise_operator",
    conditions=[
      str_eq("country", "FR"),
      str_eq("plan", "enterprise"),
      contains("roles", "operator"),
      greater_eq("age", 49),
    ],
    rollout~,
    reason="preset_moderation_fr_enterprise_operator",
  )
}

///|
pub fn preset_moderation_fr_enterprise_operator_flag() -> Flag {
  Flag(
    "moderation_fr_enterprise_operator",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_moderation_fr_enterprise_operator_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_moderation_fr_enterprise_operator_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "FR")
  .with_str("plan", "enterprise")
  .with_strings("roles", ["operator"])
  .with_int("age", 49)
}

///|
pub fn preset_moderation_br_trial_owner_rule() -> Rule {
  let rollout = Rollout(
    [WeightedVariant("control", 8838), WeightedVariant("treatment", 1162)],
    seed="moderation_br_trial_owner",
  )
  Rule(
    "moderation_br_trial_owner",
    conditions=[
      str_eq("country", "BR"),
      str_eq("plan", "trial"),
      contains("roles", "owner"),
      greater_eq("age", 50),
    ],
    rollout~,
    reason="preset_moderation_br_trial_owner",
  )
}

///|
pub fn preset_moderation_br_trial_owner_flag() -> Flag {
  Flag(
    "moderation_br_trial_owner",
    ["off", "control", "treatment"],
    "off",
    rules=[preset_moderation_br_trial_owner_rule()],
    fallthrough_variant="control",
  )
}

///|
pub fn preset_moderation_br_trial_owner_context(
  user_key : StringView,
) -> Context {
  Context(user_key~)
  .with_str("country", "BR")
  .with_str("plan", "trial")
  .with_strings("roles", ["owner"])
  .with_int("age", 50)
}

///|
pub fn preset_catalog_flags() -> Array[Flag] {
  [
    preset_checkout_cn_free_viewer_flag(),
    preset_checkout_us_pro_editor_flag(),
    preset_checkout_jp_team_admin_flag(),
    preset_checkout_sg_enterprise_operator_flag(),
    preset_checkout_de_trial_owner_flag(),
    preset_checkout_fr_free_viewer_flag(),
    preset_checkout_br_pro_editor_flag(),
    preset_navigation_cn_team_admin_flag(),
    preset_navigation_us_enterprise_operator_flag(),
    preset_navigation_jp_trial_owner_flag(),
    preset_navigation_sg_free_viewer_flag(),
    preset_navigation_de_pro_editor_flag(),
    preset_navigation_fr_team_admin_flag(),
    preset_navigation_br_enterprise_operator_flag(),
    preset_pricing_cn_trial_owner_flag(),
    preset_pricing_us_free_viewer_flag(),
    preset_pricing_jp_pro_editor_flag(),
    preset_pricing_sg_team_admin_flag(),
    preset_pricing_de_enterprise_operator_flag(),
    preset_pricing_fr_trial_owner_flag(),
    preset_pricing_br_free_viewer_flag(),
    preset_search_cn_pro_editor_flag(),
    preset_search_us_team_admin_flag(),
    preset_search_jp_enterprise_operator_flag(),
    preset_search_sg_trial_owner_flag(),
    preset_search_de_free_viewer_flag(),
    preset_search_fr_pro_editor_flag(),
    preset_search_br_team_admin_flag(),
    preset_recommendation_cn_enterprise_operator_flag(),
    preset_recommendation_us_trial_owner_flag(),
    preset_recommendation_jp_free_viewer_flag(),
    preset_recommendation_sg_pro_editor_flag(),
    preset_recommendation_de_team_admin_flag(),
    preset_recommendation_fr_enterprise_operator_flag(),
    preset_recommendation_br_trial_owner_flag(),
    preset_onboarding_cn_free_viewer_flag(),
    preset_onboarding_us_pro_editor_flag(),
    preset_onboarding_jp_team_admin_flag(),
    preset_onboarding_sg_enterprise_operator_flag(),
    preset_onboarding_de_trial_owner_flag(),
    preset_onboarding_fr_free_viewer_flag(),
    preset_onboarding_br_pro_editor_flag(),
    preset_billing_cn_team_admin_flag(),
    preset_billing_us_enterprise_operator_flag(),
    preset_billing_jp_trial_owner_flag(),
    preset_billing_sg_free_viewer_flag(),
    preset_billing_de_pro_editor_flag(),
    preset_billing_fr_team_admin_flag(),
    preset_billing_br_enterprise_operator_flag(),
    preset_analytics_cn_trial_owner_flag(),
    preset_analytics_us_free_viewer_flag(),
    preset_analytics_jp_pro_editor_flag(),
    preset_analytics_sg_team_admin_flag(),
    preset_analytics_de_enterprise_operator_flag(),
    preset_analytics_fr_trial_owner_flag(),
    preset_analytics_br_free_viewer_flag(),
    preset_notification_cn_pro_editor_flag(),
    preset_notification_us_team_admin_flag(),
    preset_notification_jp_enterprise_operator_flag(),
    preset_notification_sg_trial_owner_flag(),
    preset_notification_de_free_viewer_flag(),
    preset_notification_fr_pro_editor_flag(),
    preset_notification_br_team_admin_flag(),
    preset_profile_cn_enterprise_operator_flag(),
    preset_profile_us_trial_owner_flag(),
    preset_profile_jp_free_viewer_flag(),
    preset_profile_sg_pro_editor_flag(),
    preset_profile_de_team_admin_flag(),
    preset_profile_fr_enterprise_operator_flag(),
    preset_profile_br_trial_owner_flag(),
    preset_editor_cn_free_viewer_flag(),
    preset_editor_us_pro_editor_flag(),
    preset_editor_jp_team_admin_flag(),
    preset_editor_sg_enterprise_operator_flag(),
    preset_editor_de_trial_owner_flag(),
    preset_editor_fr_free_viewer_flag(),
    preset_editor_br_pro_editor_flag(),
    preset_dashboard_cn_team_admin_flag(),
    preset_dashboard_us_enterprise_operator_flag(),
    preset_dashboard_jp_trial_owner_flag(),
    preset_dashboard_sg_free_viewer_flag(),
    preset_dashboard_de_pro_editor_flag(),
    preset_dashboard_fr_team_admin_flag(),
    preset_dashboard_br_enterprise_operator_flag(),
    preset_workspace_cn_trial_owner_flag(),
    preset_workspace_us_free_viewer_flag(),
    preset_workspace_jp_pro_editor_flag(),
    preset_workspace_sg_team_admin_flag(),
    preset_workspace_de_enterprise_operator_flag(),
    preset_workspace_fr_trial_owner_flag(),
    preset_workspace_br_free_viewer_flag(),
    preset_reporting_cn_pro_editor_flag(),
    preset_reporting_us_team_admin_flag(),
    preset_reporting_jp_enterprise_operator_flag(),
    preset_reporting_sg_trial_owner_flag(),
    preset_reporting_de_free_viewer_flag(),
    preset_reporting_fr_pro_editor_flag(),
    preset_reporting_br_team_admin_flag(),
    preset_export_cn_enterprise_operator_flag(),
    preset_export_us_trial_owner_flag(),
    preset_export_jp_free_viewer_flag(),
    preset_export_sg_pro_editor_flag(),
    preset_export_de_team_admin_flag(),
    preset_export_fr_enterprise_operator_flag(),
    preset_export_br_trial_owner_flag(),
    preset_import_cn_free_viewer_flag(),
    preset_import_us_pro_editor_flag(),
    preset_import_jp_team_admin_flag(),
    preset_import_sg_enterprise_operator_flag(),
    preset_import_de_trial_owner_flag(),
    preset_import_fr_free_viewer_flag(),
    preset_import_br_pro_editor_flag(),
    preset_integration_cn_team_admin_flag(),
    preset_integration_us_enterprise_operator_flag(),
    preset_integration_jp_trial_owner_flag(),
    preset_integration_sg_free_viewer_flag(),
    preset_integration_de_pro_editor_flag(),
    preset_integration_fr_team_admin_flag(),
    preset_integration_br_enterprise_operator_flag(),
    preset_security_cn_trial_owner_flag(),
    preset_security_us_free_viewer_flag(),
    preset_security_jp_pro_editor_flag(),
    preset_security_sg_team_admin_flag(),
    preset_security_de_enterprise_operator_flag(),
    preset_security_fr_trial_owner_flag(),
    preset_security_br_free_viewer_flag(),
    preset_messaging_cn_pro_editor_flag(),
    preset_messaging_us_team_admin_flag(),
    preset_messaging_jp_enterprise_operator_flag(),
    preset_messaging_sg_trial_owner_flag(),
    preset_messaging_de_free_viewer_flag(),
    preset_messaging_fr_pro_editor_flag(),
    preset_messaging_br_team_admin_flag(),
    preset_scheduler_cn_enterprise_operator_flag(),
    preset_scheduler_us_trial_owner_flag(),
    preset_scheduler_jp_free_viewer_flag(),
    preset_scheduler_sg_pro_editor_flag(),
    preset_scheduler_de_team_admin_flag(),
    preset_scheduler_fr_enterprise_operator_flag(),
    preset_scheduler_br_trial_owner_flag(),
    preset_campaign_cn_free_viewer_flag(),
    preset_campaign_us_pro_editor_flag(),
    preset_campaign_jp_team_admin_flag(),
    preset_campaign_sg_enterprise_operator_flag(),
    preset_campaign_de_trial_owner_flag(),
    preset_campaign_fr_free_viewer_flag(),
    preset_campaign_br_pro_editor_flag(),
    preset_catalog_cn_team_admin_flag(),
    preset_catalog_us_enterprise_operator_flag(),
    preset_catalog_jp_trial_owner_flag(),
    preset_catalog_sg_free_viewer_flag(),
    preset_catalog_de_pro_editor_flag(),
    preset_catalog_fr_team_admin_flag(),
    preset_catalog_br_enterprise_operator_flag(),
    preset_inventory_cn_trial_owner_flag(),
    preset_inventory_us_free_viewer_flag(),
    preset_inventory_jp_pro_editor_flag(),
    preset_inventory_sg_team_admin_flag(),
    preset_inventory_de_enterprise_operator_flag(),
    preset_inventory_fr_trial_owner_flag(),
    preset_inventory_br_free_viewer_flag(),
    preset_support_cn_pro_editor_flag(),
    preset_support_us_team_admin_flag(),
    preset_support_jp_enterprise_operator_flag(),
    preset_support_sg_trial_owner_flag(),
    preset_support_de_free_viewer_flag(),
    preset_support_fr_pro_editor_flag(),
    preset_support_br_team_admin_flag(),
    preset_moderation_cn_enterprise_operator_flag(),
    preset_moderation_us_trial_owner_flag(),
    preset_moderation_jp_free_viewer_flag(),
    preset_moderation_sg_pro_editor_flag(),
    preset_moderation_de_team_admin_flag(),
    preset_moderation_fr_enterprise_operator_flag(),
    preset_moderation_br_trial_owner_flag(),
  ]
}

///|
pub fn preset_catalog_set() -> FlagSet {
  FlagSet(flags=preset_catalog_flags())
}

///|
pub fn preset_catalog_size() -> Int {
  preset_catalog_flags().length()
}
