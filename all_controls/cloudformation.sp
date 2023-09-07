locals {
  all_controls_cloudformation_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/CloudFormation"
  })
}

benchmark "all_controls_cloudformation" {
  title       = "CloudFormation"
  description = "This section contains recommendations for configuring CloudFormation resources."
  children = [
    control.cloudformation_stack_drift_detection_check,
    control.cloudformation_stack_notifications_enabled,
    control.cloudformation_stack_output_no_secrets,
    control.cloudformation_stack_rollback_enabled,
    control.cloudformation_stack_termination_protection_enabled
  ]

  tags = merge(local.all_controls_cloudformation_common_tags, {
    type = "Benchmark"
  })
}
