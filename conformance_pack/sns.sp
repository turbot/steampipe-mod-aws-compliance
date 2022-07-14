locals {
  conformance_pack_sns_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SNS"
  })
}

control "sns_topic_encrypted_at_rest" {
  title       = "SNS topics should be encrypted at rest"
  description = "To help protect data at rest, ensure that your Amazon Simple Notification Service (Amazon SNS) topics require encryption using AWS Key Management Service (AWS KMS)."
  sql         = query.sns_topic_encrypted_at_rest.sql

  tags = merge(local.conformance_pack_sns_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
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
  sql         = query.sns_topic_policy_prohibit_public_access.sql

  tags = merge(local.conformance_pack_sns_common_tags, {
    other_checks = "true"
  })
}
