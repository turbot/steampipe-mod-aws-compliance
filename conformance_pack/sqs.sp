locals {
  conformance_pack_sqs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SQS"
  })
}

control "sqs_queue_policy_prohibit_public_access" {
  title       = "SQS queue policies should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS SQS queues cannot be publicly accessed."
  sql         = query.sqs_queue_policy_prohibit_public_access.sql

  tags = merge(local.conformance_pack_sns_common_tags, {
    extra_checks = "true"
  })
}
