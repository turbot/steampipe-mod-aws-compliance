locals {
  hipaa_164_312_a_2_iv_common_tags = merge(local.hipaa_common_tags, {
    service = "164_312_a_2_iv"
  })
}

benchmark "hipaa_164_312_a_2_iv" {
  title         = "164.312(a)(2)(iv))"
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv.md")
  children = [
    control.hipaa_164_312_a_2_iv_apigateway_stage_cache_encrytion_at_rest_enabled,
    control.hipaa_164_312_a_2_iv_cloudtrail_logs_encrypted_with_kms_cmk,
    control.hipaa_164_312_a_2_iv_log_group_encryption_at_rest_enabled,
    control.hipaa_164_312_a_2_iv_efs_file_system_encrypt_data_at_rest,
    control.hipaa_164_312_a_2_iv_es_domain_encryption_at_rest_enabled,
    control.hipaa_164_312_a_2_iv_ebs_volume_encryption_enabled,
    control.hipaa_164_312_a_2_iv_kms_key_not_pending_deletion,
    control.hipaa_164_312_a_2_iv_rds_db_snapshot_encrypted_at_rest,
    control.hipaa_164_312_a_2_iv_rds_db_instance_encryption_at_rest_enabled,
    control.hipaa_164_312_a_2_iv_redshift_cluster_encryption_logging_enabled,
    control.hipaa_164_312_a_2_iv_redshift_cluster_encryption_in_transit_enabled,
    control.hipaa_164_312_a_2_iv_s3_bucket_default_encryption_enabled,
    control.hipaa_164_312_a_2_iv_s3_bucket_enforces_ssl,
    control.hipaa_164_312_a_2_iv_sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.hipaa_164_312_a_2_iv_sns_topic_encrypted_at_rest,
  ]
  tags          = local.hipaa_164_312_a_2_iv_common_tags
}

control "hipaa_164_312_a_2_iv_apigateway_stage_cache_encrytion_at_rest_enabled" {
  title         = "API Gateway stage cache encrytion at rest should be enabled"
  description   = "To help protect data at rest, ensure encryption is enabled for your API Gateway stage's cache."
  sql           = query.apigateway_stage_cache_encrytion_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_apigateway_stage_cache_encrytion_at_rest_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_apigateway_stage_cache_encrytion_at_rest_enabled"
  })
}

control "hipaa_164_312_a_2_iv_cloudtrail_logs_encrypted_with_kms_cmk" {
  title         = "Cloudtrail logs should be encrypted with kms cmk"
  description   = "Because sensitive data may exist and to help protect data at rest, ensure encryption is enabled for your AWS CloudTrail trails."
  sql           = query.cloudtrail_logs_encrypted_with_kms_cmk.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_cloudtrail_logs_encrypted_with_kms_cmk.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_cloudtrail_logs_encrypted_with_kms_cmk"
  })
}

control "hipaa_164_312_a_2_iv_log_group_encryption_at_rest_enabled" {
  title         = "Log group encryption at rest should be enabled"
  description   = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Groups."
  sql           = query.log_group_encryption_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_log_group_encryption_at_rest_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_log_group_encryption_at_rest_enabled"
  })
}

control "hipaa_164_312_a_2_iv_efs_file_system_encrypt_data_at_rest" {
  title         = "EFS file system should encrypt data at rest"
  description   = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic File System (EFS)."
  sql           = query.efs_file_system_encrypt_data_at_rest.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_efs_file_system_encrypt_data_at_rest.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_efs_file_system_encrypt_data_at_rest"
  })
}

control "hipaa_164_312_a_2_iv_es_domain_encryption_at_rest_enabled" {
  title         = "ES domain encryption at rest should be enabled"
  description   = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elasticsearch Service (Amazon ES) domains."
  sql           = query.es_domain_encryption_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_es_domain_encryption_at_rest_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_es_domain_encryption_at_rest_enabled"
  })
}

control "hipaa_164_312_a_2_iv_ebs_volume_encryption_enabled" {
  title         = "EBS volume encryption should be enabled"
  description   = "Because senstive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql           = query.ebs_volume_encryption_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_ebs_volume_encryption_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_ebs_volume_encryption_enabled"
  })
}

control "hipaa_164_312_a_2_iv_kms_key_not_pending_deletion" {
  title         = "KMS key should not be pending deletion"
  description   = "To help protect data at rest, ensure necessary customer master keys (CMKs) are not scheduled for deletion in AWS Key Management Service (AWS KMS)."
  sql           = query.kms_key_not_pending_deletion.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_kms_key_not_pending_deletion.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_kms_key_not_pending_deletion"
  })
}

control "hipaa_164_312_a_2_iv_rds_db_snapshot_encrypted_at_rest" {
  title         = "RDS db snapshot should be encrypted at rest"
  description   = "Ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) snapshots."
  sql           = query.rds_db_snapshot_encrypted_at_rest.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_rds_db_snapshot_encrypted_at_rest.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_rds_db_snapshot_encrypted_at_rest"
  })
}

control "hipaa_164_312_a_2_iv_rds_db_instance_encryption_at_rest_enabled" {
  title         = "RDS db instance encryption at rest should be enabled"
  description   = "To help protect data at rest, ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) instances."
  sql           = query.rds_db_instance_encryption_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_rds_db_instance_encryption_at_rest_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_rds_db_instance_encryption_at_rest_enabled"
  })
}

control "hipaa_164_312_a_2_iv_redshift_cluster_encryption_logging_enabled" {
  title         = "Redshift cluster encryption and logging should be enabled"
  description   = "To protect data at rest, ensure that encryption is enabled for your Amazon Redshift clusters."
  sql           = query.redshift_cluster_encryption_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_redshift_cluster_encryption_logging_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_redshift_cluster_encryption_logging_enabled"
  })
}

control "hipaa_164_312_a_2_iv_redshift_cluster_encryption_in_transit_enabled" {
  title         = "Redshift cluster encryption in transit should be enabled"
  description   = "Ensure that your Amazon Redshift clusters require TLS/SSL encryption to connect to SQL clients."
  sql           = query.redshift_cluster_encryption_in_transit_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_redshift_cluster_encryption_in_transit_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_redshift_cluster_encryption_in_transit_enabled"
  })
}

control "hipaa_164_312_a_2_iv_s3_bucket_default_encryption_enabled" {
  title         = "S3 bucket server side encryption should be enabled"
  description   = "To help protect data at rest, ensure encryption is enabled for your Amazon Simple Storage Service (Amazon S3) buckets."
  sql           = query.s3_bucket_default_encryption_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_s3_bucket_default_encryption_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_s3_bucket_default_encryption_enabled"
  })
}

control "hipaa_164_312_a_2_iv_s3_bucket_enforces_ssl" {
  title         = "S3 bucket should enforce ssl"
  description   = "To help protect data in transit, ensure that your Amazon Simple Storage Service (Amazon S3) buckets require requests to use Secure Socket Layer (SSL)."
  sql           = query.s3_bucket_enforces_ssl.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_s3_bucket_enforces_ssl.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_s3_bucket_enforces_ssl"
  })
}

control "hipaa_164_312_a_2_iv_sagemaker_notebook_instance_encryption_at_rest_enabled" {
  title         = "Sagemaker notebook instance encryption at rest should be enabled"
  description   = "To help protect data at rest, ensure encryption with AWS Key Management Service (AWS KMS) is enabled for your SageMaker notebook."
  sql           = query.sagemaker_notebook_instance_encryption_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_sagemaker_notebook_instance_encryption_at_rest_enabled.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_sagemaker_notebook_instance_encryption_at_rest_enabled"
  })
}

control "hipaa_164_312_a_2_iv_sns_topic_encrypted_at_rest" {
  title         = "SNS topic should be encrypted at rest"
  description   = "To help protect data at rest, ensure that your Amazon Simple Notification Service (Amazon SNS) topics require encryption using AWS Key Management Service (AWS KMS)."
  sql           = query.sns_topic_encrypted_at_rest.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_iv_sns_topic_encrypted_at_rest.md")

  tags = merge(local.hipaa_164_312_a_2_iv_common_tags, {
    hipaa_item_id  = "hipaa_164_312_a_2_iv_sns_topic_encrypted_at_rest"
  })
}