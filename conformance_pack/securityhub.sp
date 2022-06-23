locals {
  conformance_pack_securityhub_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SecurityHub"
  })
}

control "securityhub_enabled" {
  title       = "AWS Security Hub should be enabled for an AWS Account"
  description = "AWS Security Hub helps to monitor unauthorized personnel, connections, devices, and software. AWS Security Hub aggregates, organizes, and prioritizes the security alerts, or findings, from multiple AWS services."
  sql         = query.securityhub_enabled.sql

  tags = merge(local.conformance_pack_securityhub_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "securityhub_standards_subscription_enabled" {
  title       = "AWS Security Hub should be enabled and its standard subscriptions"
  description = "Ensure that AWS Security Hub security standards are enabled within your AWS account(s)."
  sql         = query.securityhub_standards_subscription_enabled.sql

  tags = merge(local.conformance_pack_securityhub_common_tags, {
    extra_checks = "true"
  })
}
