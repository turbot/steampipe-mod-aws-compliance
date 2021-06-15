locals {
  conformance_pack_sns_common_tags = {
    service = "sns"
  }
}

control "sns_topic_encrypted_at_rest" {
  title       = "SNS topic should be encrypted at rest"
  description = "To help protect data at rest, ensure that your Amazon Simple Notification Service (Amazon SNS) topics require encryption using AWS Key Management Service (AWS KMS)."
  sql         = query.sns_topic_encrypted_at_rest.sql
  tags        = local.conformance_pack_sns_common_tags
}