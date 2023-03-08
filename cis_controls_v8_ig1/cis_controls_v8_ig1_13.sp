benchmark "cis_controls_v8_ig1_13" {
  title       = "13 Network Monitoring and Defense"
  description = "Operate processes and tooling to establish and maintain comprehensive network monitoring and defense against security threats across the enterprise’s network infrastructure and user base."
  children = [
    benchmark.cis_controls_v8_ig1_13_1,
    benchmark.cis_controls_v8_ig1_13_3,
    benchmark.cis_controls_v8_ig1_13_6
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_13_1" {
  title       = "13.1 - Perform Application Layer Filtering"
  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_13_3" {
  title       = "13.3 - Ensure Network Infrastructure is Up-to-Date"
  children = [
    control.guardduty_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_13_6" {
  title       = "13.6 - Collect Network Traffic Flow Logs"
  children = [
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}