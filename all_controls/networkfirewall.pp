locals {
  all_controls_networkfirewall_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/NetworkFirewall"
  })
}

benchmark "all_controls_networkfirewall" {
  title       = "Network Firewall"
  description = "This section contains recommendations for configuring Network Firewall resources."
  children = [
    control.networkfirewall_firewall_deletion_protection_enabled,
    control.networkfirewall_firewall_in_vpc,
    control.networkfirewall_firewall_logging_enabled,
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_default_stateless_action_check_full_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_firewall_subnet_change_protection_enabled,
    control.networkfirewall_stateless_rule_group_not_empty
  ]

  tags = merge(local.all_controls_networkfirewall_common_tags, {
    type = "Benchmark"
  })
}
