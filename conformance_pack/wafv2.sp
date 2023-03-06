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
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

query "wafv2_web_acl_logging_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      arn as resource,
      case
        when logging_configuration is null then 'alarm'
        else 'ok'
      end as status,
      case
        when logging_configuration is null then title || ' logging disabled.'
        else title || ' logging enabled.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_wafv2_web_acl;
  EOQ
}
