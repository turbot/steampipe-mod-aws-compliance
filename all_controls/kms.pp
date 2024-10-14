locals {
  all_controls_kms_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/KMS"
  })
}

benchmark "all_controls_kms" {
  title       = "KMS"
  description = "This section contains recommendations for configuring KMS resources."
  children = [
    control.kms_cmk_policy_prohibit_public_access,
    control.kms_cmk_rotation_enabled,
    control.kms_cmk_unused,
    control.kms_key_decryption_restricted_in_iam_customer_managed_policy,
    control.kms_key_decryption_restricted_in_iam_inline_policy,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.all_controls_kms_common_tags, {
    type = "Benchmark"
  })
}
