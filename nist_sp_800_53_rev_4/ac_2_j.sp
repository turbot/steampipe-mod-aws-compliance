benchmark "nist_sp_800_53_rev4_ac_2_j" {
  title       = "AC-2(j) Account Management"
  description = "Reviews accounts for compliance with account management requirements."
  children = [
    control.emr_cluster_kerberos_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.secretsmanager_secret_rotated_as_scheduled
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}