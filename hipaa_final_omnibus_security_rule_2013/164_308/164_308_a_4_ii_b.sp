benchmark "hipaa_final_omnibus_security_rule_2013_164_308_a_4_ii_b" {
  title       = "164.308(a)(4)(ii)(B) Access authorization"
  description = "Implement policies and procedures for granting access to electronic protected health information, for example, through access to a workstation, transaction, program, process, or other mechanism."
  children = [
    control.ec2_instance_iam_profile_attached,
    control.emr_cluster_kerberos_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.s3_bucket_policy_restrict_public_access,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_last_changed_90_day,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = merge(local.hipaa_final_omnibus_security_rule_2013_164_308_common_tags, {
    hipaa_final_omnibus_security_rule_2013_item_id = "164_308_a_4_ii_b"
  })
}
