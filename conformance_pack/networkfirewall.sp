# Non-Config rule query

query "networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets" {
  sql = <<-EOQ
    select
      -- Required Columns
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
      end as reason,
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_firewall_policy;
  EOQ
}

query "networkfirewall_firewall_policy_default_stateless_action_check_full_packets" {
  sql = <<-EOQ
    select
      -- Required Columns
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
      end as reason,
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_firewall_policy;
  EOQ
}

query "networkfirewall_firewall_policy_rule_group_not_empty" {
  sql = <<-EOQ
    select
      -- Required Columns
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
      end as reason,
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_firewall_policy;
  EOQ
}

query "networkfirewall_stateless_rule_group_not_empty" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when type = 'STATEFUL' then 'skip'
        when jsonb_array_length(rules_source -> 'StatelessRulesAndCustomActions' -> 'StatelessRules') > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when type = 'STATEFUL' then title || ' is a stateful rule group.'
        else title || ' has ' || jsonb_array_length(rules_source -> 'StatelessRulesAndCustomActions' -> 'StatelessRules') || ' rule(s).'
      end as reason,
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_networkfirewall_rule_group;
  EOQ
}
