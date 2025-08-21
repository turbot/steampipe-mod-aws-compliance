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
    with contactflow_logs_attribute as (
      select
        concat('arn:', a.partition, ':connect:', a.region, ':', a.account_id, ':instance/', a.instance_id) as instance_id
      from
        aws_connect_instance as i
        left join aws_connect_instance_attribute as a on i.arn = concat('arn:', a.partition, ':connect:', a.region, ':', a.account_id, ':instance/', a.instance_id)
      where
        attribute_type = 'CONTACTFLOW_LOGS'
        and value = 'true'
    )
    select
      arn as resource,
      case
        when a.instance_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.instance_id is not null then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_connect_instance as i
      left join contactflow_logs_attribute as a on a.instance_id = i.arn;
  EOQ
}

