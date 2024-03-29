benchmark "hipaa_security_rule_2003_164_308_a_4_i" {
  title       = "164.308(a)(4)(i) Information access management"
  description = "Implement policies and procedures for authorizing access to electronic protected health information that are consistent with the applicable requirements of subpart E of this part."
  children = [
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.rds_db_instance_iam_authentication_enabled
  ]

  tags = merge(local.hipaa_security_rule_2003_164_308_common_tags, {
    hipaa_security_rule_2003_item_id = "164_308_a_4_i"
  })
}
