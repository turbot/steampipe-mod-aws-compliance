benchmark "fedramp_moderate_rev_4_ir" {
  title       = benchmark.nist_800_53_rev_4_ir.title
  description = benchmark.nist_800_53_rev_4_ir.description
  children = [
    benchmark.fedramp_moderate_rev_4_ir_4,
    benchmark.fedramp_moderate_rev_4_ir_6,
    benchmark.fedramp_moderate_rev_4_ir_7
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ir_4" {
  title       = benchmark.nist_800_53_rev_4_ir_4.title
  description = benchmark.nist_800_53_rev_4_ir_4.description
  children = [
    benchmark.fedramp_moderate_rev_4_ir_4_1
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ir_4_1" {
  title       = benchmark.nist_800_53_rev_4_ir_4_1.title
  description = benchmark.nist_800_53_rev_4_ir_4_1.description
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ir_6" {
  title       = benchmark.nist_800_53_rev_4_ir_6.title
  description = benchmark.nist_800_53_rev_4_ir_6.description
  children = [
    benchmark.fedramp_moderate_rev_4_ir_6_1
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ir_6_1" {
  title       = benchmark.nist_800_53_rev_4_ir_6_1.title
  description = benchmark.nist_800_53_rev_4_ir_6_1.description
  children = [
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ir_7" {
  title       = benchmark.nist_800_53_rev_4_ir_7.title
  description = benchmark.nist_800_53_rev_4_ir_7.description
  children = [
    benchmark.fedramp_moderate_rev_4_ir_7_1
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ir_7_1" {
  title       = benchmark.nist_800_53_rev_4_ir_7_1.title
  description = benchmark.nist_800_53_rev_4_ir_7_1.description
  children = [
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}