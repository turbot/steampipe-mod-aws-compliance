
query "memorydb_cluster_encryption_at_rest_and_encryption_at_transit_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when kms_key_id is not null and tls_enabled = true then 'ok'
        else 'alarm'
      end as status,
        when kms_key_id is not null and tls_enabled = true then arn || ' has encryption at rest and encryption at transit enabled.'
        else arn || ' does not have encryption at rest and encryption at transit enabled.'
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_memorydb_cluster;
  EOQ
}
