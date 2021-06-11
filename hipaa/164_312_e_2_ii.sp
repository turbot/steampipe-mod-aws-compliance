locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_e_2_ii"
  })
}

benchmark "hipaa_164_312_e_2_ii" {
  title       = "164.312(e)(2)(ii) Encryption"
  description = "Implement a mechanism to encrypt electronic protected health information whenever deemed appropriate."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_logs_encrypted_with_kms_cmk,
    control.ebs_volume_encryption_enabled,
    control.ec2_application_lb_configured_to_redirect_http_request_to_https,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_classic_lb_use_ssl_certificate,
    control.es_domain_encryption_at_rest_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.sns_topic_encrypted_at_rest,
  ]
  tags          = local.common_tags
}
