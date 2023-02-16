benchmark "cis_controls_v8_ig1_7" {
  title       = "Continuous Vulnerability Management"
  description = "."
  children = [
    benchmark.cis_controls_v8_ig1_7_1,
    benchmark.cis_controls_v8_ig1_7_3
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_7_1" {
  title       = "7.1 - Establish and Maintain a Vulnerability Management Process"
  description = "Establish and maintain a documented vulnerability management process for enterprise assets. Review and update documentation annually, or when significant enterprise changes occur that could impact this Safeguard."
  children = [
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.guardduty_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_7_3" {
  title       = "7.3 - Perform Automated Operating System Patch Management"
  description = "Perform operating system updates on enterprise assets through automated patch management on a monthly, or more frequent, basis."
  children = [
    control.redshift_cluster_maintenance_settings_check,
    # control.ELASTIC_BEANSTALK_MANAGED_UPDATES_ENABLED,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}