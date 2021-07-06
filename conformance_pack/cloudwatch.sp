locals {
  conformance_pack_cloudwatch_common_tags = {
    service = "cloudwatch"
  }
}

control "cloudwatch_alarm_action_enabled" {
  title       = "CloudWatch alarm action should be enabled"
  description = "Amazon CloudWatch alarms alert when a metric breaches the threshold for a specified number of evaluation periods. The alarm performs one or more actions based on the value of the metric or expression relative to a threshold over a number of time periods."
  sql         = query.cloudwatch_alarm_action_enabled.sql

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    hipaa             = "true"
    nist_800_53_rev_4 = "true"
    nist_csf          = "true"
  })
}

control "log_group_encryption_at_rest_enabled" {
  title       = "Log group encryption at rest should be enabled"
  description = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Group"
  sql         = query.log_group_encryption_at_rest_enabled.sql

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "cloudwatch_log_group_retention_period_365" {
  title       = "Log group retention period should be at least 365 days"
  description = "Ensure a minimum duration of event log data is retained for your log groups to help with troubleshooting and forensics investigations."
  sql         = query.cloudwatch_log_group_retention_period_365.sql

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}