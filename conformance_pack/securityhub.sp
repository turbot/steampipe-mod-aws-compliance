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
      hub_arn as resource,
      case
        when hub_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when hub_arn is not null then 'Security Hub enabled in ' || region || '.'
        else 'Security Hub disabled in ' || region || '.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_securityhub_hub;
  EOQ
}
