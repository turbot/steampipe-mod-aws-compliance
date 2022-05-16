benchmark "fedramp_moderate_rev_4_si" {
  title       = benchmark.nist_800_53_rev_4_si.title
  description = benchmark.nist_800_53_rev_4_si.description
  children = [
    benchmark.fedramp_moderate_rev_4_si_2,
    benchmark.fedramp_moderate_rev_4_si_4,
    benchmark.fedramp_moderate_rev_4_si_7,
    benchmark.fedramp_moderate_rev_4_si_12
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_2" {
  title       = benchmark.nist_800_53_rev_4_si_2.title
  description = benchmark.nist_800_53_rev_4_si_2.description
  children = [
    benchmark.fedramp_moderate_rev_4_si_2_2,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_2_2" {
  title       = "Automated Flaw Remediation Status (SI-2(2))"
  description = "The organization employs automated mechanisms at least monthly to determine the state of information system components with regard to flaw remediation."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_4" {
  title       = benchmark.nist_800_53_rev_4_si_4.title
  description = benchmark.nist_800_53_rev_4_si_4.description
  children = [
    benchmark.fedramp_moderate_rev_4_si_4_1,
    benchmark.fedramp_moderate_rev_4_si_4_16,
    benchmark.fedramp_moderate_rev_4_si_4_2,
    benchmark.fedramp_moderate_rev_4_si_4_4,
    benchmark.fedramp_moderate_rev_4_si_4_5,
    benchmark.fedramp_moderate_rev_4_si_4_a_b_c,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_4_a_b_c" {
  title       = "SI-4(a)(b)(c)"
  description = "The organization: a. Monitors the information system to detect: 1. Attacks and indicators of potential attacks in accordance with [Assignment: organization- defined monitoring objectives]; and 2. Unauthorized local, network, and remote connections; b. Identifies unauthorized use of the information system through [Assignment: organization- defined techniques and methods]; c. Deploys monitoring devices: i. strategically within the information system to collect organization-determined essential information; and (ii) at ad hoc locations within the system to track specific types of transactions of interest to the organization."
  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.elb_application_lb_waf_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled,
    control.wafv2_web_acl_logging_enabled,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_4_1" {
  title       = benchmark.nist_800_53_rev_4_si_4_1.title
  description = benchmark.nist_800_53_rev_4_si_4_1.description
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.fedramp_moderate_rev_4_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "fedramp_moderate_rev_4_si_4_2" {
  title       = benchmark.nist_800_53_rev_4_si_4_2.title
  description = benchmark.nist_800_53_rev_4_si_4_2.description
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.guardduty_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.securityhub_enabled,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_4_4" {
  title       = benchmark.nist_800_53_rev_4_si_4_4.title
  description = benchmark.nist_800_53_rev_4_si_4_4.description
  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_4_5" {
  title       = benchmark.nist_800_53_rev_4_si_4_5.title
  description = benchmark.nist_800_53_rev_4_si_4_5.description
  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_4_16" {
  title       = benchmark.nist_800_53_rev_4_si_4_16.title
  description = benchmark.nist_800_53_rev_4_si_4_16.description
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.guardduty_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.securityhub_enabled,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_7" {
  title       = benchmark.nist_800_53_rev_4_si_7.title
  description = benchmark.nist_800_53_rev_4_si_7.description
  children = [
    benchmark.fedramp_moderate_rev_4_si_7_1,
    control.cloudtrail_trail_validation_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_7_1" {
  title       = benchmark.nist_800_53_rev_4_si_7_1.title
  description = benchmark.nist_800_53_rev_4_si_7_1.description
  children = [
    control.cloudtrail_trail_validation_enabled,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_si_12" {
  title       = benchmark.nist_800_53_rev_4_si_12.title
  description = benchmark.nist_800_53_rev_4_si_12.description
  children = [
    control.backup_plan_min_retention_35_days,
    control.cloudwatch_log_group_retention_period_365,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_versioning_enabled,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}