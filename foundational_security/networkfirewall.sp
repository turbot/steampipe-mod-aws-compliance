locals {
  foundational_security_networkfirewall_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/NetworkFirewall"
  })
}

benchmark "foundational_security_networkfirewall" {
  title         = "Network Firewall"
  documentation = file("./foundational_security/docs/foundational_security_networkfirewall.md")
  children = [
    control.foundational_security_networkfirewall_3,
    control.foundational_security_networkfirewall_4,
    control.foundational_security_networkfirewall_5,
    control.foundational_security_networkfirewall_6
  ]

  tags = merge(local.foundational_security_networkfirewall_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_networkfirewall_3" {
  title         = "3 Network Firewall policies should have at least one rule group associated"
  description   = "This control checks whether a Network Firewall policy has any stateful or stateless rule groups associated. The control fails if stateless or stateful rule groups are not assigned."
  severity      = "medium"
  query         = query.networkfirewall_firewall_policy_rule_group_not_empty
  documentation = file("./foundational_security/docs/foundational_security_networkfirewall_3.md")

  tags = merge(local.foundational_security_networkfirewall_common_tags, {
    foundational_security_item_id  = "networkfirewall_3"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_networkfirewall_4" {
  title         = "4 The default stateless action for Network Firewall policies should be drop or forward for full packets"
  description   = "A firewall policy defines how your firewall monitors and handles traffic in Amazon VPC. You configure stateless and stateful rule groups to filter packets and traffic flows. Defaulting to Pass can allow unintended traffic."
  severity      = "medium"
  query         = query.networkfirewall_firewall_policy_default_stateless_action_check_full_packets
  documentation = file("./foundational_security/docs/foundational_security_networkfirewall_4.md")

  tags = merge(local.foundational_security_networkfirewall_common_tags, {
    foundational_security_item_id  = "networkfirewall_4"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_networkfirewall_5" {
  title         = "5 The default stateless action for Network Firewall policies should be drop or forward for fragmented packets"
  description   = "This control checks whether the default stateless action for fragmented packets for a Network Firewall policy is drop or forward. The control passes if Drop or Forward is selected, and fails if Pass is selected."
  severity      = "medium"
  query         = query.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets
  documentation = file("./foundational_security/docs/foundational_security_networkfirewall_5.md")

  tags = merge(local.foundational_security_networkfirewall_common_tags, {
    foundational_security_item_id  = "networkfirewall_5"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_networkfirewall_6" {
  title         = "6 Stateless network firewall rule group should not be empty"
  description   = "A rule group contains rules that define how your firewall processes traffic in your VPC. An empty stateless rule group when present in a firewall policy might give the impression that the rule group will process traffic. However, when the stateless rule group is empty, it does not process traffic."
  severity      = "medium"
  query         = query.networkfirewall_stateless_rule_group_not_empty
  documentation = file("./foundational_security/docs/foundational_security_networkfirewall_6.md")

  tags = merge(local.foundational_security_networkfirewall_common_tags, {
    foundational_security_item_id  = "networkfirewall_1"
    foundational_security_category = "secure_network_configuration"
  })
}
