locals {
  rbi_annex_i_1_3_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_1_3"
  })
}

benchmark "rbi_annex_i_1_3" {
  title       = "Annex_I(1.3)"
  description = "TODO"
  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dms_replication_instance_not_publicly_accessible,
    control.dynamodb_table_encrypted_with_kms_cmk,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_snapshot_not_publicly_restorable,
    control.ebs_volume_encryption_at_rest_enabled,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_configured_with_https_tls_termination,
    control.elb_classic_lb_use_ssl_certificate,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_in_vpc,
    control.es_domain_node_to_node_encryption_enabled,
    control.kms_cmk_rotation_enabled,
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
    control.s3_bucket_public_access_blocked,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]
  tags          = local.rbi_annex_i_1_3_common_tags
}