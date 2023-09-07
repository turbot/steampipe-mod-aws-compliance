locals {
  all_controls_waf_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/WAF"
  })
}

benchmark "all_controls_waf" {
  title       = "WAF"
  description = "This section contains recommendations for configuring WAF resources."
  children = [
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_logging_enabled,
    control.waf_web_acl_resource_associated,
    control.waf_web_acl_rule_attached
  ]

  tags = merge(local.all_controls_waf_common_tags, {
    type = "Benchmark"
  })
}
