benchmark "rbi_nbfc_cyber_2026_iii" {
  title       = "Chapter III - Requirements for NBFCs (Base Layer with asset size below ₹500 crore) and Core Investment Companies"
  description = "Baseline cybersecurity and resilience requirements for NBFCs-Base Layer with asset size below ₹500 crore and Core Investment Companies."

  children = [
    benchmark.rbi_nbfc_cyber_2026_iii_8_1,
    benchmark.rbi_nbfc_cyber_2026_iii_8_2,
    benchmark.rbi_nbfc_cyber_2026_iii_8_3,
    benchmark.rbi_nbfc_cyber_2026_iii_8_9,
    benchmark.rbi_nbfc_cyber_2026_iii_9
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "III"
  })
}

benchmark "rbi_nbfc_cyber_2026_iii_8_1" {
  title       = "8(1) Basic Security Aspects"
  description = "Basic security aspects such as physical / logical access controls and well-defined password policy."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.ssm_document_prohibit_public_access,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "8(1)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iii_8_2" {
  title       = "8(2) User Role"
  description = "Well-defined user role."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "8(2)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iii_8_3" {
  title       = "8(3) Maker-Checker Concept"
  description = "Maker-checker concept to reduce the risk of error and misuse, and to ensure reliability of data / information."

  children = [
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "8(3)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iii_8_9" {
  title       = "8(9) Backup of Data"
  description = "Arrangement for backup of data with periodic testing."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "8(9)"
  })
}

benchmark "rbi_nbfc_cyber_2026_iii_9" {
  title       = "9. Scaling up of IT Systems"
  description = "The NBFC shall progressively scale up its IT systems as the size and complexity of its operations increases."

  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.elb_application_gateway_network_lb_multiple_az_configured,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_classic_lb_multiple_az_configured,
    control.guardduty_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_multiple_az_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.securityhub_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = merge(local.rbi_nbfc_cyber_2026_common_tags, {
    rbi_nbfc_cyber_2026_item_id = "9"
  })
}
