benchmark "nist_cyber_security_pr_ip_3" {
  title       = "PR.IP-3"
  description = "Configuration change control processes are in place."

  children = [
    control.elb_application_lb_deletion_protection_enabled
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ip_3"
  })
}