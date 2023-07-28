locals {
  conformance_pack_appstream_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/AppStream"
  })
}

control "appstream_fleet_default_internet_access_disabled" {
  title       = "AppStream fleet default internet access should be disabled"
  description = "Enabling default internet access for AppStream fleet is not recommended. This control will be considered non-compliant if default internet access is enabled for AppStream fleet."
  query       = query.appstream_fleet_default_internet_access_disabled

  tags = merge(local.conformance_pack_appstream_common_tags, {
    other_checks = "true"
  })
}

control "appstream_fleet_session_disconnect_timeout_300_seconds" {
  title       = "AppStream fleet session disconnect timeout should be set to less than or equal to 5 mins"
  description = "The disconnect timeout in minutes refers to the duration for which a streaming session remains active even after users have disconnected. It is recommended to set the disconnect timeout to 5 minutes or less for the AppStream Fleet."
  query       = query.appstream_fleet_session_disconnect_timeout_300_seconds

  tags = merge(local.conformance_pack_appstream_common_tags, {
    other_checks = "true"
  })
}

control "appstream_fleet_max_user_duration_36000_seconds" {
  title       = "AppStream fleet max user duration should be set to less than 10 hours"
  description = "Ensure user maximum session duration is no longer than 10 hours. A session duration exceeding 10 hours is unnecessary and may offer malicious users an extended period of unauthorized usage beyond acceptable limits."
  query       = query.appstream_fleet_max_user_duration_36000_seconds

  tags = merge(local.conformance_pack_appstream_common_tags, {
    other_checks = "true"
  })
}

control "appstream_fleet_idle_disconnect_timeout_600_seconds" {
  title       = "AppStream fleet idle disconnect timeout should be set to less than or equal to 10 mins"
  description = "Ensure session idle disconnect timeout is set to 10 minutes or less."
  query       = query.appstream_fleet_idle_disconnect_timeout_600_seconds

  tags = merge(local.conformance_pack_appstream_common_tags, {
    other_checks = "true"
  })
}

query "appstream_fleet_default_internet_access_disabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when enable_default_internet_access then 'alarm'
        else 'ok'
      end as status,
      case
        when enable_default_internet_access then title || ' has default internet access enabled.'
        else title || ' has default internet access disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_appstream_fleet;
  EOQ
}

query "appstream_fleet_session_disconnect_timeout_300_seconds" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when disconnect_timeout_in_seconds <= 300 then 'ok'
        else 'alarm'
      end as status,
      title || ' disconnect timeout in seconds is set to ' || disconnect_timeout_in_seconds || ' seconds.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_appstream_fleet;
  EOQ
}

query "appstream_fleet_max_user_duration_36000_seconds" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when max_user_duration_in_seconds < 36000 then 'ok'
        else 'alarm'
      end as status,
      title || ' max user duration in seconds is set to ' || max_user_duration_in_seconds || ' seconds.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_appstream_fleet;
  EOQ
}

query "appstream_fleet_idle_disconnect_timeout_600_seconds" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when idle_disconnect_timeout_in_seconds <= 600 then 'ok'
        else 'alarm'
      end as status,
      title || ' idle disconnect timeout in seconds is set to ' || idle_disconnect_timeout_in_seconds || ' seconds.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_appstream_fleet;
  EOQ
}

