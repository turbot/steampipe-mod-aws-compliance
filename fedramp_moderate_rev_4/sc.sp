benchmark "fedramp_moderate_rev_4_sc" {
  title       = benchmark.nist_800_53_rev_4_sc.title
  description = benchmark.nist_800_53_rev_4_sc.description
  children = [
    benchmark.fedramp_moderate_rev_4_sc_2,
    benchmark.fedramp_moderate_rev_4_sc_4,
    benchmark.fedramp_moderate_rev_4_sc_5,
    benchmark.fedramp_moderate_rev_4_sc_7,
    benchmark.fedramp_moderate_rev_4_sc_8,
    benchmark.fedramp_moderate_rev_4_sc_12,
    benchmark.fedramp_moderate_rev_4_sc_13,
    benchmark.fedramp_moderate_rev_4_sc_23,
    benchmark.fedramp_moderate_rev_4_sc_28
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}


benchmark "fedramp_moderate_rev_4_sc_2" {
  title       = benchmark.nist_800_53_rev_4_sc_2.title
  description = benchmark.nist_800_53_rev_4_sc_2.description
  children = [
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
  ]

  tags = merge(local.fedramp_moderate_rev_4_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "fedramp_moderate_rev_4_sc_4" {
  title       = benchmark.nist_800_53_rev_4_sc_4.title
  description = benchmark.nist_800_53_rev_4_sc_4.description
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ebs_volume_unused,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_5" {
  title       = benchmark.nist_800_53_rev_4_sc_5.title
  description = benchmark.nist_800_53_rev_4_sc_5.description
  children = [
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ec2_instance_ebs_optimized,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_7" {
  title       = benchmark.nist_800_53_rev_4_sc_7.title
  description = benchmark.nist_800_53_rev_4_sc_7.description
  children = [
    benchmark.fedramp_moderate_rev_4_sc_7_3,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_lb_waf_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.es_domain_node_to_node_encryption_enabled,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_7_3" {
  title       = benchmark.nist_800_53_rev_4_sc_7_3.title
  description = benchmark.nist_800_53_rev_4_sc_7_3.description
  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_8" {
  title       = "Transmission Integrity (SC-8)"
  description = "The information system protects the confidentiality AND integrity of transmitted information."
  children = [
    benchmark.fedramp_moderate_rev_4_sc_8_1,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_8_1" {
  title       = benchmark.nist_800_53_rev_4_sc_8_1.title
  description = benchmark.nist_800_53_rev_4_sc_8_1.description
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_12" {
  title       = benchmark.nist_800_53_rev_4_sc_12.title
  description = benchmark.nist_800_53_rev_4_sc_12.description
  children = [
    control.acm_certificate_expires_30_days,
    control.kms_cmk_rotation_enabled,
    control.kms_key_not_pending_deletion,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_13" {
  title       = "Use of Cryptography (SC-13)"
  description = "The information system implements FIPS-validated or NSA-approved cryptography in accordance with applicable federal laws, Executive Orders, directives, policies, regulations, and standards."
  children = [
    control.kms_key_not_pending_deletion,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_23" {
  title       = benchmark.nist_800_53_rev_4_sc_23.title
  description = benchmark.nist_800_53_rev_4_sc_23.description
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_sc_28" {
  title       = "Protection of Information at Rest (SC-28)"
  description = "The information system protects the confidentiality AND integrity of [Assignment: organization-defined information at rest]."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_volume_encryption_at_rest_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.es_domain_encryption_at_rest_enabled,
    control.kms_key_not_pending_deletion,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_object_lock_enabled,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}