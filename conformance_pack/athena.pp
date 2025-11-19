locals {
  conformance_pack_athena_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Athena"
  })
}

control "athena_workgroup_encryption_at_rest_enabled" {
  title       = "Athena workgroups should be encrypted at rest"
  description = "This control checks if an Athena workgroup is encrypted at rest. The control fails if an Athena workgroup isn't encrypted at rest."
  query       = query.athena_workgroup_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_athena_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "athena_workgroup_enforce_configuration_enabled" {
  title       = "Athena workgroups should enforce configuration"
  description = "This control checks if an Athena workgroup enforces configuration. The control fails if an Athena workgroup doesn't enforce configuration."
  query       = query.athena_workgroup_enforce_configuration_enabled

  tags = local.conformance_pack_athena_common_tags
}

control "athena_workgroup_logging_enabled" {
  title         = "Athena workgroups should have logging enabled"
  description   = "This control checks whether an Amazon Athena workgroup has logging enabled. The control fails if the workgroup doesn't have logging enabled."
  query         = query.athena_workgroup_logging_enabled

  tags = local.conformance_pack_athena_common_tags
}

query "athena_workgroup_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when coalesce(managed_query_results_enabled, false) then 'ok'
        when encryption_option in ('SSE_S3','SSE_KMS','CSE_KMS') then 'ok'
        else 'alarm'
      end as status,
      case
        when managed_query_results_enabled and managed_query_results_kms_key is not null then name || ' MQR enabled with customer-managed KMS key ' || managed_query_results_kms_key || '.'
        when managed_query_results_enabled then name || ' MQR enabled (encrypted with AWS-owned key).'
        when encryption_option in ('SSE_KMS','CSE_KMS') then name || ' classic results ' || encryption_option || ' with KMS ' || coalesce(result_configuration_kms_key,'(unspecified)') || '.'
        when encryption_option = 'SSE_S3' then name || ' classic results SSE_S3.'
        else name || ' no result encryption configured.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_athena_workgroup;
  EOQ
}

query "athena_workgroup_enforce_configuration_enabled" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when enforce_workgroup_configuration then 'ok'
        else 'alarm'
      end as status,
      case
        when enforce_workgroup_configuration then name || ' has enforce workgroup configuration enabled.'
        else name || ' has enforce workgroup configuration disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_athena_workgroup;
  EOQ
}

query "athena_workgroup_logging_enabled" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when publish_cloudwatch_metrics_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when publish_cloudwatch_metrics_enabled then name || ' workgroup logging enabled.'
        else name || ' workgroup logging disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_athena_workgroup;
  EOQ
}
