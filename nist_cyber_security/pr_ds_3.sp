benchmark "nist_cyber_security_pr_ds_3" {
  title       = "PR.DS-3"
  description = "Assets are formally managed throughout removal, transfers, and disposition."

  children = [
    control.ec2_instance_ssm_managed,
    control.vpc_eip_unused,
    control.vpc_security_group_unused,
    control.ssm_managed_instance_compliance_association_compliant,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ds_3"
  })
}
