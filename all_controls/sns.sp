locals {
  all_controls_sns_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/SNS"
  })
}

benchmark "all_controls_sns" {
  title       = "SNS"
  description = "This section contains recommendations for configuring SNS resources."
  children = [
    control.sns_topic_encrypted_at_rest,
    control.sns_topic_notification_delivery_status_enabled,
    control.sns_topic_policy_prohibit_cross_account_access,
    control.sns_topic_policy_prohibit_public_access,
    control.sns_topic_policy_prohibit_publishing_access,
    control.sns_topic_policy_prohibit_subscription_access
  ]

  tags = merge(local.all_controls_sns_common_tags, {
    type = "Benchmark"
  })
}
