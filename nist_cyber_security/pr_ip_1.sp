benchmark "nist_cyber_security_pr_ip_1" {
  title       = "PR.IP-1"
  description = "A baseline configuration of information technology/industrial control systems is created and maintained incorporating security principles (e.g. concept of least functionality)."

  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ec2_stopped_instance_30_days,
    control.ebs_volume_inuse
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ip_1"
  })
}