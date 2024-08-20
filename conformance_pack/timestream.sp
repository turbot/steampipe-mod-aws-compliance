query "timestreamwrite_database_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when kms_key_id is not null then 'ok'
        else 'alarm'
      end as status,
        when kms_key_id is not null then arn || ' has encryption at rest enabled.'
        else arn || ' does not have encryption at rest enabled.'
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_timestreamwrite_database;
  EOQ
}