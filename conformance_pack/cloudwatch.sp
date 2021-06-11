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

