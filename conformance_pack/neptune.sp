locals {
  conformance_pack_neptune_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Neptune"
  })
}

control "neptune_db_cluster_encryption_at_rest_enabled" {
  title       = "Neptune DB clusters should be encrypted at rest"
  description = "This control checks whether a Neptune DB cluster is encrypted at rest. The control fails if a Neptune DB cluster isn't encrypted at rest."
  query       = query.neptune_db_cluster_encryption_at_rest_enabled

  tags = local.conformance_pack_neptune_common_tags
}

control "neptune_db_cluster_audit_logging_enabled" {
  title       = "Neptune DB clusters should publish audit logs to CloudWatch Logs"
  description = "This control checks whether a Neptune DB cluster publishes audit logs to AWS CloudWatch Logs. The control fails if a Neptune DB cluster doesn't publish audit logs to CloudWatch Logs. EnableCloudWatchLogsExport should be set to Audit."
  query       = query.neptune_db_cluster_audit_logging_enabled

  tags = local.conformance_pack_neptune_common_tags
}

control "neptune_db_cluster_snapshot_prohibit_public_access" {
  title       = "Neptune DB cluster snapshots should not be public"
  description = "This control checks whether a Neptune manual DB cluster snapshot is public. The control fails if a Neptune manual DB cluster snapshot is public."
  query       = query.neptune_db_cluster_snapshot_prohibit_public_access

  tags = local.conformance_pack_neptune_common_tags
}

control "neptune_db_cluster_deletion_protection_enabled" {
  title       = "Neptune DB clusters should have deletion protection enabled"
  description = "This control checks if a Neptune DB cluster has deletion protection enabled. The control fails if a Neptune DB cluster doesn't have deletion protection enabled."
  query       = query.neptune_db_cluster_deletion_protection_enabled

  tags = local.conformance_pack_neptune_common_tags
}

control "neptune_db_cluster_automated_backup_enabled" {
  title       = "Neptune DB clusters should have automated backups enabled"
  description = "This control checks whether a Neptune DB cluster has automated backups enabled, and a backup retention period greater than or equal to 7 days. The control fails if backups aren't enabled for the Neptune DB cluster, or if the retention period is less than 7 days."
  query       = query.neptune_db_cluster_automated_backup_enabled

  tags = local.conformance_pack_neptune_common_tags
}

control "neptune_db_cluster_snapshot_encryption_at_rest_enabled" {
  title       = "Neptune DB cluster snapshots should be encrypted at rest"
  description = "This control checks whether a Neptune DB cluster snapshot is encrypted at rest. The control fails if a Neptune DB cluster isn't encrypted at rest."
  query       = query.neptune_db_cluster_snapshot_encryption_at_rest_enabled

  tags = local.conformance_pack_neptune_common_tags
}

control "neptune_db_cluster_iam_authentication_enabled" {
  title       = "Neptune DB clusters should have IAM database authentication enabled"
  description = "This control checks if a Neptune DB cluster has IAM database authentication enabled. The control fails if IAM database authentication isn't enabled for a Neptune DB cluster."
  query       = query.neptune_db_cluster_iam_authentication_enabled

  tags = local.conformance_pack_neptune_common_tags
}

control "neptune_db_cluster_copy_tags_to_snapshot_enabled" {
  title       = "Neptune DB clusters should be configured to copy tags to snapshots"
  description = "This control checks if a Neptune DB cluster is configured to copy all tags to snapshots when the snapshots are created. The control fails if a Neptune DB cluster isn't configured to copy tags to snapshots."
  query       = query.neptune_db_cluster_copy_tags_to_snapshot_enabled

  tags = local.conformance_pack_neptune_common_tags
}

query "neptune_db_cluster_audit_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      engine,
      case
        when enabled_cloudwatch_logs_exports @> '["audit"]' then 'ok'
        else 'alarm'
      end as status,
      case
        when enabled_cloudwatch_logs_exports @> '["audit"]' then title || ' audit logging enabled.'
        else title || ' audit logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_neptune_db_cluster;
  EOQ
}

query "neptune_db_cluster_deletion_protection_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when deletion_protection then 'ok'
        else 'alarm'
      end as status,
      case
        when deletion_protection then title || ' deletion protection enabled.'
        else title || ' deletion protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_neptune_db_cluster;
  EOQ
}

query "neptune_db_cluster_encryption_at_rest_enabled" {
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
      aws_neptune_db_cluster;
  EOQ
}

query "neptune_db_cluster_iam_authentication_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when iam_database_authentication_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when iam_database_authentication_enabled then title || ' IAM authentication enabled.'
        else title || ' IAM authentication disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_neptune_db_cluster;
  EOQ
}

query "neptune_db_cluster_copy_tags_to_snapshot_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when copy_tags_to_snapshot then 'ok'
        else 'alarm'
      end as status,
      case
        when copy_tags_to_snapshot then title || ' copy tags to snapshot enabled.'
        else title || ' copy tags to snapshot disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_neptune_db_cluster;
  EOQ
}

query "neptune_db_cluster_automated_backup_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when backup_retention_period >= 7 then 'ok'
        else 'alarm'
      end as status,
      case
        when backup_retention_period >= 7 then title || ' automated backups enabled.'
        else title || ' automated backups disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_neptune_db_cluster;
  EOQ
}

query "neptune_db_cluster_snapshot_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      db_cluster_snapshot_arn as resource,
      case
        when storage_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when storage_encrypted then title || ' encrypted at rest.'
        else title || ' not encrypted at rest.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_neptune_db_cluster_snapshot;
  EOQ
}

query "neptune_db_cluster_snapshot_prohibit_public_access" {
  sql = <<-EOQ
    select
      db_cluster_snapshot_arn as resource,
      case
        when cluster_snapshot -> 'AttributeValues' = '["all"]' then 'alarm'
        else 'ok'
      end status,
      case
        when cluster_snapshot -> 'AttributeValues' = '["all"]' then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
      end reason
      ${local.common_dimensions_sql}
    from
      aws_neptune_db_cluster_snapshot,
      jsonb_array_elements(db_cluster_snapshot_attributes) as cluster_snapshot;
  EOQ
}
