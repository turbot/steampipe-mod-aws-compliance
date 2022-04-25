locals {
  foundational_security_networkfirewall_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/NetworkFirewall"
  })
}

benchmark "foundational_security_networkfirewall" {
  title         = "Network Firewall"
  documentation = file("./foundational_security/docs/foundational_security_networkfirewall.md")
  children = [
    control.foundational_security_networkfirewall_6
  ]
  tags          = local.foundational_security_networkfirewall_common_tags
}

control "foundational_security_networkfirewall_6" {
  title         = "6 Stateless network firewall rule group should not be empty"
  description   = "A rule group contains rules that define how your firewall processes traffic in your VPC. An empty stateless rule group when present in a firewall policy might give the impression that the rule group will process traffic. However, when the stateless rule group is empty, it does not process traffic."
  severity      = "medium"
  sql           = query.networkfirewall_stateless_rule_group_not_empty.sql
  documentation = file("./foundational_security/docs/foundational_security_networkfirewall_6.md")

  tags = merge(local.foundational_security_networkfirewall_common_tags, {
    foundational_security_item_id  = "networkfirewall_1"
    foundational_security_category = "secure_network_configuration"
  })
}
