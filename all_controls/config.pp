locals {
  all_controls_config_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Config"
  })
}

benchmark "all_controls_config" {
  title       = "Config"
  description = "This section contains recommendations for configuring Config resources."
  children = [
    control.config_configuration_recorder_no_failed_deliver_logs,
    control.config_enabled_all_regions
  ]

  tags = merge(local.all_controls_config_common_tags, {
    type = "Benchmark"
  })
}
