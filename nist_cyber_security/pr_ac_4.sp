benchmark "nist_cyber_security_pr_ac_4" {
  title       = "PR.AC-4"
  description = "Access permissions and authorizations are managed, incorporating the principles of least privilege and separation of duties."

  children = [
    control.emr_cluster_kerberos_enabled,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ac_4"
  })
}
