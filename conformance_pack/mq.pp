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

query "mq_broker_audit_log_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (logs -> 'Audit')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (logs -> 'Audit')::bool then title || ' audit log enabled.'
        else title || ' audit log disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_mq_broker;
  EOQ
}

query "mq_broker_auto_minor_version_upgrade_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when auto_minor_version_upgrade then 'ok'
        else 'alarm'
      end as status,
      case
        when auto_minor_version_upgrade then title || ' auto minor version upgrade enabled.'
        else title || ' auto minor version upgrade disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_mq_broker;
  EOQ
}