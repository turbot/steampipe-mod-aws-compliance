locals {
  conformance_pack_athena_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Athena"
  })
}

control "athena_workgroup_encryption_at_rest_enabled" {
  title       = "Athena workgroups should be encrypted at rest"
  description = "This control checks if an Athena workgroup is encrypted at rest. The control fails if an Athena workgroup isn't encrypted at rest."
  query       = query.athena_workgroup_encryption_at_rest_enabled

  tags = local.conformance_pack_athena_common_tags
}

query "athena_workgroup_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when encryption_option is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_option is not null then name || ' encryption at rest enabled.'
        else name || ' encryption at rest disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_athena_workgroup;
  EOQ
}
