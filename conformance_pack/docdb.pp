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

  tags = merge(local.conformance_pack_docdb_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
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

control "docdb_cluster_snapshot_restrict_public_access" {
  title       = "Amazon DocumentDB cluster snapshots should not be public"
  description = "This control checks whether Amazon DocumentDB cluster snapshots are public. The control fails if any existing Amazon DocumentDB cluster snapshots are public."
  query       = query.docdb_cluster_snapshot_restrict_public_access

  tags = merge(local.conformance_pack_docdb_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "docdb_cluster_encryption_in_transit_enabled" {
  title         = "Amazon DocumentDB clusters should be encrypted in transit"
  description   = "This controls checks whether an Amazon DocumentDB cluster requires TLS for connections to the cluster. The control fails if the cluster parameter group associated with the cluster is not in sync, or the TLS cluster parameter is set to disabled or enabled."
  query         = query.docdb_cluster_encryption_in_transit_enabled

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

query "docdb_cluster_snapshot_restrict_public_access" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (cluster_snapshot ->> 'AttributeName' = 'restore') and cluster_snapshot -> 'AttributeValues' = '["all"]' then 'alarm'
        else 'ok'
      end status,
      case
        when (cluster_snapshot ->> 'AttributeName' = 'restore') and cluster_snapshot -> 'AttributeValues' = '["all"]' then title || ' does not restrict public access.'
        else title || ' restrict public access.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_docdb_cluster_snapshot,
      jsonb_array_elements(db_cluster_snapshot_attributes) as cluster_snapshot;
  EOQ
}

query "docdb_cluster_encryption_in_transit_enabled" {
  sql = <<-EOQ
    with docdb_cluster as materialized (
      select
        db_cluster_parameter_group,
        arn,
        account_id,
        region,
        engine,
        tags,
        title,
        _ctx
      from
        aws_docdb_cluster
    ), docdb_pg_tls_settings as (
      select
        g.name,
        p ->> 'ParameterValue'
      from
        docdb_cluster as c,
        aws_rds_db_cluster_parameter_group as g,
        jsonb_array_elements(parameters) as p
      where
        c.db_cluster_parameter_group = g.name
        and g.account_id = c.account_id
        and g.region = c.region
        and p ->> 'ParameterName' = 'tls'
       and p ->> 'ParameterValue' in ('disabled', 'enabled')
    )
    select
      c.arn as resource,
      c.engine,
      case
        when p.name is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when p.name is not null then title || ' encryption in transit disabled.'
        else title || ' encryption in transit enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      docdb_cluster as c
      left join docdb_pg_tls_settings as p on p.name = c.db_cluster_parameter_group;
  EOQ
}