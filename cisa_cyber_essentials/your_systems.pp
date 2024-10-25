benchmark "cisa_cyber_essentials_your_systems" {
  title       = "Your Systems"
  description = "As the infrastructure that makes your organization operational, your systems are an essential element of your organization's Culture of Cyber Readiness. Your task for this element is to protect critical assets and applications."
  children = [
    benchmark.cisa_cyber_essentials_your_systems_1,
    benchmark.cisa_cyber_essentials_your_systems_2,
    benchmark.cisa_cyber_essentials_your_systems_3
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_your_systems_1" {
  title       = "Your Systems-1"
  description = "Learn what is on your network. Maintain inventories of hardware and software assets to know what is in play and at-risk from attack."
  children = [
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.vpc_eip_associated,
    control.vpc_network_acl_unused
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_your_systems_2" {
  title       = "Your Systems-2"
  description = "Leverage automatic updates for all operating systems and third-party software."
  children = [
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_your_systems_3" {
  title       = "Your Systems-3"
  description = "Implement security configurations for all hardware and software assets."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.apigateway_stage_logging_enabled,
    control.apigateway_stage_use_waf_web_acl,
    control.autoscaling_launch_config_public_ip_disabled,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.dms_replication_instance_not_publicly_accessible,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_protected_by_backup_plan,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_snapshot_not_publicly_restorable,
    control.ebs_volume_in_backup_plan,
    control.ebs_encryption_by_default_enabled,
    control.ec2_instance_ebs_optimized,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_protected_by_backup_plan,
    control.ecs_task_definition_user_for_host_mode_check,
    control.efs_file_system_encrypted_with_cmk,
    control.efs_file_system_protected_by_backup_plan,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_lb_waf_enabled,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_in_vpc,
    control.es_domain_logs_to_cloudwatch,
    control.es_domain_node_to_node_encryption_enabled,
    control.fsx_file_system_protected_by_backup_plan,
    control.guardduty_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.kms_cmk_rotation_enabled,
    control.kms_key_not_pending_deletion,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_logging_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_encrypted_at_rest,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_versioning_enabled,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_last_changed_90_day,
    control.secretsmanager_secret_unused_90_day,
    control.securityhub_enabled,
    control.sns_topic_encrypted_at_rest,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.cisa_cyber_essentials_common_tags
}


