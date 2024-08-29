locals {
  conformance_pack_eventbridge_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EventBridge"
  })
}

control "eventbridge_custom_bus_resource_based_policy_attached" {
  title       = "EventBridge custom event buses should have a resource-based policy attached"
  description = "This control checks if an Amazon EventBridge custom event bus has a resource-based policy attached. This control fails if the custom event bus doesn't have a resource-based policy.."
  query       = query.eventbridge_custom_bus_resource_based_policy_attached

  tags = merge(local.conformance_pack_eventbridge_common_tags, {
    acsc_essential_eight = "true"
  })
}

query "eventbridge_custom_bus_resource_based_policy_attached" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when name = 'default' then 'skip'
        when policy_std is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when name = 'default' then title || ' is default event bus.'
        when policy_std is not null then title || ' has resource based policy attached.'
        else title || ' does not have resource based policy attached.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_eventbridge_bus;
  EOQ
}
