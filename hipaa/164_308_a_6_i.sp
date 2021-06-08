locals {
  hipaa_164_308_a_6_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_6_i"
  })
}

benchmark "hipaa_164_308_a_6_i" {
  title       = "164.308(a)(6)(i) Security incident procedures"
  description = "Implement policies and procedures to address security incidents."
  children = [
    control.hipaa_164_308_a_6_i_guardduty_enabled,
    control.hipaa_164_308_a_6_i_securityhub_enabled
  ]
  tags          = local.hipaa_164_308_a_6_i_common_tags
}

control "hipaa_164_308_a_6_i_guardduty_enabled" {
  title       = "GuardDuty should be enabled"
  description = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql         = query.guardduty_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_i_common_tags, {
    service = "guardduty"
  })
}

control "hipaa_164_308_a_6_i_securityhub_enabled" {
  title       = "AWS Security Hub should be enabled for an AWS Account"
  description = "AWS Security Hub helps to monitor unauthorized personnel, connections, devices, and software. AWS Security Hub aggregates, organizes, and prioritizes the security alerts, or findings, from multiple AWS services."
  sql         = query.securityhub_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_i_common_tags, {
    service = "securityhub"
  })
}