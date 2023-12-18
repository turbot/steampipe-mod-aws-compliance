locals {
  conformance_pack_docdb_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/DocumentDB"
  })
}

control "docdb_cluster_encryption_at_rest_enabled" {
  title       = "AWS DocumentDB clusters should be encrypted at rest"
  description = "This control checks whether an AWS DocumentDB cluster is encrypted at rest. The control fails if an AWS DocumentDB cluster isn't encrypted at rest."
  query       = query.docdb_cluster_encryption_at_rest_enabled

  tags = local.conformance_pack_docdb_common_tags
}

control "docdb_cluster_backup_retention_period_7_days" {
  title       = "AWS DocumentDB clusters should have an adequate backup retention period"
  description = "This control checks whether an AWS DocumentDB cluster has a backup retention period greater than or equal to 7 days. The control fails if the backup retention period is less than 7 days."
  query       = query.docdb_cluster_backup_retention_period_7_days

  tags = local.conformance_pack_docdb_common_tags
}

control "docdb_cluster_instance_logging_enabled" {
  title       = "DocumentDB instance logging should be enabled"
  description = "To help with logging and monitoring within your environment, ensure AWS DocumentDB instance logging is enabled."
  query       = query.docdb_cluster_instance_logging_enabled

  tags = local.conformance_pack_docdb_common_tags
}

control "docdb_cluster_instance_encryption_at_rest_enabled" {
  title       = "DocumentDB instance should be encrypted at rest"
  description = "This control checks whether an DocumentDB instance is encrypted at rest. The control fails if an DocumentDB instance isn't encrypted at rest."
  query       = query.docdb_cluster_instance_encryption_at_rest_enabled

  tags = local.conformance_pack_docdb_common_tags
}

control "docdb_cluster_deletion_protection_enabled" {
  title       = "DocumentDB clusters should have deletion protection enabled"
  description = "Ensure DocumentDB clusters have deletion protection enabled."
  query       = query.docdb_cluster_deletion_protection_enabled

  tags = local.conformance_pack_docdb_common_tags
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

query "docdb_cluster_instance_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      db_instance_arn as resource,
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
      aws_docdb_cluster_instance;
  EOQ
}

query "docdb_cluster_deletion_protection_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when deletion_protection then 'ok'
        else 'alarm'
      end status,
      case
        when deletion_protection then title || ' deletion protection enabled.'
        else title || ' deletion protection disabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_docdb_cluster;
  EOQ
}
