locals {
  all_controls_appstream_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/AppStream"
  })
}

benchmark "all_controls_appstream" {
  title       = "AppStream"
  description = "This section contains recommendations for configuring AppStream resources."
  children = [
    control.appstream_fleet_default_internet_access_disabled,
    control.appstream_fleet_idle_disconnect_timeout_600_seconds,
    control.appstream_fleet_max_user_duration_36000_seconds,
    control.appstream_fleet_session_disconnect_timeout_300_seconds
  ]

  tags = merge(local.all_controls_appstream_common_tags, {
    type = "Benchmark"
  })
}
