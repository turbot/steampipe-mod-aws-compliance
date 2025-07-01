benchmark "nist_csf_v2_id" {
  title       = "Identify (ID)"
  description = "The organization's current cybersecurity risks are understood."
  children = [
    benchmark.nist_csf_v2_id_am,
    benchmark.nist_csf_v2_id_ra,
    benchmark.nist_csf_v2_id_im
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am" {
  title       = "Asset Management (ID.AM)"
  description = "Assets (e.g., data, hardware, software, systems, facilities, services, people) that enable the organization to achieve business purposes are identified and managed consistent with their relative importance to organizational objectives and the organization's risk strategy."
  children = [
    benchmark.nist_csf_v2_id_am_01,
    benchmark.nist_csf_v2_id_am_02,
    benchmark.nist_csf_v2_id_am_03,
    benchmark.nist_csf_v2_id_am_05,
    benchmark.nist_csf_v2_id_am_07,
    benchmark.nist_csf_v2_id_am_08
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra" {
  title       = "Risk Assessment (ID.RA)"
  description = "The cybersecurity risk to the organization, assets, and individuals is understood by the organization."
  children = [
    benchmark.nist_csf_v2_id_ra_01,
    benchmark.nist_csf_v2_id_ra_03,
    benchmark.nist_csf_v2_id_ra_04,
    benchmark.nist_csf_v2_id_ra_05,
    benchmark.nist_csf_v2_id_ra_08,
    benchmark.nist_csf_v2_id_ra_09
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_im" {
  title       = "Improvement (ID.IM)"
  description = "Improvements to organizational cybersecurity risk management processes, procedures and activities are identified across all CSF Functions."
  children = [
    benchmark.nist_csf_v2_id_im_01,
    benchmark.nist_csf_v2_id_im_02
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_01" {
  title       = "ID.AM-01"
  description = "Inventories of hardware managed by the organization are maintained."
  children = [
    control.ec2_instance_detailed_monitoring_enabled,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ssm_managed_instance_compliance_association_compliant
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_02" {
  title       = "ID.AM-02"
  description = "Inventories of software, services, and systems managed by the organization are maintained."
  children = [
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_eip_associated,
    control.vpc_network_acl_unused
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_03" {
  title       = "ID.AM-03"
  description = "Representations of the organization's authorized network communication and internal and external network data flows are maintained."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_05" {
  title       = "ID.AM-05"
  description = "Assets are prioritized based on classification, criticality, resources, and impact on the mission."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_07" {
  title       = "ID.AM-07"
  description = "Inventories of data and corresponding metadata for designated data types are maintained."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_am_08" {
  title       = "ID.AM-08"
  description = "Systems, hardware, software, services, and data are managed throughout their life cycles."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_protected_by_backup_plan,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_01" {
  title       = "ID.RA-01"
  description = "Vulnerabilities in assets are identified, validated, and recorded."
  children = [
    control.ec2_instance_no_high_level_finding_in_inspector_scan,
    control.ecr_repository_image_scan_on_push_enabled,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_03" {
  title       = "ID.RA-03"
  description = "Internal and external threats to the organization are identified and recorded."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_04" {
  title       = "ID.RA-04"
  description = "Potential impacts and likelihoods of threats exploiting vulnerabilities are identified and recorded."
  children = [
    control.ec2_instance_detailed_monitoring_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.securityhub_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_05" {
  title       = "ID.RA-05"
  description = "Threats, vulnerabilities, likelihoods, and impacts are used to understand inherent risk and inform risk response prioritization."
  children = [
     control.cloudtrail_bucket_not_public,
    control.cloudtrail_multi_region_read_write_enabled,
    control.cloudtrail_s3_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.config_enabled_all_regions,
    control.ec2_instance_detailed_monitoring_enabled,
    control.guardduty_enabled,
    control.kms_cmk_rotation_enabled,
    control.log_metric_filter_bucket_policy,
    control.log_metric_filter_cloudtrail_configuration,
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_network_acl,
    control.log_metric_filter_network_gateway,
    control.log_metric_filter_root_login,
    control.log_metric_filter_route_table,
    control.log_metric_filter_security_group,
    control.log_metric_filter_unauthorized_api,
    control.log_metric_filter_vpc,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_08" {
  title       = "ID.RA-08"
  description = "Processes for receiving, analyzing, and responding to vulnerability disclosures are established."
  children = [
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_ra_09" {
  title       = "ID.RA-09"
  description = "The authenticity and integrity of hardware and software are assessed prior to acquisition and use."
  children = [
    control.cloudtrail_trail_validation_enabled,
    control.ec2_ami_ebs_encryption_enabled,
    control.ec2_instance_no_high_level_finding_in_inspector_scan,
    control.ecr_repository_image_scan_on_push_enabled
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_im_01" {
  title       = "ID.IM-01"
  description = "Improvements are identified from evaluations."
  children = [
    control.ec2_instance_no_high_level_finding_in_inspector_scan,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_id_im_02" {
  title       = "ID.IM-02"
  description = "Improvements are identified from security tests and exercises, including those done in coordination with suppliers and relevant third parties."
  children = [
    control.ec2_instance_no_high_level_finding_in_inspector_scan,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
  tags = local.nist_csf_v2_common_tags
}
