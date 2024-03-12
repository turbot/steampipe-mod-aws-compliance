locals {
  all_controls_wafv2_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/WAFv2"
  })
}

benchmark "all_controls_wafv2" {
  title       = "WAFv2"
  description = "This section contains recommendations for configuring WAFv2 resources."
  children = [
    control.wafv2_rule_group_logging_enabled,
    control.wafv2_web_acl_logging_enabled,
    control.wafv2_web_acl_rule_attached
  ]

  tags = merge(local.all_controls_wafv2_common_tags, {
    type = "Benchmark"
  })
}
