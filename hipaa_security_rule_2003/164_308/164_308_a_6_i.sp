benchmark "hipaa_security_rule_2003_164_308_a_6_i" {
  title       = "164.308(a)(6)(i) Security incident procedures"
  description = "Implement policies and procedures to address security incidents."
  children = [
    control.cloudtrail_bucket_not_public,
    control.cloudtrail_s3_logging_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.lambda_function_dead_letter_queue_configured,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_root_login,
    control.securityhub_enabled
  ]

  tags = merge(local.hipaa_security_rule_2003_164_308_common_tags, {
    hipaa_security_rule_2003_item_id = "164_308_a_6_i"
  })
}
