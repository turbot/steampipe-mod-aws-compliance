benchmark "nist_cyber_security_pr_ac_1" {
  title       = "PR.AC-1"
  description = "Identities and credentials are issued, managed, verified, revoked, and audited for authorized devices, users and processes."

  children = [
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ac_1"
  })
}