///|
test "preset catalog exposes reusable flags" {
  inspect(@moonflags.preset_catalog_size(), content="175")
  let set = @moonflags.preset_catalog_set()
  let result = set.evaluate(
    "checkout_cn_free_viewer",
    @moonflags.preset_checkout_cn_free_viewer_context("catalog-user"),
  )
  assert_true(result is Some(_))
  debug_inspect(
    result.map(r => r.reason),
    content="Some(\"preset_checkout_cn_free_viewer\")",
  )
}

///|
test "preset catalog validates cleanly" {
  let diagnostics = @moonflags.validate_set(@moonflags.preset_catalog_set())
  inspect(@moonflags.has_errors(diagnostics), content="false")
}
