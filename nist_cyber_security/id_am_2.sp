benchmark "nist_cyber_security_id_am_2" {
  title       = "ID.AM-2"
  description = "Software platforms and applications within the organization are inventoried."

  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "id_am_2"
  })
}
