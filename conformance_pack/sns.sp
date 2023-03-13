locals {
  conformance_pack_sns_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SNS"
  })
}

control "sns_topic_encrypted_at_rest" {
  title       = "SNS topics should be encrypted at rest"
  description = "To help protect data at rest, ensure that your Amazon Simple Notification Service (Amazon SNS) topics require encryption using AWS Key Management Service (AWS KMS)."
  query       = query.sns_topic_encrypted_at_rest

  tags = merge(local.conformance_pack_sns_common_tags, {
    audit_manager_pci_v321 = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "sns_topic_policy_prohibit_public_access" {
  title       = "SNS topic policies should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS SNS topics cannot be publicly accessed."
  query       = query.sns_topic_policy_prohibit_public_access

  tags = merge(local.conformance_pack_sns_common_tags, {
    other_checks = "true"
  })
}

control "sns_topic_notification_delivery_status_enabled" {
  title         = "Logging of delivery status should be enabled for notification messages sent to a topic"
  description   = "This control checks whether logging is enabled for the delivery status of notification messages sent to an Amazon SNS topic for the endpoints. This control fails if the delivery status notification for messages is not enabled."
  query         = query.sns_topic_notification_delivery_status_enabled

  tags = merge(local.conformance_pack_sns_common_tags, {
    audit_manager_pci_v321 = "true"
  })
}