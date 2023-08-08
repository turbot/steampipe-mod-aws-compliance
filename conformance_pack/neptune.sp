locals {
  conformance_pack_neptune_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Neptune"
  })
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
