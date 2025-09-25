benchmark "nydfs_23_500_15" {
  title       = "500.15 Encryption of Nonpublic Information"
  description = "Encryption of nonpublic information Requirement: (a) As part of its cybersecurity program, each covered entity shall implement a written policy requiring encryption that meets industry standards, to protect nonpublic information held or transmitted by the covered entity both in transit over external networks and at rest."

  children = [
    benchmark.nydfs_23_500_15_a
  ]

  tags = local.nydfs_23_common_tags
}

benchmark "nydfs_23_500_15_a" {
  title       = "500.15(a)"
  description = "As part of its cybersecurity program, based on its Risk Assessment, each Covered Entity shall implement controls, including encryption, to protect Nonpublic Information held or transmitted by the Covered Entity both in transit over external networks and at rest."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.backup_recovery_point_encryption_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.codebuild_project_artifact_encryption_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.kinesis_stream_server_side_encryption_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.opensearch_domain_encryption_at_rest_enabled,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk,
    control.sns_topic_encrypted_at_rest
  ]

  tags = local.nydfs_23_common_tags
}

