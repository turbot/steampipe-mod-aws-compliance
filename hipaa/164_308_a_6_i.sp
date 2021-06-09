locals {
  hipaa_164_308_a_6_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_6_i"
  })
}

benchmark "hipaa_164_308_a_6_i" {
  title       = "164.308(a)(6)(i) Security incident procedures"
  description = "Implement policies and procedures to address security incidents."
  children = [
    control.hipaa_164_308_a_6_i_cloudwatch_alarm_action_enabled,
    control.hipaa_164_308_a_6_i_guardduty_enabled,
    control.hipaa_164_308_a_6_i_lambda_function_dead_letter_queue_configured,
    control.hipaa_164_308_a_6_i_securityhub_enabled
  ]
  tags          = local.hipaa_164_308_a_6_i_common_tags
}

control "hipaa_164_308_a_6_i_cloudwatch_alarm_action_enabled" {
  title       = "CloudWatch alarm action should be enabled"
  description = "	Amazon CloudWatch alarms alert when a metric breaches the threshold for a specified number of evaluation periods. The alarm performs one or more actions based on the value of the metric or expression relative to a threshold over a number of time periods."
  sql         = query.cloudwatch_alarm_action_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_i_common_tags, {
    service = "cloudwatch"
  })
}

control "hipaa_164_308_a_6_i_guardduty_enabled" {
  title       = "GuardDuty should be enabled"
  description = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql         = query.guardduty_enabled.sql

  tags = merge(local.hipaa_164_308_a_6_i_common_tags, {
    service = "guardduty"
  })
}

control "hipaa_164_308_a_6_i_lambda_function_dead_letter_queue_configured" {
  title       = "AWS Lambda function should be configured with a dead-letter queue"
  description = "Enable this rule to help notify the appropriate personnel through Amazon Simple Queue Service (Amazon SQS) or Amazon Simple Notification Service (Amazon SNS) when a function has failed."
  sql         = query.lambda_function_dead_letter_queue_configured.sql

  tags = merge(local.hipaa_164_308_a_6_i_common_tags, {
    service = "lambda"
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