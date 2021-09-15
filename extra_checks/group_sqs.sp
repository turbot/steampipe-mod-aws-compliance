locals {
  extra_checks_sqs_common_tags = merge(local.extra_checks_common_tags, {
    service = "sqs"
  })
}

benchmark "group_sqs" {
  title       = "SQS Extra Checks"
  description = "This group of SQS extra checks shows results of controls related to SQS service."
  children = [
    control.sqs_queue_policy_no_public_access
  ]

  tags = local.extra_checks_sqs_common_tags
}

control "sqs_queue_policy_no_public_access" {
  title       = "Check if SQS queues have policy set as Public"
  description = "Publicly accessible services could expose sensible data to bad actors. Ensure there is a business requirement for service to be public."
  sql         = query.sqs_queue_policy_no_public_access.sql

  tags = merge(local.extra_checks_sqs_common_tags, {
    extra_check_category = "infrastructure_security"
  })
}