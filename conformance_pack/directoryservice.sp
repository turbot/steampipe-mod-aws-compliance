locals {
  conformance_pack_directoryservice_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DirectoryService"
  })
}

control "directory_service_directory_snapshots_limit_2" {
  title       = "Directory Service directories manual snapshots limit should not be less than 2"
  description = "Ensure you keep track of the number of manual snapshots for your monitor to guarantee sufficient capacity when it becomes necessary."
  query       = query.directory_service_directory_snapshots_limit_2

  tags = merge(local.conformance_pack_directoryservice_common_tags, {
    other_checks = "true"
  })
}

control "directory_service_directory_sns_notifications_enabled" {
  title       = "Directory Service directories should have SNS notification enabled"
  description = "This control verifies whether SNS messaging has been set up to receive email or text notifications for any changes in the directory's status."
  query       = query.directory_service_directory_sns_notifications_enabled

  tags = merge(local.conformance_pack_directoryservice_common_tags, {
    other_checks = "true"
  })
}

control "directory_service_certificate_expires_90_days" {
  title       = "Directory Service certificates should not expire within 90 days"
  description = "Is is recommended to monitor certificate expiration and implement automated alerts to notify the responsible team for timely certificate replacement or removal."
  query       = query.directory_service_certificate_expires_90_days

  tags = merge(local.conformance_pack_directoryservice_common_tags, {
    other_checks = "true"
  })
}

query "directory_service_directory_snapshots_limit_2" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when snapshot_limit ->> 'ManualSnapshotsLimitReached' = 'true' then 'alarm'
        when ((snapshot_limit ->> 'ManualSnapshotsLimit')::int - (snapshot_limit ->> 'ManualSnapshotsCurrentCount')::int) <= 2 then 'alarm'
        else 'ok'
      end as status,
      case
        when snapshot_limit ->> 'ManualSnapshotsLimitReached' = 'true' then title || ' has reached ' || (snapshot_limit ->> 'ManualSnapshotsLimit') || ' snapshots limit.'
        when ((snapshot_limit ->> 'ManualSnapshotsLimit')::int - (snapshot_limit ->> 'ManualSnapshotsCurrentCount')::int) <= 2 then title || ' is about to reach its ' || (snapshot_limit ->> 'ManualSnapshotsLimit') || ' snapshot limit.'
        else title || ' is using ' || (snapshot_limit ->> 'ManualSnapshotsCurrentCount') || ' out of ' || (snapshot_limit ->> 'ManualSnapshotsLimit') || ' snapshots limit.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_directory_service_directory;
  EOQ
}

query "directory_service_directory_sns_notifications_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(event_topics) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(event_topics) > 0 then title || ' SNS notifications enabled.'
        else title || ' SNS notifications disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_directory_service_directory;
  EOQ
}

query "directory_service_certificate_expires_90_days" {
  sql = <<-EOQ
    select
      certificate_id as resource,
      case
        when date(expiry_date_time) - date(current_date) >= 90 then 'ok'
        else 'alarm'
      end as status,
      title || ' expires ' || to_char(expiry_date_time, 'DD-Mon-YYYY') ||
        ' (' || extract(day from expiry_date_time - current_date) || ' days).' as reason
      ${local.common_dimensions_sql}
    from
      aws_directory_service_certificate;
  EOQ
}
