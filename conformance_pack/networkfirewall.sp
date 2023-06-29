locals {
  conformance_pack_networkfirewall_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/NetworkFirewall"
  })
}

control "networkfirewall_stateless_rule_group_not_empty" {
  title       = "Stateless network firewall rule group should not be empty"
  description = "A rule group contains rules that define how your firewall processes traffic in your VPC. An empty stateless rule group when present in a firewall policy might give the impression that the rule group will process traffic. However, when the stateless rule group is empty, it does not process traffic."
  query       = query.networkfirewall_stateless_rule_group_not_empty

  tags = merge(local.conformance_pack_networkfirewall_common_tags, {
    nist_csf = "true"
  })
}

control "networkfirewall_firewall_policy_rule_group_not_empty" {
  title       = "Network Firewall policies should have at least one rule group associated"
  description = "This control checks whether a Network Firewall policy has any stateful or stateless rule groups associated. The control fails if stateless or stateful rule groups are not assigned."
  query       = query.networkfirewall_firewall_policy_rule_group_not_empty

  tags = merge(local.conformance_pack_networkfirewall_common_tags, {
    nist_csf = "true"
  })
}

control "networkfirewall_firewall_policy_default_stateless_action_check_full_packets" {
  title       = "The default stateless action for Network Firewall policies should be drop or forward for full packets"
  description = "A firewall policy defines how your firewall monitors and handles traffic in Amazon VPC. You configure stateless and stateful rule groups to filter packets and traffic flows. Defaulting to Pass can allow unintended traffic."
  query       = query.networkfirewall_firewall_policy_default_stateless_action_check_full_packets

  tags = merge(local.conformance_pack_networkfirewall_common_tags, {
    nist_csf = "true"
  })
}

control "networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets" {
  title       = "The default stateless action for Network Firewall policies should be drop or forward for fragmented packets"
  description = "This control checks whether the default stateless action for fragmented packets for a Network Firewall policy is drop or forward. The control passes if Drop or Forward is selected, and fails if Pass is selected."
  query       = query.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets

  tags = merge(local.conformance_pack_networkfirewall_common_tags, {
    nist_csf = "true"
  })
}

control "networkfirewall_firewall_in_vpc" {
  title       = "Networkfirewall firewall should be in a VPC"
  description = "Deploy AWS Networkfirewall firewall within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a function and other services within the Amazon VPC."
  query       = query.networkfirewall_firewall_in_vpc

  tags = merge(local.conformance_pack_networkfirewall_common_tags, {
    other_checks = "true"
  })
}

query "networkfirewall_stateless_rule_group_not_empty" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when type = 'STATEFUL' then 'skip'
        when jsonb_array_length(rules_source -> 'StatelessRulesAndCustomActions' -> 'StatelessRules') > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when type = 'STATEFUL' then title || ' is a stateful rule group.'
        else title || ' has ' || jsonb_array_length(rules_source -> 'StatelessRulesAndCustomActions' -> 'StatelessRules') || ' rule(s).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_rule_group;
  EOQ
}

query "networkfirewall_firewall_policy_rule_group_not_empty" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (firewall_policy ->> 'StatefulRuleGroupReferences' is null or jsonb_array_length(firewall_policy -> 'StatefulRuleGroupReferences') = 0)
          and (firewall_policy ->> 'StatelessRuleGroupReferences' is null or jsonb_array_length(firewall_policy -> 'StatelessRuleGroupReferences') = 0) then 'alarm'
        else 'ok'
      end as status,
      case
        when (firewall_policy ->> 'StatefulRuleGroupReferences' is null or jsonb_array_length(firewall_policy -> 'StatefulRuleGroupReferences') = 0)
          and (firewall_policy ->> 'StatelessRuleGroupReferences' is null or jsonb_array_length(firewall_policy -> 'StatelessRuleGroupReferences') = 0) then title || ' has no associated rule groups.'
        else title || ' has associated rule groups.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_firewall_policy;
  EOQ
}

query "networkfirewall_firewall_policy_default_stateless_action_check_full_packets" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (not (firewall_policy -> 'StatelessDefaultActions') ? 'aws:drop'
            and not (firewall_policy -> 'StatelessDefaultActions') ? 'aws:forward_to_sfe') then 'alarm'
        else 'ok'
      end as status,
      case
        when (not (firewall_policy -> 'StatelessDefaultActions') ? 'aws:drop'
          and not (firewall_policy -> 'StatelessDefaultActions') ? 'aws:forward_to_sfe') then title || ' stateless action is neither drop nor forward for full packets.'
        else title || ' stateless action is either drop or forward for full packets.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_firewall_policy;
  EOQ
}

query "networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (not (firewall_policy -> 'StatelessFragmentDefaultActions') ? 'aws:drop'
            and not (firewall_policy -> 'StatelessFragmentDefaultActions') ? 'aws:forward_to_sfe') then 'alarm'
        else 'ok'
      end as status,
      case
        when (not (firewall_policy -> 'StatelessFragmentDefaultActions') ? 'aws:drop'
            and not (firewall_policy -> 'StatelessFragmentDefaultActions') ? 'aws:forward_to_sfe') then title || ' stateless action is neither drop nor forward for fragmented packets.'
        else title || ' stateless action is either drop or forward for fragmented packets.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_firewall_policy;
  EOQ
}

query "networkfirewall_firewall_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_id is null or vpc_id = '' then 'alarm'
        else 'ok'
      end status,
      case
        when vpc_id is null or vpc_id = '' then title || ' is not in VPC.'
        else title || ' is in VPC ' || vpc_id || '.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_firewall;
  EOQ
}