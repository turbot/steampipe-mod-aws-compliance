# Non-Config rule query

query "waf_rule_condition_attached" {
  sql = <<-EOQ
    select
      -- Required Columns
      akas as resource,
      case
        when predicates is null or jsonb_array_length(predicates) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when predicates is null or jsonb_array_length(predicates) = 0 then title || ' has no attached conditions.'
        else title || ' has attached conditions.'
      end as reason,
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_waf_rule;
  EOQ
}

query "waf_rule_group_rule_attached" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when activated_rules is null or jsonb_array_length(activated_rules) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when activated_rules is null or jsonb_array_length(activated_rules) = 0 then title || ' has no attached rules.'
        else title || ' has attached rules.'
      end as reason,
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_waf_rule_group;
  EOQ
}

query "waf_web_acl_rule_attached" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when rules is null or jsonb_array_length(rules) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when rules is null or jsonb_array_length(rules) = 0 then title || ' has no attached rules.'
        else title || ' has attached rules.'
      end as reason,
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_waf_web_acl;
  EOQ
}
