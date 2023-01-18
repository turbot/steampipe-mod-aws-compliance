locals {
  conformance_pack_cloudformation_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFormation"
  })
}

control "cloudformation_stack_output_no_secrets" {
  title       = "CloudFormation stacks outputs should not have any secrets"
  description = "Ensure CloudFormation stacks outputs do not contain secrets like user names, passwords, and tokens. It is recommended to remove secrets since outputs cannot be encrypted resulting in any entity with basic read-metadata-only and access to CloudFormation outputs having access to these secrets."
  query       = query.cloudformation_stack_output_no_secrets

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    other_checks = "true"
  })
}

control "cloudformation_stack_notifications_enabled" {
  title       = "CloudFormation stacks should have notifications enabled"
  description = "Ensure CloudFormation stacks are associated with an SNS topic to receive notifications when an event occurs."
  query       = query.cloudformation_stack_notifications_enabled

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    other_checks = "true"
  })
}

control "cloudformation_stack_rollback_enabled" {
  title       = "CloudFormation stacks should have rollback enabled"
  description = "Ensure CloudFormation stacks have the rollback feature enabled. Rollback triggers enable you to have AWS CloudFormation monitor the state of your application during stack creation and updating, and to rollback that operation if the application breaches the threshold of any of the alarms you've specified."
  query       = query.cloudformation_stack_rollback_enabled

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    other_checks = "true"
  })
}

