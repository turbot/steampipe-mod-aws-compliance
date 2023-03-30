locals {
  conformance_pack_waf_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/WAF"
  })
}

control "waf_rule_condition_attached" {
  title       = "WAF global rule should have at least one condition"
  description = "This control checks whether an AWS WAF global rule contains any conditions. The control fails if no conditions are present within a rule."
  query       = query.waf_rule_condition_attached

  tags = merge(local.conformance_pack_waf_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "waf_rule_group_rule_attached" {
  title       = "WAF global rule group should have at least one rule"
  description = "This control checks whether an AWS WAF global rule group has at least one rule. The control fails if no rules are present within a rule group."
  query       = query.waf_rule_group_rule_attached

  tags = merge(local.conformance_pack_waf_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "waf_web_acl_rule_attached" {
  title       = "WAF global web ACL should have at least one rule or rule group"
  description = "This control checks whether an AWS WAF global web ACL contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups."
  query       = query.waf_web_acl_rule_attached

  tags = merge(local.conformance_pack_waf_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "waf_web_acl_logging_enabled" {
  title       = "WAF web ACL logging should be enabled"
  description = "To help with logging and monitoring within your environment, enable AWS WAF logging on regional and global web ACLs. This rule is non compliant for a global web ACL, if it does not have logging enabled."
  query       = query.waf_web_acl_logging_enabled

  tags = merge(local.conformance_pack_waf_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "waf_regional_rule_condition_attached" {
  title       = "WAF regional rule should have at least one condition"
  description = "This control checks whether an AWS WAF regional rule contains any conditions. The control fails if no conditions are present within a rule."
  query       = query.waf_regional_rule_condition_attached

  tags = merge(local.conformance_pack_waf_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "waf_web_acl_resource_associated" {
  title       = "WAF web ACL should be associated with an Application Load Balancer, API Gateway stage, or CloudFront distributions"
  description = "This control checks if the web ACL is associated with an Application Load Balancer, API Gateway stage, or CloudFront distributions."
  query       = query.waf_web_acl_resource_associated

  tags = merge(local.conformance_pack_waf_common_tags, {
    pci_dss_v321 = "true"
  })
}

query "waf_rule_condition_attached" {
  sql = <<-EOQ
    select
      rule_id as resource,
      case
        when predicates is null or jsonb_array_length(predicates) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when predicates is null or jsonb_array_length(predicates) = 0 then title || ' has no attached conditions.'
        else title || ' has attached conditions.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_waf_rule;
  EOQ
}

query "waf_rule_group_rule_attached" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when activated_rules is null or jsonb_array_length(activated_rules) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when activated_rules is null or jsonb_array_length(activated_rules) = 0 then title || ' has no attached rules.'
        else title || ' has attached rules.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_waf_rule_group;
  EOQ
}

query "waf_web_acl_rule_attached" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when rules is null or jsonb_array_length(rules) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when rules is null or jsonb_array_length(rules) = 0 then title || ' has no attached rules.'
        else title || ' has attached rules.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_waf_web_acl;
  EOQ
}

query "waf_web_acl_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when logging_configuration is null then 'alarm'
        else 'ok'
      end as status,
      case
        when logging_configuration is null then title || ' logging disabled.'
        else title || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_waf_web_acl;
  EOQ
}

query "waf_regional_rule_condition_attached" {
  sql = <<-EOQ
    select
      akas as resource,
      case
        when predicates is null or jsonb_array_length(predicates) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when predicates is null or jsonb_array_length(predicates) = 0 then title || ' has no attached conditions.'
        else title || ' has attached conditions.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_wafregional_rule;
  EOQ
}

query "waf_web_acl_resource_associated" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(resources) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(resources) > 0 then title || ' associated with AWS resource(s).'
        else title || ' not associated with AWS resource.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_wafregional_web_acl;
  EOQ
}

