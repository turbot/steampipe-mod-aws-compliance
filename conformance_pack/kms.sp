locals {
  conformance_pack_kms_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/KMS"
  })
}

control "kms_key_not_pending_deletion" {
  title       = "KMS keys should not be pending deletion"
  description = "To help protect data at rest, ensure necessary customer master keys (CMKs) are not scheduled for deletion in AWS Key Management Service (AWS KMS)."
  query       = query.kms_key_not_pending_deletion

  tags = merge(local.conformance_pack_kms_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "kms_cmk_rotation_enabled" {
  title       = "KMS CMK rotation should be enabled"
  description = "Enable key rotation to ensure that keys are rotated once they have reached the end of their crypto period."
  query       = query.kms_cmk_rotation_enabled

  tags = merge(local.conformance_pack_kms_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hippa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "kms_key_decryption_restricted_in_iam_customer_managed_policy" {
  title       = "KMS key decryption should be restricted in IAM customer managed policy"
  description = "Checks whether the default version of IAM customer managed policies allow principals to use the AWS KMS decryption actions on all resources. This control uses Zelkova, an automated reasoning engine, to validate and warn you about policies that may grant broad access to your secrets across AWS accounts. This control fails if the kms:Decrypt or kms:ReEncryptFrom actions are allowed on all KMS keys. The control evaluates both attached and unattached customer managed policies. It does not check inline policies or AWS managed policies."
  query       = query.kms_key_decryption_restricted_in_iam_customer_managed_policy

  tags = merge(local.conformance_pack_kms_common_tags, {
    hipaa = "true"
  })
}

control "kms_key_decryption_restricted_in_iam_inline_policy" {
  title       = "KMS key decryption should be restricted in IAM inline policy"
  description = "Checks whether the inline policies that are embedded in your IAM identities (role, user, or group) allow the AWS KMS decryption actions on all KMS keys. This control uses Zelkova, an automated reasoning engine, to validate and warn you about policies that may grant broad access to your secrets across AWS accounts. This control fails if kms:Decrypt or kms:ReEncryptFrom actions are allowed on all KMS keys in an inline policy."
  query       = query.kms_key_decryption_restricted_in_iam_inline_policy

  tags = merge(local.conformance_pack_kms_common_tags, {
    hipaa = "true"
  })
}

control "kms_cmk_policy_prohibit_public_access" {
  title       = "KMS CMK policies should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS KMS CMK cannot be publicly accessed."
  query       = query.kms_cmk_policy_prohibit_public_access

  tags = merge(local.conformance_pack_kms_common_tags, {
    other_checks = "true"
  })
}
