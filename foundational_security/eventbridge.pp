locals {
  foundational_security_eventbridge_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/EventBridge"
  })
}

benchmark "foundational_security_eventbridge" {
  title         = "EventBridge"
  documentation = file("./foundational_security/docs/foundational_security_eventbridge.md")
  children = [
    control.foundational_security_eventbridge_3
  ]

  tags = merge(local.foundational_security_eventbridge_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_eventbridge_3" {
  title         = "3 EventBridge custom event buses should have a resource-based policy attached"
  description   = "This control checks if an Amazon EventBridge custom event bus has a resource-based policy attached. This control fails if the custom event bus doesn't have a resource-based policy."
  severity      = "low"
  query         = query.eventbridge_custom_bus_resource_based_policy_attached
  documentation = file("./foundational_security/docs/foundational_security_eventbridge_3.md")

  tags = merge(local.foundational_security_eventbridge_common_tags, {
    foundational_security_item_id  = "eventbridge_3"
    foundational_security_category = "resource_policy_configuration"
  })
}
