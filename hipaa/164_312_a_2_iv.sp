locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_a_2_iv"
  })
}

benchmark "hipaa_164_312_a_2_iv" {
  title       = "164.312(a)(2)(iv) Encryption and decryption"
  description = "Implement a mechanism to encrypt and decrypt electronic protected health information."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.ebs_volume_encryption_at_rest_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.es_domain_encryption_at_rest_enabled,
    control.kms_key_not_pending_deletion,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
  ]
  tags          = local.common_tags
}