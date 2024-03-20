locals {
  all_controls_eventbridge_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/EventBridge"
  })
}

benchmark "all_controls_eventbridge" {
  title       = "EventBridge"
  description = "This section contains recommendations for configuring EventBridge resources."
  children = [
    control.eventbridge_custom_bus_resource_based_policy_attached
  ]

  tags = merge(local.all_controls_eventbridge_common_tags, {
    type = "Benchmark"
  })
}
