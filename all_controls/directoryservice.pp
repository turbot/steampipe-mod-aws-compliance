locals {
  all_controls_directoryservice_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DirectoryService"
  })
}

benchmark "all_controls_directoryservice" {
  title       = "Directory Service"
  description = "This section contains recommendations for configuring Directory Service resources."
  children = [
    control.directory_service_certificate_expires_90_days,
    control.directory_service_directory_snapshots_limit_2,
    control.directory_service_directory_sns_notifications_enabled
  ]

  tags = merge(local.all_controls_directoryservice_common_tags, {
    type = "Benchmark"
  })
}
