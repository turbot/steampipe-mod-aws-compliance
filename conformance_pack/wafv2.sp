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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
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

# Non-Config rule query

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
        else title || ' has ' || c.rule_group_count || ' rule group(s) and ' || (jsonb_array_length(rules) - c.rule_group_count) || ' rule(s) attached.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_wafv2_web_acl as a
      left join rule_group_count as c on c.arn = a.arn;
  EOQ
}
