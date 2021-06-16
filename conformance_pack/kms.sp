locals {
  conformance_pack_kms_common_tags = {
    service = "kms"
  }
}

control "kms_key_not_pending_deletion" {
  title       = "KMS keys should not be pending deletion"
  description = "To help protect data at rest, ensure necessary customer master keys (CMKs) are not scheduled for deletion in AWS Key Management Service (AWS KMS)."
  sql         = query.kms_key_not_pending_deletion.sql
  tags        = local.conformance_pack_kms_common_tags
}

control "kms_cmk_rotation_enabled" {
  title       = "KMS CMK rotation should be enabled"
  description = "Enable key rotation to ensure that keys are rotated once they have reached the end of their crypto period."
  sql         = query.kms_cmk_rotation_enabled.sql
  tags        = local.conformance_pack_kms_common_tags
}
