benchmark "nist_800_53_rev_4_ac_2_g" {
  title       = "AC-2(g) Account Management"
  description = "Monitors the use of information system accounts."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_root_user_no_access_keys,
    control.iam_user_unused_credentials_90,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}