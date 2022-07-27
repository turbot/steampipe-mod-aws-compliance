locals {
  conformance_pack_fsx_common_tags = {
    service = "AWS/FSx"
  }
}

control "fsx_file_system_protected_by_backup_plan" {
  title       = "FSx file system should be protected by backup plan"
  description = "Checks if Amazon FSx File Systems are protected by a backup plan. The rule is non complaint if the Amazon FSx File System is not covered by a backup plan."
  sql         = query.fsx_file_system_protected_by_backup_plan.sql

  tags = merge(local.conformance_pack_fsx_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gxp_eu_annex_11        = "true"
    hipaa                  = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}
