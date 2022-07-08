benchmark "nist_800_171_rev_2_3_13" {
  title       = "3.13 System and Communications Protection"
  description = "The SC control family is responsible for systems and communications protection procedures. This includes boundary protection, protection of information at rest, collaborative computing devices, cryptographic protection, denial of service protection, and many others."
  children = [
    benchmark.nist_800_171_rev_2_3_13_1,
    benchmark.nist_800_171_rev_2_3_13_2,
    benchmark.nist_800_171_rev_2_3_13_3,
    benchmark.nist_800_171_rev_2_3_13_4,
    benchmark.nist_800_171_rev_2_3_13_5,
    benchmark.nist_800_171_rev_2_3_13_6,
    benchmark.nist_800_171_rev_2_3_13_8,
    benchmark.nist_800_171_rev_2_3_13_11,
    benchmark.nist_800_171_rev_2_3_13_15,
    benchmark.nist_800_171_rev_2_3_13_16
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_1" {
  title       = "3.13.1"
  description = "Monitor, control, and protect communications (i.e., information transmitted or received by organizational systems) at the external boundaries and key internal boundaries of organizational systems."
  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_validation_enabled,
    control.ec2_instance_in_vpc,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_lb_waf_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_in_vpc,
    control.guardduty_enabled,
    control.lambda_function_in_vpc,
    control.rds_db_instance_logging_enabled,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.wafv2_web_acl_logging_enabled,
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_2" {
  title       = "3.13.2"
  description = "Employ architectural designs, software development techniques, and systems engineering principles that promote effective information security within organizational systems."
  children = [
    control.acm_certificate_expires_30_days,
    control.autoscaling_group_with_lb_use_health_check,
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.cloudtrail_security_trail_enabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_snapshot_not_publicly_restorable,
    control.ebs_volume_in_backup_plan,
    control.ebs_volume_protected_by_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_protected_by_backup_plan,
    control.efs_file_system_protected_by_backup_plan,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.fsx_file_system_protected_by_backup_plan,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_cluster_deletion_protection_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_logging_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_3" {
  title       = "3.13.3"
  description = "Separate user functionality from system management functionalit."
  children = [
    control.iam_policy_no_star_star,
    control.iam_user_in_group
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_4" {
  title       = "3.13.4"
  description = "Prevent unauthorized and unintended information transfer via shared system resources."
  children = [
    control.ebs_volume_unused,
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_5" {
  title       = "3.13.5"
  description = "Implement subnetworks for publicly accessible system components that are physically or logically separated from internal networks."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.elb_application_lb_drop_http_headers,
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
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_6" {
  title       = "3.13.6"
  description = "Deny network communications traffic by default and allow network communications traffic by exception (i.e., deny all, permit by exception)."
  children = [
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
    ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_8" {
  title       = "3.13.8"
  description = "Implement cryptographic mechanisms to prevent unauthorized disclosure of CUI during transmission unless otherwise protected by alternative physical safeguards."
  children = [
    control.acm_certificate_expires_30_days,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
    ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_11" {
  title       = "3.13.11"
  description = "Employ FIPS-validated cryptography when used to protect the confidentiality of CUI."
  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_encryption_enabled,
    control.ebs_volume_encryption_at_rest_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_drop_http_headers,
    control.es_domain_encryption_at_rest_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest
    ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_15" {
  title       = "3.13.15"
  description = "Protect the authenticity of communications sessions."
  children = [
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners
    ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_13_16" {
  title       = "3.13.16"
  description = "Protect the confidentiality of CUI at rest."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_encrypted_with_kms_cmk,
    control.dynamodb_table_encryption_enabled,
    control.ebs_volume_encryption_at_rest_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.es_domain_encryption_at_rest_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest
    ]

  tags = local.nist_800_171_rev_2_common_tags
}