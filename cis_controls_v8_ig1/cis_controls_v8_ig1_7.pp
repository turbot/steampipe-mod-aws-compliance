benchmark "cis_controls_v8_ig1_7" {
  title       = "7 Continuous Vulnerability Management"
  description = "Develop a plan to continuously assess and track vulnerabilities on all enterprise assets within the enterprise’s infrastructure, in order to remediate, and minimize, the window of opportunity for attackers. Monitor public and private industry sources for new threat and vulnerability information."
  children = [
    benchmark.cis_controls_v8_ig1_7_1,
    benchmark.cis_controls_v8_ig1_7_3
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_7_1" {
  title       = "7.1 Establish and Maintain a Vulnerability Management Process"
  description = "Establish and maintain a documented vulnerability management process for enterprise assets. Review and update documentation annually, or when significant enterprise changes occur that could impact this Safeguard."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_7_3" {
  title       = "7.3 Perform Automated Operating System Patch Management"
  description = "Perform operating system updates on enterprise assets through automated patch management on a monthly, or more frequent, basis."
  children = [
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}
