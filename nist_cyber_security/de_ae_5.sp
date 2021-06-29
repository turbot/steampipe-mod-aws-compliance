benchmark "nist_cyber_security_de_ae_5" {
  title       = "DE.AE-5"
  description = "Incident alert thresholds are established."

  children = [
    control.cloudwatch_alarm_action_enabled,
    control.lambda_function_dead_letter_queue_configured
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "de_ae_5"
  })
}