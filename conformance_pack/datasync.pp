locals {
  conformance_pack_datasync_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DataSync"
  })
}

control "datasync_task_logging_enabled" {
  title       = "DataSync tasks should have logging enabled"
  description = "This control checks whether an AWS DataSync task has logging enabled. The control fails if the task doesn't have logging enabled."
  query       = query.datasync_task_logging_enabled

  tags = local.conformance_pack_datasync_common_tags
}

query "datasync_task_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when cloud_watch_log_group_arn is not null and options ->> 'LogLevel' in ('BASIC', 'TRANSFER') then 'ok'
        else 'alarm'
      end as status,
      case
        when cloud_watch_log_group_arn is not null and options ->> 'LogLevel' in ('BASIC', 'TRANSFER') then title || ' ' || (options ->> 'LogLevel') || ' level logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_datasync_task;
  EOQ
}
