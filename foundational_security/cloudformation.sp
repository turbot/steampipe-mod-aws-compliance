locals {
  foundational_security_cloudformation_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/CloudFormation"
  })
}

benchmark "foundational_security_cloudformation" {
  title         = "CloudFormation"
  documentation = file("./foundational_security/docs/foundational_security_cloudformation.md")
  children = [
    control.foundational_security_cloudformation_1
  ]

  tags = merge(local.foundational_security_cloudformation_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_cloudformation_1" {
  title         = "1 CloudFormation stacks should be integrated with Simple Notification Service (SNS)"
  description   = "This control checks whether an Amazon Simple Notification Service notification is integrated with a CloudFormation stack. The control fails for a CloudFormation stack if there is no SNS notification associated with it."
  severity      = "low"
  query         = query.cloudformation_stack_notifications_enabled
  documentation = file("./foundational_security/docs/foundational_security_cloudformation_1.md")

  tags = merge(local.foundational_security_cloudformation_common_tags, {
    foundational_security_item_id  = "cloudformation_1"
    foundational_security_category = "application_monitoring"
  })
}
