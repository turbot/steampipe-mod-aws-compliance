benchmark "nist_csf_id" {
  title       = "Identify (ID)"
  description = "Develop the organizational understanding to manage cybersecurity risk to systems, assets, data, and capabilities."
  children = [
    benchmark.nist_csf_id_am,
    benchmark.nist_csf_id_be,
    benchmark.nist_csf_id_ra,
    benchmark.nist_csf_id_sc
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_am" {
  title       = "Asset Management (ID.AM)"
  description = "The data, personnel, devices, systems, and facilities that enable the organization to achieve business purposes are identified and managed consistent with their relative importance to organizational objectives and the organization's risk strategy."
  children = [
    benchmark.nist_csf_id_am_1,
    benchmark.nist_csf_id_am_2,
    benchmark.nist_csf_id_am_3,
    benchmark.nist_csf_id_am_5,
    benchmark.nist_csf_id_am_6
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_am_1" {
  title       = "ID.AM-1"
  description = "Physical devices and systems within the organization are inventoried."

  children = [
    control.config_enabled_all_regions,
    control.ec2_instance_ssm_managed
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_am_2" {
  title       = "ID.AM-2"
  description = "Software platforms and applications within the organization are inventoried."

  children = [
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_eip_associated,
    control.vpc_network_acl_unused
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_am_3" {
  title       = "ID.AM-3"
  description = "Organizational communication and data flows are mapped."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_am_5" {
  title       = "ID.AM-5"
  description = "Resources (e.g., hardware, devices, data, time, personnel, and software) are prioritized based on their classification, criticality, and business value."

  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_am_6" {
  title       = "ID.AM-6"
  description = "Cybersecurity roles and responsibilities for the entire workforce and third-party stakeholders (e.g., suppliers, customers, partners) are established."

  children = [
    control.iam_user_in_group
  ]

  tags = merge(local.nist_csf_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_csf_id_be" {
  title       = "Business Environment (ID.BE)"
  description = "The organization's mission, objectives, stakeholders, and activities are understood and prioritized; this information is used to inform cybersecurity roles, responsibilities, and risk management decisions."
  children = [
    benchmark.nist_csf_id_be_5
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_be_5" {
  title       = "ID.BE-5"
  description = "Resilience requirements to support delivery of critical services are established for all operating states (e.g. under duress/attack, during recovery, normal operations)"

  children = [
    control.autoscaling_group_multiple_az_configured,
    control.autoscaling_group_with_lb_use_health_check,
    control.autoscaling_use_multiple_instance_types_in_multiple_az,
    control.cloudfront_distribution_configured_with_origin_failover,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_gateway_network_lb_multiple_az_configured,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_classic_lb_multiple_az_configured,
    control.lambda_function_multiple_az_configured,
    control.rds_db_cluster_aurora_backtracking_enabled,
    control.rds_db_cluster_deletion_protection_enabled,
    control.rds_db_cluster_multiple_az_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_ra" {
  title       = "Risk Assessment (ID.RA)"
  description = "The organization understands the cybersecurity risk to organizational operations (including mission, functions, image, or reputation), organizational assets, and individuals."

  children = [
    benchmark.nist_csf_id_ra_1,
    benchmark.nist_csf_id_ra_2,
    benchmark.nist_csf_id_ra_3,
    benchmark.nist_csf_id_ra_5
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_ra_1" {
  title       = "ID.RA-1"
  description = "Asset vulnerabilities are identified and documented."

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
    control.ecr_repository_image_scan_on_push_enabled,
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
    control.ssm_managed_instance_compliance_patch_compliant,
    control.vpc_flow_logs_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_ra_2" {
  title       = "ID.RA-2"
  description = "Cyber threat intelligence is received from information sharing forums and sources."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_ra_3" {
  title       = "ID.RA-3"
  description = "Threats, both internal and external, are identified and documented."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_ra_5" {
  title       = "ID.RA-5"
  description = "Threats, vulnerabilities, likelihoods, and impacts are used to determine risk."

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

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_sc" {
  title       = "Supply Chain Risk Management (ID.SC)"
  description = "The organization's priorities, constraints, risk tolerances, and assumptions are established and used to support risk decisions associated with managing supply chain risk. The organization has established and implemented the processes to identify, assess and manage supply chain risks."

  children = [
    benchmark.nist_csf_id_sc_4
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_id_sc_4" {
  title       = "ID.SC-4"
  description = "Suppliers and third-party partners are routinely assessed using audits, test results, or other forms of evaluations to confirm they are meeting their contractual obligations."

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

  tags = local.nist_csf_common_tags
}