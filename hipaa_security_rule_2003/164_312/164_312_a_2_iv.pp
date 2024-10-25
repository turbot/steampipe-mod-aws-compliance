benchmark "hipaa_security_rule_2003_164_312_a_2_iv" {
  title       = "164.312(a)(2)(iv) Encryption and decryption"
  description = "Implement a mechanism to encrypt and decrypt electronic protected health information."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dax_cluster_encryption_at_rest_enabled,
    control.dynamodb_table_encrypted_with_kms,
    control.dynamodb_table_encryption_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.eks_cluster_secrets_encrypted,
    control.es_domain_encryption_at_rest_enabled,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.log_group_encryption_at_rest_enabled,
    control.opensearch_domain_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest
  ]

  tags = merge(local.hipaa_security_rule_2003_164_312_common_tags, {
    hipaa_security_rule_2003_item_id = "164_312_a_2_iv"
  })
}
