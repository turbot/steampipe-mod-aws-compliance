locals {
  all_controls_connect_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Connect"
  })
}

benchmark "all_controls_connect" {
  title       = "Connect"
  description = "This section contains recommendations for configuring Connect resources."
  children = [
    control.connect_instance_logging_enabled
  ]

  tags = merge(local.all_controls_connect_common_tags, {
    type = "Benchmark"
  })
}
