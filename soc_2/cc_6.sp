locals {
  soc_2_cc_6_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc6"
  })
}

benchmark "soc_2_cc_6" {
  title       = "CC6 Logical and Physical Access"
  description = "The criteria relevant to how an entity (i) restricts logical and physical access, (ii) provides and removes that access, and (iii) prevents unauthorized access."

  children = [
    benchmark.soc_2_cc_6_1,
    benchmark.soc_2_cc_6_2,
    benchmark.soc_2_cc_6_3,
    benchmark.soc_2_cc_6_6,
    benchmark.soc_2_cc_6_7,
    benchmark.soc_2_cc_6_8
  ]

  tags = local.soc_2_cc_6_common_tags
}

benchmark "soc_2_cc_6_1" {
  title         = "CC6.1 The entity implements logical access security software, infrastructure, and architectures over protected information assets to protect them from security events to meet the entity's objectives"
  documentation = file("./soc_2/docs/cc_6_1.md")

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_ebs_default_encryption_enabled,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_ssm_managed,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_lb_waf_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_in_vpc,
    control.es_domain_node_to_node_encryption_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.kms_key_not_pending_deletion,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_encrypted_at_rest,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.sns_topic_encrypted_at_rest,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_eip_associated,
    control.vpc_security_group_associated_to_eni,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    service       = "AWS/S3"
    soc_2_item_id = "6.1"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_2" {
  title         = "CC6.2 Prior to issuing system credentials and granting system access, the entity registers and authorizes new internal and external users whose access is administered by the entity"
  documentation = file("./soc_2/docs/cc_6_2.md")

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_ebs_default_encryption_enabled,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_ssm_managed,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_lb_waf_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_in_vpc,
    control.es_domain_node_to_node_encryption_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.kms_key_not_pending_deletion,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_encrypted_at_rest,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_object_lock_enabled,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.sns_topic_encrypted_at_rest,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_eip_associated,
    control.vpc_security_group_associated_to_eni,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    service       = "AWS/RDS"
    soc_2_item_id = "6.2"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_3" {
  title         = "CC6.3 The entity authorizes, modifies, or removes access to data, software, functions, and other protected information assets based on roles, responsibilities, or the system design and changes, giving consideration to the concepts of least privilege and segregation of duties, to meet the entity’s objectives"
  documentation = file("./soc_2/docs/cc_6_3.md")

  children = [
    control.emr_cluster_kerberos_enabled,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_managed_policy_attached_to_role,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.s3_bucket_policy_restrict_public_access
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    service       = "AWS/IAM"
    soc_2_item_id = "6.3"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_6" {
  title         = "CC6.6 The entity implements logical access security measures to protect against threats from sources outside its system boundaries"
  documentation = file("./soc_2/docs/cc_6_6.md")

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.elb_application_lb_waf_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.guardduty_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.securityhub_enabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_flow_logs_enabled,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    service       = "AWS/EC2"
    soc_2_item_id = "6.6"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_7" {
  title         = "CC6.7 The entity restricts the transmission, movement, and removal of information to authorized internal and external users and processes, and protects it during transmission, movement, or removal to meet the entity’s objectives"
  documentation = file("./soc_2/docs/cc_6_7.md")

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    service       = "AWS/ACM"
    soc_2_item_id = "6.7"
    soc_2_type    = "automated"
  })
}

benchmark "soc_2_cc_6_8" {
  title         = "CC6.8 The entity implements controls to prevent or detect and act upon the introduction of unauthorized or malicious software to meet the entity’s objectives"
  documentation = file("./soc_2/docs/cc_6_8.md")

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = merge(local.soc_2_cc_6_common_tags, {
    soc_2_item_id = "6.8"
    soc_2_type    = "automated"
  })
}
