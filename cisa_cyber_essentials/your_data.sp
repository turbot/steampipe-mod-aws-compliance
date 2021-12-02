locals {
  cisa_cyber_essentials_your_data_common_tags = merge(local.cisa_cyber_essentials_common_tags, {
    section = "your_surroundings"
  })
}

benchmark "cisa_cyber_essentials_your_data" {
  title       = "Your Data"
  description = "to do"
  children = [
    benchmark.cisa_cyber_essentials_your_data_1,
    benchmark.cisa_cyber_essentials_your_data_2,
    benchmark.cisa_cyber_essentials_your_data_3,
    benchmark.cisa_cyber_essentials_your_data_4,
    benchmark.cisa_cyber_essentials_your_data_5,
  ]

  tags = local.cisa_cyber_essentials_your_data_common_tags
}

benchmark "cisa_cyber_essentials_your_data_1" {
  title       = "Your Data-1"
  description = "Learn how your data is protected."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.log_group_encryption_at_rest_enabled,
    control.dynamodb_table_encrypted_with_kms_cmk,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.es_domain_encryption_at_rest_enabled,
    control.ebs_volume_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
    control.backup_recovery_point_encryption_enabled,
  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_data_1"
  })
}

benchmark "cisa_cyber_essentials_your_data_2" {
  title       = "Your Data-2"
  description = "Learn what is happening on your network. manage network and perimeter components, host and device components, data-at-rest and in-transit, and user behavior activities."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.acm_certificate_expires_30_days,
    control.elb_application_lb_redirect_http_request_to_https,
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.log_group_encryption_at_rest_enabled,
    control.dynamodb_table_encrypted_with_kms_cmk,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.es_domain_encryption_at_rest_enabled,
    control.ebs_volume_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
    control.backup_recovery_point_encryption_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.elb_application_lb_waf_enabled,
    control.s3_bucket_enforces_ssl,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.es_domain_in_vpc,
    control.emr_cluster_master_nodes_no_public_ip,
    control.ec2_instance_in_vpc,
    control.lambda_function_restrict_public_access,
    control.lambda_function_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket_account,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_restrict_public_read_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_data_2"
  })
}

benchmark "cisa_cyber_essentials_your_data_3" {
  title       = "Your Data-3"
  description = "Domain name system protection."
  children = [
    control.elb_application_lb_waf_enabled
  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_data_3"
  })
}

benchmark "cisa_cyber_essentials_your_data_4" {
  title       = "Your Data-4"
  description = "Establish regular automated backups and redundancies of key systems."
  children = [
    control.rds_db_instance_backup_enabled,
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.rds_db_cluster_aurora_protected_by_backup_plan,
    control.backup_plan_min_retention_35_days,
    control.ec2_instance_protected_by_backup_plan,
    control.fsx_file_system_protected_by_backup_plan,

  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_data_4"
  })
}

benchmark "cisa_cyber_essentials_your_data_5" {
  title       = "Your Data-5"
  description = "Leverage protections for backups, including physical security, encryption and offline copies."
  children = [
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_data_5"
  })
}
