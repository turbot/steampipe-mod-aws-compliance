benchmark "ffiec_d_3_cc" {
  title       = "Corrective Controls (CC)"
  description = "Corrective Controls are utilized to resolve system and software vulnerabilities through patch management and remediation of issues identified during vulnerability scans and penetration testing."
  children = [
    benchmark.ffiec_d_3_cc_pm_b_1,
    benchmark.ffiec_d_3_cc_pm_b_3
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_cc_pm_b_1" {
  title       = "D3.CC.PM.B.1"
  description = "A patch management program is implemented and ensures that software and firmware patches are applied in a timely manner."
  children = [
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_cc_pm_b_3" {
  title       = "D3.CC.PM.B.3"
  description = "Patch management reports are reviewed and reflect missing security patches."
  children = [
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.ffiec_common_tags
}
