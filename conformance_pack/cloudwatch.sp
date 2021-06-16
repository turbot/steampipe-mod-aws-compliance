locals {
  conformance_pack_cloudwatch_common_tags = {
    service = "cloudwatch"
  }
}

control "cloudwatch_alarm_action_enabled" {
  title       = "CloudWatch alarm action should be enabled"
  description = "Amazon CloudWatch alarms alert when a metric breaches the threshold for a specified number of evaluation periods. The alarm performs one or more actions based on the value of the metric or expression relative to a threshold over a number of time periods."
  sql         = query.cloudwatch_alarm_action_enabled.sql
  tags        = local.conformance_pack_cloudwatch_common_tags
}

control "log_group_encryption_at_rest_enabled" {
  title       = "Log group encryption at rest should be enabled"
  description = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Group"
  sql         = query.log_group_encryption_at_rest_enabled.sql
  tags        = local.conformance_pack_cloudwatch_common_tags
}

control "cloudwatch_log_group_retention_period_365" {
  title       = "Amazon CloudWatch LogGroup retention period should be set"
  description = "Ensure a minimum duration of event log data is retained for your log groups to help with troubleshooting and forensics investigations."
  sql         = query.cloudwatch_log_group_retention_period_365.sql
  tags        = local.conformance_pack_cloudwatch_common_tags
}