benchmark "nydfs_23_500_02" {
  title       = "500.02"
  description = "Malicious software, commonly referred to as “malware”—including viruses, worms, and Trojans—enters the network during many businessapproved activities including employee e-mail and use of the Internet, mobile computers, and storage devices, resulting in the exploitation of system vulnerabilities. Anti-virus software must be used on all systems commonly affected by malware to protect systems from current and evolving malicious software threats"

  children = [
    benchmark.nydfs_23_500_02_a,
    benchmark.nydfs_23_500_02_b_2,
    benchmark.nydfs_23_500_02_b_3
  ]

  tags = local.nydfs_23_common_tags
}


benchmark "nydfs_23_500_02_a" {
  title       = "500.02(a)"
  description = "Cybersecurity Program. Each Covered Entity shall maintain a cybersecurity program designed to protect the confidentiality, integrity and availability of the Covered Entity’s Information Systems."

  children = [
    control.acm_certificate_expires_30_days,
    control.elb_application_lb_redirect_http_request_to_https,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.log_group_encryption_at_rest_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.es_domain_encryption_at_rest_enabled,
    control.elb_application_network_lb_use_ssl_certificate,
    control.ebs_attached_volume_encryption_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
    control.ebs_encryption_by_default_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.elb_application_lb_drop_http_headers,
    control.kinesis_stream_server_side_encryption_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.elb_classic_lb_use_tls_https_listeners,
    control.cloudtrail_trail_validation_enabled,
    control.dynamodb_table_auto_scaling_enabled,
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_object_lock_enabled,
    control.vpc_vpn_tunnel_up,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.autoscaling_group_with_lb_use_health_check,
    control.autoscaling_launch_config_public_ip_disabled,
    control.backup_recovery_point_encryption_enabled,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.ec2_instance_detailed_monitoring_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.s3_public_access_block_account,
    control.s3_bucket_default_encryption_enabled_kms,
    control.ssm_document_prohibit_public_access,
    control.opensearch_domain_encryption_at_rest_enabled,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.codebuild_project_artifact_encryption_enabled
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "nydfs_23_500_02_b_2" {
  title       = "500.02(b)(2)"
  description = "The cybersecurity program shall be based on the Covered Entity’s Risk Assessment and designed to perform the following core cybersecurity functions: use defensive infrastructure and the implementation of policies and procedures to protect the Covered Entity’s Information Systems, and the Nonpublic Information stored on those Information Systems, from unauthorized access, use or other malicious acts."

  children = [
    control.emr_cluster_kerberos_enabled,
    control.iam_group_not_empty,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_policies,
    control.iam_user_console_access_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.opensearch_domain_in_vpc,
    control.ssm_document_prohibit_public_access,
    control.s3_public_access_block_account,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.apigateway_stage_use_waf_web_acl,
    control.elb_application_lb_waf_enabled,
    control.vpc_security_group_allows_ingress_authorized_ports,
    control.vpc_default_security_group_restricts_all_traffic,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_restrict_public_read_access,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.redshift_cluster_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.vpc_igw_attached_to_authorized_vpc,
    control.ec2_instance_in_vpc,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.dms_replication_instance_not_publicly_accessible,
    control.iam_user_no_inline_attached_policies,
    control.ec2_instance_uses_imdsv2,
    control.s3_bucket_policy_restrict_public_access
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "nydfs_23_500_02_b_3" {
  title       = "500.02(b)(3)"
  description = "The cybersecurity program shall be based on the Covered Entity’s Risk Assessment and designed to perform the following core cybersecurity functions: detect Cybersecurity Events."

  children = [
    control.opensearch_domain_logs_to_cloudwatch,
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.redshift_cluster_audit_logging_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.es_domain_logs_to_cloudwatch,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.s3_bucket_logging_enabled,
    control.opensearch_domain_audit_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.codebuild_project_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.wafv2_web_acl_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "nydfs_23_500_02_b_5" {
  title       = "500.02(b)(5)"
  description = "The cybersecurity program shall be based on the Covered Entity’s Risk Assessment and designed to perform the following core cybersecurity functions: detect Cybersecurity Events."

  children = [
    control.rds_db_instance_backup_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ec2_instance_ebs_optimized,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.rds_db_instance_in_backup_plan,
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_manual_deletion_disabled
  ]

  tags = local.nydfs_23_common_tags
}