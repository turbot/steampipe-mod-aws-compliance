benchmark "fedramp_low_rev_4_ir" {
  title       = benchmark.nist_800_53_rev_4_ir.title
  description = benchmark.nist_800_53_rev_4_ir.description
  children = [
    benchmark.fedramp_low_rev_4_ir_4
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_ir_4" {
  title       = benchmark.nist_800_53_rev_4_ir_4.title
  description = benchmark.nist_800_53_rev_4_ir_4.description
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled
  ]

  tags = local.fedramp_low_rev_4_common_tags

}