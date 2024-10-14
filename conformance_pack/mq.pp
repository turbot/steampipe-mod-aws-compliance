locals {
  conformance_pack_mq_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/MQ"
  })
}

control "mq_broker_restrict_public_access" {
  title       = "MQ brokers should restrict public access"
  description = "Ensure whether MQ broker is not publicly accessible. The rule is compliant if the MQ broker is publicly accessible."
  query       = query.mq_broker_restrict_public_access

  tags = local.conformance_pack_mq_common_tags
}

query "mq_broker_restrict_public_access" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when publicly_accessible then 'alarm'
        else 'ok'
      end as status,
      case
        when publicly_accessible then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_mq_broker;
  EOQ
}