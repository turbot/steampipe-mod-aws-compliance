locals {
  hipaa_164_308_a_1_ii_b_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_1_ii_b"
  })
}

benchmark "hipaa_164_308_a_1_ii_b" {
  title         = "164.308(a)(1)(ii)(B)"
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b.md")
  children = [
    control.hipaa_164_308_a_1_ii_b_apigateway_stage_cache_encrytion_at_rest_enabled,
    control.hipaa_164_308_a_1_ii_b_autoscaling_group_with_lb_use_healthcheck,
    control.hipaa_164_308_a_1_ii_b_cloudtrail_logs_encrypted_with_kms_cmk,
    control.hipaa_164_308_a_1_ii_b_cloudtrail_validation_enabled,
    control.hipaa_164_308_a_1_ii_b_codebuild_project_env_variables_no_clear_text,
    control.hipaa_164_308_a_1_ii_b_dms_replication_instances_not_publicly_accessible,
    control.hipaa_164_308_a_1_ii_b_dynamodb_table_auto_scaling_enabled,
    control.hipaa_164_308_a_1_ii_b_dynamodb_table_point_in_time_recovery_enabled,
    control.hipaa_164_308_a_1_ii_b_ebs_snapshot_not_publicly_restorable,
    control.hipaa_164_308_a_1_ii_b_ebs_volume_encryption_enabled,
    control.hipaa_164_308_a_1_ii_b_ec2_application_lb_configured_to_redirect_http_request_to_https,
    control.hipaa_164_308_a_1_ii_b_ec2_instance_not_publicly_accessible,
    control.hipaa_164_308_a_1_ii_b_ec2_stopped_instance_30_days,
    control.hipaa_164_308_a_1_ii_b_efs_file_system_encrypt_data_at_rest,
    control.hipaa_164_308_a_1_ii_b_elb_application_deletion_protection_enabled,
    control.hipaa_164_308_a_1_ii_b_elb_classic_lb_use_ssl_certificate,
    control.hipaa_164_308_a_1_ii_b_emr_cluster_master_nodes_no_public_ip,
    control.hipaa_164_308_a_1_ii_b_es_domain_encryption_at_rest_enabled,
    control.hipaa_164_308_a_1_ii_b_es_domain_in_vpc,
    control.hipaa_164_308_a_1_ii_b_iam_policy_no_star_star,
    control.hipaa_164_308_a_1_ii_b_iam_root_user_access_key,
    control.hipaa_164_308_a_1_ii_b_kms_key_not_pending_deletion,
    control.hipaa_164_308_a_1_ii_b_lambda_function_in_vpc,
    control.hipaa_164_308_a_1_ii_b_lambda_function_restrict_public_access,
    control.hipaa_164_308_a_1_ii_b_log_group_encryption_at_rest_enabled,
    control.hipaa_164_308_a_1_ii_b_rds_db_instance_backup_enabled,
    control.hipaa_164_308_a_1_ii_b_rds_db_instance_encryption_at_rest_enabled,
    control.hipaa_164_308_a_1_ii_b_rds_db_instance_multiple_az_enabled,
    control.hipaa_164_308_a_1_ii_b_rds_db_snapshot_encrypted_at_rest,
    control.hipaa_164_308_a_1_ii_b_rds_snapshot_prohibit_public_access,
    control.hipaa_164_308_a_1_ii_b_redshift_cluster_encryption_in_transit_enabled,
    control.hipaa_164_308_a_1_ii_b_redshift_cluster_prohibit_public_access,
    control.hipaa_164_308_a_1_ii_b_s3_bucket_cross_region_replication_enabled,
    control.hipaa_164_308_a_1_ii_b_s3_bucket_default_encryption_enabled,
    control.hipaa_164_308_a_1_ii_b_s3_bucket_enforces_ssl,
    control.hipaa_164_308_a_1_ii_b_s3_bucket_restrict_public_read_access,
    control.hipaa_164_308_a_1_ii_b_s3_bucket_restrict_public_write_access,
    control.hipaa_164_308_a_1_ii_b_s3_bucket_versioning_enabled,
    control.hipaa_164_308_a_1_ii_b_s3_public_access_block_account,
    control.hipaa_164_308_a_1_ii_b_sagemaker_notebook_instance_direct_internet_access_disabled,
    control.hipaa_164_308_a_1_ii_b_sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.hipaa_164_308_a_1_ii_b_sns_topic_encrypted_at_rest
  ]
  tags          = local.hipaa_164_308_a_1_ii_b_common_tags
}

control "hipaa_164_308_a_1_ii_b_ec2_application_lb_configured_to_redirect_http_request_to_https" {
  title         = "EC2 application LB configured to redirect http request to https"
  description   = "To help protect data in transit, ensure that your Application Load Balancer automatically redirects unencrypted HTTP requests to HTTPS."
  sql           = query.ec2_application_lb_configured_to_redirect_http_request_to_https.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_ec2_application_lb_configured_to_redirect_http_request_to_https.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "ec2"
  })
}

control "hipaa_164_308_a_1_ii_b_apigateway_stage_cache_encrytion_at_rest_enabled" {
  title         = "API Gateway stage cache encrytion at rest should be enabled"
  description   = "To help protect data at rest, ensure encryption is enabled for your API Gateway stage's cache."
  sql           = query.apigateway_stage_cache_encrytion_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_apigateway_stage_cache_encrytion_at_rest_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "apigateway"
  })
}

control "hipaa_164_308_a_1_ii_b_autoscaling_group_with_lb_use_healthcheck" {
  title         = "AutoScaling group with LB should use healthcheck"
  description   = "The Elastic Load Balancer (ELB) health checks for Amazon Elastic Compute Cloud (Amazon EC2) Auto Scaling groups support maintenance of adequate capacity and availability."
  sql           = query.autoscaling_group_with_lb_use_healthcheck.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_autoscaling_group_with_lb_use_healthcheck.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "autoscaling"
  })
}

control "hipaa_164_308_a_1_ii_b_cloudtrail_logs_encrypted_with_kms_cmk" {
  title         = "CloudTrail logs should be encrypted with kms cmk"
  description   = "Because sensitive data may exist and to help protect data at rest, ensure encryption is enabled for your AWS CloudTrail trails."
  sql           = query.cloudtrail_logs_encrypted_with_kms_cmk.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_cloudtrail_logs_encrypted_with_kms_cmk.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "cloudtrail"
  })
}

control "hipaa_164_308_a_1_ii_b_cloudtrail_validation_enabled" {
  title         = "CloudTrail validation should be enabled"
  description   = "Utilize AWS CloudTrail log file validation to check the integrity of CloudTrail logs."
  sql           = query.cloudtrail_validation_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_cloudtrail_validation_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "cloudtrail"
  })
}

control "hipaa_164_308_a_1_ii_b_log_group_encryption_at_rest_enabled" {
  title         = "Log group encryption at rest should be enabled"
  description   = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Groups."
  sql           = query.log_group_encryption_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_log_group_encryption_at_rest_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "logs"
  })
}

control "hipaa_164_308_a_1_ii_b_codebuild_project_env_variables_no_clear_text" {
  title         = "CodeBuild project env variables should be with no clear text"
  description   = "Ensure authentication credentials AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY do not exist within AWS Codebuild project environments."
  sql           = query.codebuild_project_env_variables_no_clear_text.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_codebuild_project_env_variables_no_clear_text.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "codebuild"
  })
}

control "hipaa_164_308_a_1_ii_b_rds_db_instance_backup_enabled" {
  title         = "RDS db instance backup should be enabled"
  description   = "The backup feature of Amazon RDS creates backups of your databases and transaction logs."
  sql           = query.rds_db_instance_backup_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_rds_db_instance_backup_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "rds"
  })
}

control "hipaa_164_308_a_1_ii_b_dms_replication_instances_not_publicly_accessible" {
  title         = "DMS replication instances should not be publicly accessible"
  description   = "Manage access to the AWS Cloud by ensuring DMS replication instances cannot be publicly accessed."
  sql           = query.dms_replication_instances_not_publicly_accessible.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_dms_replication_instances_not_publicly_accessible.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "dms"
  })
}

control "hipaa_164_308_a_1_ii_b_dynamodb_table_auto_scaling_enabled" {
  title         = "DynamoDB table auto scaling should be enabled"
  description   = "Amazon DynamoDB auto scaling uses the AWS Application Auto Scaling service to adjust provisioned throughput capacity that automatically responds to actual traffic patterns."
  sql           = query.dynamodb_table_auto_scaling_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_dynamodb_table_auto_scaling_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "dynamodb"
  })
}

control "hipaa_164_308_a_1_ii_b_dynamodb_table_point_in_time_recovery_enabled" {
  title         = "DynamoDB table point in time recovery should be enabled"
  description   = "Enable this rule to check that information has been backed up. It also maintains the backups by ensuring that point-in-time recovery is enabled in Amazon DynamoDB."
  sql           = query.dynamodb_table_point_in_time_recovery_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_dynamodb_table_point_in_time_recovery_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "dynamodb"
  })
}

control "hipaa_164_308_a_1_ii_b_ebs_snapshot_not_publicly_restorable" {
  title         = "EBS snapshot should not be publicly restorable"
  description   = "Manage access to the AWS Cloud by ensuring EBS snapshots are not publicly restorable."
  sql           = query.ebs_snapshot_not_publicly_restorable.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_ebs_snapshot_not_publicly_restorable.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "ec2"
  })
}

control "hipaa_164_308_a_1_ii_b_ec2_instance_not_publicly_accessible" {
  title         = "EC2 instance should not be publicly accessible"
  description   = "Manage access to the AWS Cloud by ensuring Amazon Elastic Compute Cloud (Amazon EC2) instances cannot be publicly accessed."
  sql           = query.ec2_instance_not_publicly_accessible.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_ec2_instance_not_publicly_accessible.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "ec2"
  })
}

control "hipaa_164_308_a_1_ii_b_ec2_stopped_instance_30_days" {
  title         = "EC2 stopped instance should be removed in 30 days"
  description   = "Enable this rule to help with the baseline configuration of Amazon Elastic Compute Cloud (Amazon EC2) instances by checking whether Amazon EC2 instances have been stopped for more than the allowed number of days, according to your organization's standards."
  sql           = query.ec2_stopped_instance_30_days.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_ec2_stopped_instance_30_days.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "ec2"
  })
}

control "hipaa_164_308_a_1_ii_b_efs_file_system_encrypt_data_at_rest" {
  title         = "EFS file system should encrypt data at rest"
  description   = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic File System (EFS)."
  sql           = query.efs_file_system_encrypt_data_at_rest.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_efs_file_system_encrypt_data_at_rest.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "efs"
  })
}

control "hipaa_164_308_a_1_ii_b_es_domain_encryption_at_rest_enabled" {
  title         = "ES domain encryption at rest should be enabled"
  description   = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elasticsearch Service (Amazon ES) domains"
  sql           = query.es_domain_encryption_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_es_domain_encryption_at_rest_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "es"
  })
}

control "hipaa_164_308_a_1_ii_b_es_domain_in_vpc" {
  title         = "ES domain should be in VPC"
  description   = "Manage access to the AWS Cloud by ensuring Amazon Elasticsearch Service (Amazon ES) Domains are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql           = query.es_domain_in_vpc.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_es_domain_in_vpc.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "es"
  })
}

control "hipaa_164_308_a_1_ii_b_elb_classic_lb_use_ssl_certificate" {
  title         = "ELB classic LB should use SSL certificate"
  description   = "Because sensitive data can exist and to help protect data at transit, ensure encryption is enabled for your Elastic Load Balancing."
  sql           = query.elb_classic_lb_use_ssl_certificate.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_elb_classic_lb_use_ssl_certificate.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "elb"
  })
}

control "hipaa_164_308_a_1_ii_b_elb_application_deletion_protection_enabled" {
  title         = "ELB application deletion protection should be enabled"
  description   = "This rule ensures that Elastic Load Balancing has deletion protection enabled."
  sql           = query.elb_application_deletion_protection_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_elb_application_deletion_protection_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "elb"
  })
}

control "hipaa_164_308_a_1_ii_b_emr_cluster_master_nodes_no_public_ip" {
  title         = "EMR cluster master nodes should be with no public ip"
  description   = "Manage access to the AWS Cloud by ensuring Amazon EMR cluster master nodes cannot be publicly accessed."
  sql           = query.emr_cluster_master_nodes_no_public_ip.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_emr_cluster_master_nodes_no_public_ip.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "emr"
  })
}

control "hipaa_164_308_a_1_ii_b_ebs_volume_encryption_enabled" {
  title         = "EBS volume encryption should be enabled"
  description   = "Because senstive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql           = query.ebs_volume_encryption_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_ebs_volume_encryption_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "ec2"
  })
}

control "hipaa_164_308_a_1_ii_b_iam_policy_no_star_star" {
  title         = "IAM policy no statements with admin access"
  description   = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'."
  sql           = query.iam_policy_no_star_star.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_iam_policy_no_star_star.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "iam"
  })
}

control "hipaa_164_308_a_1_ii_b_iam_root_user_access_key" {
  title         = "IAM root user should not have access key"
  description   = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  sql           = query.iam_root_user_access_key.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_iam_root_user_access_key.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "iam"
  })
}

control "hipaa_164_308_a_1_ii_b_kms_key_not_pending_deletion" {
  title         = "KMS key not pending deletion"
  description   = "To help protect data at rest, ensure necessary customer master keys (CMKs) are not scheduled for deletion in AWS Key Management Service (AWS KMS)."
  sql           = query.kms_key_not_pending_deletion.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_kms_key_not_pending_deletion.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "kms"
  })
}

control "hipaa_164_308_a_1_ii_b_lambda_function_restrict_public_access" {
  title         = "Lambda function  should restrict public access"
  description   = "AManage access to resources in the AWS Cloud by ensuring AWS Lambda functions cannot be publicly accessed."
  sql           = query.lambda_function_restrict_public_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_lambda_function_restrict_public_access.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "lambda"
  })
}

control "hipaa_164_308_a_1_ii_b_lambda_function_in_vpc" {
  title         = "Lambda function should be in vpc"
  description   = "Deploy AWS Lambda functions within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a function and other services within the Amazon VPC."
  sql           = query.lambda_function_in_vpc.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_lambda_function_in_vpc.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "lambda"
  })
}

control "hipaa_164_308_a_1_ii_b_rds_db_instance_multiple_az_enabled" {
  title         = "RDS db instance multiple az should be enabled"
  description   = "Multi-AZ support in Amazon Relational Database Service (Amazon RDS) provides enhanced availability and durability for database instances."
  sql           = query.rds_db_instance_multiple_az_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_rds_db_instance_multiple_az_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "rds"
  })
}

control "hipaa_164_308_a_1_ii_b_rds_db_snapshot_encrypted_at_rest" {
  title         = "RDS db snapshot should be encrypted at rest"
  description   = "Ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) snapshots."
  sql           = query.rds_db_snapshot_encrypted_at_rest.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_rds_db_snapshot_encrypted_at_rest.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "rds"
  })
}

control "hipaa_164_308_a_1_ii_b_rds_snapshot_prohibit_public_access" {
  title         = "RDS snapshot should prohibit public access"
  description   = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql           = query.rds_snapshot_prohibit_public_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_rds_snapshot_prohibit_public_access.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "rds"
  })
}

control "hipaa_164_308_a_1_ii_b_rds_db_instance_encryption_at_rest_enabled" {
  title         = "RDS db instance encryption at rest should be enabled"
  description   = "To help protect data at rest, ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) instances."
  sql           = query.rds_db_instance_encryption_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_rds_db_instance_encryption_at_rest_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "rds"
  })
}

control "hipaa_164_308_a_1_ii_b_redshift_cluster_prohibit_public_access" {
  title         = "Redshift cluster should prohibit public access"
  description   = "Manage access to resources in the AWS Cloud by ensuring that Amazon Redshift clusters are not public."
  sql           = query.redshift_cluster_prohibit_public_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_redshift_cluster_prohibit_public_access.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "redshift"
  })
}

control "hipaa_164_308_a_1_ii_b_redshift_cluster_encryption_in_transit_enabled" {
  title         = "Redshift cluster encryption in transit should be enabled"
  description   = "Ensure that your Amazon Redshift clusters require TLS/SSL encryption to connect to SQL clients."
  sql           = query.redshift_cluster_encryption_in_transit_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_redshift_cluster_encryption_in_transit_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "redshift"
  })
}

control "hipaa_164_308_a_1_ii_b_s3_public_access_block_account" {
  title         = "S3 public access should be blocked at account level"
  description   = "Manage access to resources in the AWS Cloud by ensuring that Amazon Simple Storage Service (Amazon S3) buckets cannot be publicly accessed."
  sql           = query.s3_public_access_block_account.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_s3_public_access_block_account.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "s3"
  })
}

control "hipaa_164_308_a_1_ii_b_s3_bucket_restrict_public_read_access" {
  title         = "S3 bucket restrict public read access"
  description   = "Manage access to resources in the AWS Cloud by only allowing authorized users, processes, and devices access to Amazon Simple Storage Service (Amazon S3) buckets."
  sql           = query.s3_bucket_restrict_public_read_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_s3_bucket_restrict_public_read_access.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "s3"
  })
}

control "hipaa_164_308_a_1_ii_b_s3_bucket_restrict_public_write_access" {
  title         = "S3 bucket restrict public write access"
  description   = "Manage access to resources in the AWS Cloud by only allowing authorized users, processes, and devices access to Amazon Simple Storage Service (Amazon S3) buckets."
  sql           = query.s3_bucket_restrict_public_write_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_s3_bucket_restrict_public_write_access.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "s3"
  })
}

control "hipaa_164_308_a_1_ii_b_s3_bucket_cross_region_replication_enabled" {
  title         = "S3 bucket cross region replication enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) Cross-Region Replication (CRR) supports maintaining adequate capacity and availability."
  sql           = query.s3_bucket_cross_region_replication_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_s3_bucket_cross_region_replication_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "s3"
  })
}

control "hipaa_164_308_a_1_ii_b_s3_bucket_default_encryption_enabled" {
  title         = "S3 bucket default encryption should be enabled"
  description   = "To help protect data at rest, ensure encryption is enabled for your Amazon Simple Storage Service (Amazon S3) buckets."
  sql           = query.s3_bucket_default_encryption_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_s3_bucket_default_encryption_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "s3"
  })
}

control "hipaa_164_308_a_1_ii_b_s3_bucket_enforces_ssl" {
  title         = "S3 bucket should enforce SSL"
  description   = "To help protect data in transit, ensure that your Amazon Simple Storage Service (Amazon S3) buckets require requests to use Secure Socket Layer (SSL)."
  sql           = query.s3_bucket_enforces_ssl.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_s3_bucket_enforces_ssl.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "s3"
  })
}

control "hipaa_164_308_a_1_ii_b_s3_bucket_versioning_enabled" {
  title         = "S3 bucket versioning should be enabled"
  description   = "Amazon Simple Storage Service (Amazon S3) bucket versioning helps keep multiple variants of an object in the same Amazon S3 bucket."
  sql           = query.s3_bucket_versioning_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_s3_bucket_versioning_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "s3"
  })
}

control "hipaa_164_308_a_1_ii_b_sagemaker_notebook_instance_encryption_at_rest_enabled" {
  title         = "Sagemaker notebook instance encryption at rest should be enabled"
  description   = "To help protect data at rest, ensure encryption with AWS Key Management Service (AWS KMS) is enabled for your SageMaker notebook."
  sql           = query.sagemaker_notebook_instance_encryption_at_rest_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_sagemaker_notebook_instance_encryption_at_rest_enabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "sagemaker"
  })
}

control "hipaa_164_308_a_1_ii_b_sns_topic_encrypted_at_rest" {
  title         = "SNS topic should be encrypted at rest"
  description   = "To help protect data at rest, ensure that your Amazon Simple Notification Service (Amazon SNS) topics require encryption using AWS Key Management Service (AWS KMS)."
  sql           = query.sns_topic_encrypted_at_rest.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_sns_topic_encrypted_at_rest.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "sns"
  })
}
control "hipaa_164_308_a_1_ii_b_sagemaker_notebook_instance_direct_internet_access_disabled" {
  title         = "Sagemaker notebook instance direct internet access should be disabled"
  description   = "Manage access to resources in the AWS Cloud by ensuring that Amazon SageMaker notebooks do not allow direct internet access."
  sql           = query.sagemaker_notebook_instance_direct_internet_access_disabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_1_ii_b_sagemaker_notebook_instance_direct_internet_access_disabled.md")

  tags = merge(local.hipaa_164_308_a_1_ii_b_common_tags, {
    service     = "sagemaker"
  })
}
