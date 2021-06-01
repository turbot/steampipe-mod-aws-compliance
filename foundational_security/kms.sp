locals {
  foundational_security_kms_common_tags = merge(local.foundational_security_common_tags, {
    service = "kms"
  })
}

benchmark "foundational_security_kms" {
  title         = "KMS"
  #documentation = file("./foundational_security/docs/foundational_security_kms.md")
  children = [
    control.foundational_security_kms_1,
    control.foundational_security_kms_2
  ]
  tags          = local.foundational_security_kms_common_tags
}

control "foundational_security_kms_1" {
  title         = "1 IAM customer managed policies should not allow decryption actions on all KMS keys"
  description   = "Checks whether the default version of IAM customer managed policies allow principals to use the AWS KMS decryption actions on all resources. This control uses Zelkova, an automated reasoning engine, to validate and warn you about policies that may grant broad access to your secrets across AWS accounts. This control fails if the kms:Decrypt or kms:ReEncryptFrom actions are allowed on all KMS keys. The control evaluates both attached and unattached customer managed policies. It does not check inline policies or AWS managed policies."
  severity      = "medium"
  sql           = query.kms_key_decryption_restricted_in_iam_customer_managed_policy.sql
  #documentation = file("./foundational_security/docs/foundational_security_kms_1.md")

  tags = merge(local.foundational_security_kms_common_tags, {
    foundational_security_item_id  = "kms_1"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_kms_2" {
  title         = "2 IAM principals should not have IAM inline policies that allow decryption actions on all KMS keys"
  description   = "Checks whether the inline policies that are embedded in your IAM identities (role, user, or group) allow the AWS KMS decryption actions on all KMS keys. This control uses Zelkova, an automated reasoning engine, to validate and warn you about policies that may grant broad access to your secrets across AWS accounts. This control fails if kms:Decrypt or kms:ReEncryptFrom actions are allowed on all KMS keys in an inline policy."
  severity      = "medium"
  sql           = query.kms_key_decryption_restricted_in_iam_inline_policy.sql
  #documentation = file("./foundational_security/docs/foundational_security_kms_2.md")

  tags = merge(local.foundational_security_kms_common_tags, {
    foundational_security_item_id  = "kms_2"
    foundational_security_category = "secure_access_management"
  })
}
