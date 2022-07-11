benchmark "nist_sp_800_171_rev_2_3_14" {
  title       = "3.14 System and Information integrity"
  description = "The SI control family correlates to controls that protect system and information integrity. These include flaw remediation, malicious code protection, information system monitoring, security alerts, software and firmware integrity, and spam protection."
  children = [
    benchmark.nist_sp_800_171_rev_2_3_14_1,
    benchmark.nist_sp_800_171_rev_2_3_14_2,
    benchmark.nist_sp_800_171_rev_2_3_14_3,
    benchmark.nist_sp_800_171_rev_2_3_14_4,
    benchmark.nist_sp_800_171_rev_2_3_14_6,
    benchmark.nist_sp_800_171_rev_2_3_14_7
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_14_1" {
  title       = "3.14.1"
  description = "Identify, report, and correct system flaws in a timely manner."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_14_2" {
  title       = "3.14.2"
  description = "Provide protection from malicious code at designated locations within organizational systems."
  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_14_3" {
  title       = "3.14.3"
  description = "Monitor system security alerts and advisories and take action in response."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_14_4" {
  title       = "3.14.4"
  description = "Update malicious code protection mechanisms when new releases are available."
  children = [
    control.guardduty_enabled
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_14_6" {
  title       = "3.14.6"
  description = "Monitor organizational systems, including inbound and outbound communications traffic, to detect attacks and indicators of potential attacks."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_14_7" {
  title       = "3.14.7"
  description = "Identify unauthorized use of organizational systems."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}


