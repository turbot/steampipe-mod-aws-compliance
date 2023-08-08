locals {
  conformance_pack_docdb_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DocumentDB"
  })
}

control "docdb_cluster_instance_logging_enabled" {
  title       = "DocumentDB instance logging should be enabled"
  description = "To help with logging and monitoring within your environment, ensure Amazon DocumentDB instance logging is enabled."
  query       = query.docdb_cluster_instance_logging_enabled

  tags = merge(local.conformance_pack_docdb_common_tags, {
    other_checks = "true"
  })
}

query "docdb_cluster_instance_logging_enabled" {
  sql = <<-EOQ
    select
      db_instance_arn as resource,
      engine,
      case
        when engine like 'docdb' and enabled_cloudwatch_logs_exports ?& array ['error', 'slowquery'] then 'ok'
        else 'alarm'
      end as status,
      case
        when engine like 'docdb' and enabled_cloudwatch_logs_exports ?& array ['error', 'slowquery']
        then title || ' ' || engine || ' logging enabled.'
        else title || ' logging not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_docdb_cluster_instance;
  EOQ
}

query "docdb_cluster_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when storage_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when storage_encrypted then title || ' encrypted at rest.'
        else title || ' not encrypted at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_docdb_cluster;
  EOQ
}

query "docdb_cluster_backup_retention_period_7_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when backup_retention_period >= 7 then 'ok'
        else 'alarm'
      end as status,
      title || ' backup retention period is ' || backup_retention_period || ' day(s).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_docdb_cluster;
  EOQ
}