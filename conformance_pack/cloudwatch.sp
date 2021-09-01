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

control "log_metric_filter_unauthorized_api" {
  title       = "Ensure a log metric filter and alarm exist for unauthorized API calls"
  description = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for unauthorized API calls."
  sql         = query.log_metric_filter_unauthorized_api.sql

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr = "true"
  })
}

control "log_metric_filter_console_login_mfa" {
  title       = "Ensure a log metric filter and alarm exist for AWS Management Console sign-in without MFA"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm console logins that aren't protected by MFA."
  sql         = query.log_metric_filter_console_login_mfa.sql

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr = "true"
  })
}

control "log_metric_filter_root_login" {
  title       = "Ensure a log metric filter and alarm exist for usage of 'root' account"
  description = "You can do real-time monitoring of API calls directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms.Security Hub recommends that you create a metric filter and alarm for root login attempts. Monitoring for root account logins provides visibility into the use of a fully privileged account and an opportunity to reduce the use of it."
  sql         = query.log_metric_filter_root_login.sql

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr = "true"
  })
}

control "log_metric_filter_iam_policy" {
  title       = "Ensure a log metric filter and alarm exist for IAM policy changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes made to IAM policies. Monitoring these changes helps ensure that authentication and authorization controls remain intact."
  sql         = query.log_metric_filter_iam_policy.sql

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr = "true"
  })
}
