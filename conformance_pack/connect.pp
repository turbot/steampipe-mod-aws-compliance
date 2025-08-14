locals {
  conformance_pack_connect_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Connect"
  })
}

control "connect_instance_logging_enabled" {
  title       = "Amazon Connect instances should have CloudWatch logging enabled"
  description = "This control checks whether an Amazon Connect instance is configured to generate and store flow logs in an Amazon CloudWatch log group. The control fails if the Amazon Connect instance isn't configured to generate and store flow logs in a CloudWatch log group."
  query       = query.connect_instance_logging_enabled

  tags = local.conformance_pack_connect_common_tags
}

query "connect_instance_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (contactflow_logs)::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (contactflow_logs)::bool then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_connect_instance;
  EOQ
}

