locals {
  foundational_security_sns_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/SNS"
  })
}

benchmark "foundational_security_sns" {
  title         = "SNS"
  documentation = file("./foundational_security/docs/foundational_security_sns.md")
  children = [
    control.foundational_security_sns_1,
    control.foundational_security_sns_2,
    control.foundational_security_sns_4
  ]

  tags = merge(local.foundational_security_sns_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_sns_1" {
  title         = "1 SNS topics should be encrypted at rest using AWS KMS"
  description   = "This control checks whether an SNS topic is encrypted at rest using AWS KMS."
  severity      = "medium"
  query         = query.sns_topic_encrypted_at_rest
  documentation = file("./foundational_security/docs/foundational_security_sns_1.md")

  tags = merge(local.foundational_security_sns_common_tags, {
    foundational_security_item_id  = "sns_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_sns_2" {
  title         = "2 Logging of delivery status should be enabled for notification messages sent to a topic"
  description   = "This control checks whether logging is enabled for the delivery status of notification messages sent to an Amazon SNS topic for the endpoints. This control fails if the delivery status notification for messages is not enabled."
  severity      = "medium"
  query         = query.sns_topic_notification_delivery_status_enabled
  documentation = file("./foundational_security/docs/foundational_security_sns_2.md")

  tags = merge(local.foundational_security_sns_common_tags, {
    foundational_security_item_id  = "sns_2"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_sns_4" {
  title         = "4 SNS topic access policies should not allow public access"
  description   = "This control checks if the Amazon SNS topic access policy allows public access. This control fails if the SNS topic access policy allows public access."
  severity      = "high"
  query         = query.sns_topic_policy_prohibit_public_access
  documentation = file("./foundational_security/docs/foundational_security_sns_4.md")

  tags = merge(local.foundational_security_sns_common_tags, {
    foundational_security_item_id  = "sns_4"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

