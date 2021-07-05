benchmark "nist_sp_800_53_rev4_ac_2_1" {
  title       = "AC-2(1) Automated System Account Management"
  description = "The organization employs automated mechanisms to support the management of information system accounts."
  children = [
    control.guardduty_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.securityhub_enabled
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}