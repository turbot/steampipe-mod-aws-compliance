benchmark "fedramp_low_rev_4_sc" {
  title       = benchmark.nist_800_53_rev_4_sc.title
  description = benchmark.nist_800_53_rev_4_sc.description
  children = [
    benchmark.fedramp_low_rev_4_sc_5,
    benchmark.fedramp_low_rev_4_sc_7,
    benchmark.fedramp_low_rev_4_sc_12,
    benchmark.fedramp_low_rev_4_sc_13
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_sc_5" {
  title       = benchmark.nist_800_53_rev_4_sc_5.title
  description = benchmark.nist_800_53_rev_4_sc_5.description
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ec2_instance_ebs_optimized,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_sc_7" {
  title       = benchmark.nist_800_53_rev_4_sc_7.title
  description = benchmark.nist_800_53_rev_4_sc_7.description
  children = [
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

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_sc_12" {
  title       = benchmark.nist_800_53_rev_4_sc_12.title
  description = benchmark.nist_800_53_rev_4_sc_12.description
  children = [
    control.acm_certificate_expires_30_days,
    control.kms_cmk_rotation_enabled,
    control.kms_key_not_pending_deletion,
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_sc_13" {
  title       = "Use of Cryptography (SC-13)"
  description = "The information system implements FIPS-validated or NSA-approved cryptography in accordance with applicable federal laws, Executive Orders, directives, policies, regulations, and standards."
  children = [
    control.kms_key_not_pending_deletion,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest
  ]

  tags = local.fedramp_low_rev_4_common_tags
}