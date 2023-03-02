locals {
  conformance_pack_cloudformation_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFormation"
  })
}

control "cloudformation_stack_drift_detection_check" {
  title       = "CloudFormation stacks differ from the expected configuration"
  description = "Ensure if the actual configuration of a Cloud Formation stack differs, or has drifted, from the expected configuration, a stack is considered to have drifted if one or more of its resources differ from their expected configuration."
  query       = query.cloudformation_stack_drift_detection_check

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    audit_manager_pci_v321_requirement_1 = "true"
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

control "cloudformation_stack_termination_protection_enabled" {
  title       = "Cloudformation stacks termination protection should be enabled"
  description = "Ensure that Amazon CloudFormation stacks have termination protection feature enabled in order to protect them from being accidentally deleted. The safety feature can be enabled when you create the CloudFormation stack or for existing stacks using the AWS API (UpdateTerminationProtection command)."
  query       = query.cloudformation_stack_termination_protection_enabled

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    other_checks = "true"
  })
}
