benchmark "nist_800_53_rev_4_au_9" {
  title       = "AU-9 Protection Of Audit Information"
  description = "The information system protects audit information and audit tools from unauthorized access, modification, and deletion."
  children = [
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.log_group_encryption_at_rest_enabled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}