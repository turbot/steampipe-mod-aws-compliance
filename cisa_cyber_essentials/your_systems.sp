locals {
  cisa_cyber_essentials_your_systems_common_tags = merge(local.cisa_cyber_essentials_common_tags, {
    section = "your_systems"
  })
}

benchmark "cisa_cyber_essentials_your_systems" {
  title       = "Your Systems"
  description = "to do"
  children = [
    benchmark.cisa_cyber_essentials_your_systems_1,
    benchmark.cisa_cyber_essentials_your_systems_2,
    benchmark.cisa_cyber_essentials_your_systems_3
  ]

  tags = local.cisa_cyber_essentials_your_systems_common_tags
}

benchmark "cisa_cyber_essentials_your_systems_1" {
  title       = "Your Systems-1"
  description = "Learn what is on your network. Maintain inventories of hardware and software assets to know what is in play and at-risk from attack."
  children = [
    control.vpc_eip_associated,
    control.vpc_network_acl_unused,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.ec2_stopped_instance_30_days,
    control.ebs_attached_volume_delete_on_termination_enabled,
  ]

  tags = merge(local.cisa_cyber_essentials_your_systems_common_tags, {
    item = "your_systems_1"
  })
}

benchmark "cisa_cyber_essentials_your_systems_2" {
  title       = "Your Systems-2"
  description = "Leverage automatic updates for all operating systems and third-party software."
  children = [
    control.ssm_managed_instance_compliance_patch_compliant,
  ]

  tags = merge(local.cisa_cyber_essentials_your_systems_common_tags, {
    item = "your_systems_2"
  })
}

benchmark "cisa_cyber_essentials_your_systems_3" {
  title       = "Your Systems-3"
  description = "Implement security configurations for all hardware and software assets."
  children = [
    control.iam_user_access_key_age_90,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_lb_waf_enabled,
    control.cloudtrail_trail_validation_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.s3_public_access_block_account,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_s3_data_events_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_backup_enabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.dynamodb_table_encrypted_with_kms_cmk,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_ebs_default_encryption_enabled,
    control.ec2_instance_not_publicly_accessible,
    control.efs_file_system_encrypt_data_at_rest,
    control.efs_file_system_in_backup_plan,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_in_vpc,
    control.es_domain_node_to_node_encryption_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_master_nodes_no_public_ip,
    control.ebs_volume_encryption_at_rest_enabled,
    control.guardduty_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_account_password_policy_min_length_14,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_mfa_enabled,
    control.iam_group_user_role_no_inline_policies,
    control.iam_user_unused_credentials_90,
    control.ec2_instance_in_vpc,
    control.kms_key_not_pending_deletion,
    control.lambda_function_restrict_public_access,
    control.lambda_function_in_vpc,
    control.iam_user_console_access_mfa_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_instance_logging_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.rds_db_snapshot_prohibit_public_access,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.s3_public_access_block_bucket_account,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_versioning_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.securityhub_enabled,
    control.sns_topic_encrypted_at_rest,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.fsx_file_system_protected_by_backup_plan,
    control.ec2_instance_protected_by_backup_plan,
    control.dynamodb_table_protected_by_backup_plan,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_encryption_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.cisa_cyber_essentials_your_systems_common_tags, {
    item = "your_systems_3"
  })
}