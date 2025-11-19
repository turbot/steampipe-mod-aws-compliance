benchmark "nist_csf_pr" {
  title       = "Protect (PR)"
  description = "Develop and implement appropriate safeguards to ensure delivery of critical services."

  children = [
    benchmark.nist_csf_pr_ac,
    benchmark.nist_csf_pr_ds,
    benchmark.nist_csf_pr_ip,
    benchmark.nist_csf_pr_ma,
    benchmark.nist_csf_pr_pt
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ac" {
  title       = "Identity Management and Access Control (PR.AC)"
  description = "Access to physical and logical assets and associated facilities is limited to authorized users, processes, and devices, and is managed consistent with the assessed risk of unauthorized access to authorized activities and transactions."

  children = [
    benchmark.nist_csf_pr_ac_1,
    benchmark.nist_csf_pr_ac_3,
    benchmark.nist_csf_pr_ac_4,
    benchmark.nist_csf_pr_ac_5,
    benchmark.nist_csf_pr_ac_6,
    benchmark.nist_csf_pr_ac_7
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ac_1" {
  title       = "PR.AC-1"
  description = "Identities and credentials are issued, managed, verified, revoked, and audited for authorized devices, users and processes."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_no_amazon_key_pair,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_user_for_host_mode_check,
    control.emr_cluster_kerberos_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.opensearch_domain_fine_grained_access_enabled,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ac_3" {
  title       = "PR.AC-3"
  description = "Remote access is managed."

  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.autoscaling_launch_config_public_ip_disabled,
    control.cloudfront_distribution_waf_enabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.networkfirewall_firewall_policy_default_stateless_action_check_full_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_web_acl_rule_attached
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ac_4" {
  title       = "PR.AC-4"
  description = "Access permissions and authorizations are managed, incorporating the principles of least privilege and separation of duties."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_uses_imdsv2,
    control.ecs_task_definition_container_non_privileged,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.ecs_task_definition_user_for_host_mode_check,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_custom_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.opensearch_domain_fine_grained_access_enabled,
    control.opensearch_domain_in_vpc,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ac_5" {
  title       = "PR.AC-5"
  description = "Network integrity is protected (e.g., network segregation, network segmentation)."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_use_waf_web_acl,
    control.autoscaling_launch_config_public_ip_disabled,
    control.cloudfront_distribution_default_root_object_configured,
    control.cloudfront_distribution_waf_enabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.networkfirewall_firewall_policy_default_stateless_action_check_full_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_web_acl_rule_attached
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ac_6" {
  title       = "PR.AC-6"
  description = "Identities are proofed and bound to credentials and asserted in interactions."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.emr_cluster_kerberos_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ac_7" {
  title       = "PR.AC-7"
  description = "Users, devices, and other assets are authenticated (e.g., single-factor, multi-factor) commensurate with the risk of the transaction (e.g., individuals' security and privacy risks and other organizational risks)."

  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = merge(local.nist_csf_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_csf_pr_ds" {
  title       = "Data Security (PR.DS)"
  description = "Information and records (data) are managed consistent with the organization's risk strategy to protect the confidentiality, integrity, and availability of information."

  children = [
    benchmark.nist_csf_pr_ds_1,
    benchmark.nist_csf_pr_ds_2,
    benchmark.nist_csf_pr_ds_3,
    benchmark.nist_csf_pr_ds_4,
    benchmark.nist_csf_pr_ds_5,
    benchmark.nist_csf_pr_ds_6,
    benchmark.nist_csf_pr_ds_7,
    benchmark.nist_csf_pr_ds_8
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ds_1" {
  title       = "PR.DS-1"
  description = "Data-at-rest is protected."

  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.codebuild_project_artifact_encryption_enabled,
    control.codebuild_project_s3_logs_encryption_enabled,
    control.dax_cluster_encryption_at_rest_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_encryption_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.eks_cluster_secrets_encrypted,
    control.es_domain_encryption_at_rest_enabled,
    control.kinesis_stream_server_side_encryption_enabled,
    control.kms_key_not_pending_deletion,
    control.log_group_encryption_at_rest_enabled,
    control.opensearch_domain_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_object_lock_enabled,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ds_2" {
  title       = "PR.DS-2"
  description = "Data-in-transit is protected."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.opensearch_domain_https_required,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ds_3" {
  title       = "PR.DS-3"
  description = "Assets are formally managed throughout removal, transfers, and disposition."

  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_eip_associated
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ds_4" {
  title       = "PR.DS-4"
  description = "Adequate capacity to ensure availability is maintained."

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
    control.rds_db_cluster_deletion_protection_enabled,
    control.rds_db_cluster_multiple_az_enabled,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_maintenance_settings_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ds_5" {
  title       = "PR.DS-5"
  description = "Protections against data leaks are implemented."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.codebuild_project_logging_enabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ecs_task_definition_container_environment_no_secret,
    control.eks_cluster_endpoint_restrict_public_access,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_in_vpc,
    control.guardduty_enabled,
    control.lambda_function_restrict_public_access,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_event_notifications_enabled,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.securityhub_enabled,
    control.ssm_document_prohibit_public_access,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_flow_logs_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ds_6" {
  title       = "PR.DS-6"
  description = "Integrity checking mechanisms are used to verify software, firmware, and information integrity."

  children = [
    control.cloudtrail_trail_validation_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.nist_csf_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_csf_pr_ds_7" {
  title       = "PR.DS-7"
  description = "The development and testing environment(s) are separate from the production environment."

  children = [
    control.cloudtrail_security_trail_enabled,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ds_8" {
  title       = "PR.DS-8"
  description = "Integrity checking mechanisms are used to verify hardware integrity."

  children = [
    control.ec2_instance_ssm_managed,
    control.securityhub_enabled
  ]

  tags = local.nist_csf_common_tags
}


benchmark "nist_csf_pr_ip" {
  title       = "Information Protection Processes and Procedures (PR.IP)"
  description = "Security policies (that address purpose, scope, roles, responsibilities, management commitment, and coordination among organizational entities), processes, and procedures are maintained and used to manage protection of information systems and assets."

  children = [
    benchmark.nist_csf_pr_ip_1,
    benchmark.nist_csf_pr_ip_2,
    benchmark.nist_csf_pr_ip_3,
    benchmark.nist_csf_pr_ip_4,
    benchmark.nist_csf_pr_ip_7,
    benchmark.nist_csf_pr_ip_8,
    benchmark.nist_csf_pr_ip_9,
    benchmark.nist_csf_pr_ip_12
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ip_1" {
  title       = "PR.IP-1"
  description = "A baseline configuration of information technology/industrial control systems is created and maintained incorporating security principles (e.g. concept of least functionality)."

  children = [
    control.account_part_of_organizations,
    control.autoscaling_launch_config_hop_limit,
    control.autoscaling_launch_config_requires_imdsv2,
    control.cloudformation_stack_drift_detection_check,
    control.cloudfront_distribution_origin_access_identity_enabled,
    control.cloudtrail_security_trail_enabled,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_instance_virtualization_type_no_paravirtual,
    control.ec2_stopped_instance_30_days,
    control.ecr_repository_lifecycle_policy_configured,
    control.ecr_repository_tag_immutability_enabled,
    control.ecs_service_fargate_using_latest_platform_version,
    control.ecs_task_definition_container_environment_no_secret,
    control.ecs_task_definition_no_host_pid_mode,
    control.eks_cluster_with_latest_kubernetes_version,
    control.elb_application_lb_desync_mitigation_mode,
    control.lambda_function_use_latest_runtime,
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_default_stateless_action_check_full_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.rds_db_cluster_no_default_admin_name,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.rds_db_instance_no_default_admin_name,
    control.redshift_cluster_maintenance_settings_check,
    control.redshift_cluster_no_default_admin_name,
    control.redshift_cluster_no_default_database_name,
    control.s3_bucket_policy_restricts_cross_account_permission_changes,
    control.ssm_managed_instance_compliance_association_compliant,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_resource_associated
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ip_2" {
  title       = "PR.IP-2"
  description = "A System Development Life Cycle to manage systems is implemented."

  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
    control.ec2_instance_ssm_managed
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ip_3" {
  title       = "PR.IP-3"
  description = "Configuration change control processes are in place."

  children = [
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_cluster_deletion_protection_enabled,
    control.rds_db_instance_deletion_protection_enabled
  ]

  tags = merge(local.nist_csf_common_tags, {
    service = "AWS/ELB"
  })
}

benchmark "nist_csf_pr_ip_4" {
  title       = "PR.IP-4"
  description = "Backups of information are conducted, maintained, and tested periodically."

  children = [
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_cluster_aurora_backtracking_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_maintenance_settings_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ip_7" {
  title       = "PR.IP-7"
  description = "Protection processes are improved."

  children = [
    control.ec2_instance_ebs_optimized
  ]

  tags = merge(local.nist_csf_common_tags, {
    service = "AWS/EC2"
  })
}

benchmark "nist_csf_pr_ip_8" {
  title       = "PR.IP-8"
  description = "Effectiveness of protection technologies is shared."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_master_nodes_no_public_ip,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ip_9" {
  title       = "PR.IP-9"
  description = "Response plans (Incident Response and Business Continuity) and recovery plans (Incident Recovery and Disaster Recovery) are in place and managed."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.dynamodb_table_auto_scaling_enabled,
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
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.fsx_file_system_protected_by_backup_plan,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ip_12" {
  title       = "PR.IP-12"
  description = "A vulnerability management plan is developed and implemented."

  children = [
    control.config_enabled_all_regions,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ma" {
  title       = "Maintenance (PR.MA)"
  description = "Maintenance and repairs of industrial control and information system components are performed consistent with policies and procedures."

  children = [
    benchmark.nist_csf_pr_ma_2
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_ma_2" {
  title       = "PR.MA-2"
  description = "Remote maintenance of organizational assets is approved, logged, and performed in a manner that prevents unauthorized access."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.redshift_cluster_audit_logging_enabled
  ]

  tags = merge(local.nist_csf_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_csf_pr_pt" {
  title       = "Protective Technology (PR.PT)"
  description = "Maintenance and repairs of industrial control and information system components are performed consistent with policies and procedures."

  children = [
    benchmark.nist_csf_pr_pt_1,
    benchmark.nist_csf_pr_pt_3,
    benchmark.nist_csf_pr_pt_4,
    benchmark.nist_csf_pr_pt_5
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_pt_1" {
  title       = "PR.PT-1"
  description = "Audit/log records are determined, documented, implemented, and reviewed in accordance with policy."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.codebuild_project_logging_enabled,
    control.ecs_cluster_container_insights_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_event_notifications_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_pt_3" {
  title       = "PR.PT-3"
  description = "The principle of least functionality is incorporated by configuring systems to provide only essential capabilities."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.codebuild_project_environment_privileged_mode_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.ecs_task_definition_user_for_host_mode_check,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.opensearch_domain_fine_grained_access_enabled,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_acls_should_prohibit_user_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_pt_4" {
  title       = "PR.PT-4"
  description = "Communications and control networks are protected."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_use_waf_web_acl,
    control.autoscaling_launch_config_public_ip_disabled,
    control.cloudfront_distribution_default_root_object_configured,
    control.cloudfront_distribution_waf_enabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.networkfirewall_firewall_policy_default_stateless_action_check_full_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_web_acl_rule_attached
  ]

  tags = local.nist_csf_common_tags
}

benchmark "nist_csf_pr_pt_5" {
  title       = "PR.PT-5"
  description = "Mechanisms (e.g., failsafe, load balancing, hot swap) are implemented to achieve resilience requirements in normal and adverse situations."

  children = [
    control.autoscaling_group_multiple_az_configured,
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_gateway_network_lb_multiple_az_configured,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_classic_lb_multiple_az_configured,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_multiple_az_configured,
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
