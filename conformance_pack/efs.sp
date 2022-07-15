locals {
  conformance_pack_efs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EFS"
  })
}

control "efs_file_system_encrypt_data_at_rest" {
  title       = "EFS file system encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic File System (EFS)."
  sql         = query.efs_file_system_encrypt_data_at_rest.sql

  tags = merge(local.conformance_pack_efs_common_tags, {
    ffiec              = "true"
    gdpr               = "true"
    gxp_21_cfr_part_11 = "true"
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_800_53_rev_5  = "true"
    nist_csf           = "true"
    nist_800_171_rev_2 = "true"
    rbi_cyber_security = "true"
  })
}

control "efs_file_system_in_backup_plan" {
  title       = "EFS file systems should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon Elastic File System (Amazon EFS) file systems are a part of an AWS Backup plan."
  sql         = query.efs_file_system_automatic_backups_enabled.sql

  tags = merge(local.conformance_pack_efs_common_tags, {
    ffiec              = "true"
    gxp_21_cfr_part_11 = "true"
    hipaa              = "true"
    nist_800_171_rev_2 = "true"
    nist_800_53_rev_4  = "true"
    nist_800_53_rev_5  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
    soc_2              = "true"
  })
}

control "efs_file_system_protected_by_backup_plan" {
  title       = "EFS file systems should be protected by backup plan"
  description = "Ensure if Amazon Elastic File System (Amazon EFS) File Systems are protected by a backup plan. The rule is non complaint if the EFS File System is not covered by a backup plan."
  sql         = query.efs_file_system_protected_by_backup_plan.sql

  tags = merge(local.conformance_pack_efs_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "efs_file_system_encrypted_with_cmk" {
  title       = "EFS file systems should be encrypted with CMK"
  description = "Ensure Amazon Elastic File Systems (Amazon EFS) are encrypted using CMK. The rule is non complaint if the EFS File System is not encrypted using CMK."
  sql         = query.efs_file_system_encrypted_with_cmk.sql

  tags = merge(local.conformance_pack_efs_common_tags, {
    cisa_cyber_essentials = "true"
    other_checks          = "true"
  })
}

control "efs_file_system_enforces_ssl" {
  title       = "EFS file systems should enforce SSL"
  description = "To help protect data in transit, ensure that your EFS file systems require requests to use Secure Socket Layer (SSL)."
  sql         = query.efs_file_system_enforces_ssl.sql

  tags = merge(local.conformance_pack_efs_common_tags, {
    other_checks = "true"
  })
}
