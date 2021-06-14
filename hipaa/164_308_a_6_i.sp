locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_6_i"
  })
}

benchmark "hipaa_164_308_a_6_i" {
  title       = "164.308(a)(6)(i) Security incident procedures"
  description = "Implement policies and procedures to address security incidents."
  children = [
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.lambda_function_dead_letter_queue_configured,
    control.securityhub_enabled
  ]
  tags          = local.common_tags
}
