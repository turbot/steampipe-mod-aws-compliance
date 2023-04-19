locals {
  conformance_pack_securityhub_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SecurityHub"
  })
}

control "securityhub_enabled" {
  title       = "AWS Security Hub should be enabled for an AWS Account"
  description = "AWS Security Hub helps to monitor unauthorized personnel, connections, devices, and software. AWS Security Hub aggregates, organizes, and prioritizes the security alerts, or findings, from multiple AWS services."
  query       = query.securityhub_enabled

  tags = merge(local.conformance_pack_securityhub_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

query "securityhub_enabled" {
  sql = <<-EOQ
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when r.region = any(array['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'ap-northeast-3']) then 'skip'
        -- Skip any regions that are disabled in the account.
        when r.opt_in_status = 'not-opted-in' then 'skip'
        when h.hub_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when r.region = any(array['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'ap-northeast-3']) then r.region ||  ' region not supported.'
        when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
        when h.hub_arn is not null then 'Security Hub enabled in ' || r.region || '.'
        else 'Security Hub disabled in ' || r.region || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join aws_securityhub_hub as h on r.account_id = h.account_id and r.name = h.region;
  EOQ
}
