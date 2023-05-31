benchmark "hipaa_final_omnibus_security_rule_2013_164_308_a_4_i" {
  title       = "164.308(a)(4)(i) Information access management"
  description = "Implement policies and procedures for authorizing access to electronic protected health information that are consistent with the applicable requirements of subpart E of this part."
  children = [
    control.emr_cluster_kerberos_enabled,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_policy_restrict_public_access,
    control.ssm_document_prohibit_public_access,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = merge(local.hipaa_final_omnibus_security_rule_2013_164_308_common_tags, {
    hipaa_final_omnibus_security_rule_2013_item_id = "164_308_a_4_i"
  })
}
