locals {
  all_controls_datasync_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DataSync"
  })
}

benchmark "all_controls_datasync" {
  title       = "DataSync"
  description = "This section contains recommendations for configuring DataSync resources."
  children = [
    control.datasync_task_logging_enabled
  ]

  tags = merge(local.all_controls_datasync_common_tags, {
    type = "Benchmark"
  })
}


