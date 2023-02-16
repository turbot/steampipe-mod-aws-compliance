benchmark "cis_controls_v8_ig1_6" {
  title       = "Access Control Management"
  description = "."
  children = [
    benchmark.cis_controls_v8_ig1_6_5,
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_6_5" {
  title       = "6.5 - Require MFA for Administrative Access"
  description = "Require MFA for all administrative access accounts, where supported, on all enterprise assets, whether managed on-site or through a third-party provider."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_root_user_mfa_enabled,
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}