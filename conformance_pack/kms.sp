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