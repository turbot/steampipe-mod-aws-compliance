benchmark "nist_cyber_security_pr_ip_7" {
  title       = "PR.IP-7"
  description = "Configuration change control processes are in place."

  children = [
    control.ec2_ebs_optimized
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ip_7"
  })
}