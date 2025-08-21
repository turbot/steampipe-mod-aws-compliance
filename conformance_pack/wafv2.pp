locals {
  conformance_pack_wafv2_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/WAFv2"
  })
}

control "wafv2_web_acl_logging_enabled" {
  title       = "Logging should be enabled on AWS WAFv2 regional and global web access control list (ACLs)"
  description = "To help with logging and monitoring within your environment, enable AWS WAF (V2) logging on regional and global web ACLs."
  query       = query.wafv2_web_acl_logging_enabled

  tags = merge(local.conformance_pack_wafv2_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "wafv2_web_acl_rule_attached" {
  title       = "A WAFV2 web ACL should have at least one rule or rule group"
  description = "This control checks whether a WAFV2 web access control list (web ACL) contains at least one WAF rule or WAF rule group. The control fails if a web ACL does not contain any WAF rules or rule groups."
  query       = query.wafv2_web_acl_rule_attached

  tags = local.conformance_pack_waf_common_tags
}

control "wafv2_rule_group_logging_enabled" {
  title       = "AWS WAF rules should have CloudWatch metrics enabled"
  description = "This control checks whether an AWS WAF rule or rule group has Amazon CloudWatch metrics enabled. The control fails if the rule or rule group doesn't have CloudWatch metrics enabled."
  query       = query.wafv2_rule_group_logging_enabled

  tags = merge(local.conformance_pack_wafv2_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

query "wafv2_web_acl_logging_enabled" {
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
      aws_wafv2_web_acl;
  EOQ
}

query "wafv2_web_acl_rule_attached" {
  sql = <<-EOQ
    with rule_group_count as (
      select
        arn,
        count(*) as rule_group_count
      from
        aws_wafv2_web_acl,
        jsonb_array_elements(rules) as r
      where
        r -> 'Statement' -> 'RuleGroupReferenceStatement' ->> 'ARN' is not null
      group by
        arn
    )
    select
      a.arn as resource,
      case
        when rules is null or jsonb_array_length(rules) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when rules is null or jsonb_array_length(rules) = 0 then title || ' has no attached rules.'
        else title || ' has ' || coalesce(c.rule_group_count, 0) || ' rule group(s) and ' || (jsonb_array_length(rules) - (coalesce(c.rule_group_count, 0))) || ' rule(s) attached.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_wafv2_web_acl as a
      left join rule_group_count as c on c.arn = a.arn;
  EOQ
}

query "wafv2_rule_group_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (visibility_config ->> 'CloudWatchMetricsEnabled')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (visibility_config ->> 'CloudWatchMetricsEnabled')::bool then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_wafv2_rule_group;
  EOQ
}
