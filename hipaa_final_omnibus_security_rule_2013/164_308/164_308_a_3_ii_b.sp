benchmark "hipaa_final_omnibus_security_rule_2013_164_308_a_3_ii_b" {
  title       = "164.308(a)(3)(ii)(B) Workforce clearance procedure"
  description = "Implement procedures to determine that the access of a workforce member to electronic protected health information is appropriate."
  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.emr_cluster_kerberos_enabled,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.s3_bucket_policy_restrict_public_access,
    control.ssm_document_prohibit_public_access,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = merge(local.hipaa_final_omnibus_security_rule_2013_164_308_common_tags, {
    hipaa_final_omnibus_security_rule_2013_item_id = "164_308_a_3_ii_b"
  })
}
