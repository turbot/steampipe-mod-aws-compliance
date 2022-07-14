locals {
  conformance_pack_guardduty_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/GuardDuty"
  })
}

control "guardduty_enabled" {
  title       = "GuardDuty should be enabled"
  description = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql         = query.guardduty_enabled.sql

  tags = merge(local.conformance_pack_guardduty_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "guardduty_finding_archived" {
  title       = "GuardDuty findings should be archived"
  description = "Amazon GuardDuty helps you understand the impact of an incident by classifying findings by severity: low, medium, and high."
  sql         = query.guardduty_finding_archived.sql

  tags = merge(local.conformance_pack_guardduty_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}
