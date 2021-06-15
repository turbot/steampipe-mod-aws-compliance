locals {
  rbi_annex_i_1_3_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_1_3"
  })
}

benchmark "rbi_annex_i_1_3" {
  title       = "Annex_I(1.3)"
  description = "TODO"
  children = [
    control.rbi_annex_i_1_3_acm_certificate_expires_30_days,
    control.rbi_annex_i_1_3_apigateway_stage_cache_encryption_at_rest_enabled,
    control.rbi_annex_i_1_3_cloudtrail_logs_encrypted_with_kms_cmk,
    control.rbi_annex_i_1_3_cloudwatch_log_group_encryption_at_rest_enabled,
    control.rbi_annex_i_1_3_dms_replication_instances_not_publicly_accessible,
    control.rbi_annex_i_1_3_dynamodb_table_encryption_enabled,
    control.rbi_annex_i_1_3_ebs_attached_volume_encryption_enabled,
    control.rbi_annex_i_1_3_ebs_snapshot_not_publicly_restorable,
    control.rbi_annex_i_1_3_ebs_volume_encryption_enabled,
    control.rbi_annex_i_1_3_ec2_application_lb_configured_to_redirect_http_request_to_https,
    control.rbi_annex_i_1_3_ec2_instance_not_publicly_accessible,
    control.rbi_annex_i_1_3_efs_file_system_encrypt_data_at_rest,
    control.rbi_annex_i_1_3_elb_application_drop_http_headers,
    control.rbi_annex_i_1_3_elb_classic_configured_with_https_tls_termination,
    control.rbi_annex_i_1_3_emr_cluster_master_nodes_no_public_ip,
    control.rbi_annex_i_1_3_es_domain_encryption_at_rest_enabled,
    control.rbi_annex_i_1_3_es_domain_in_vpc,
    conteol.rbi_annex_i_1_3_es_domain_node_to_node_encryption_enabled,
    control.rbi_annex_i_1_3_kms_cmk_rotation_enabled,
    control.rbi_annex_i_1_3_kms_key_not_pending_deletion,
    control.rbi_annex_i_1_3_lambda_function_in_vpc,
    control.rbi_annex_i_1_3_lambda_function_restrict_public_access,
    control.rbi_annex_i_1_3_rds_db_instance_prohibit_public_access,
    control.rbi_annex_i_1_3_redshift_cluster_encryption_in_transit_enabled,
    control.rbi_annex_i_1_3_redshift_cluster_prohibit_public_access,
    control.rbi_annex_i_1_3_s3_bucket_default_encryption_enabled,
    control.rbi_annex_i_1_3_s3_bucket_enforces_ssl,
    control.rbi_annex_i_1_3_s3_bucket_public_access_blocked,
    control.rbi_annex_i_1_3_s3_bucket_restrict_public_read_access,
    control.rbi_annex_i_1_3_sagemaker_endpoint_configuration_encryption_enabled,
    control.rbi_annex_i_1_3_sagemaker_notebook_instance_direct_internet_access_disabled,
    control.rbi_annex_i_1_3_sns_topic_encrypted_at_rest,
    control.rbi_annex_i_1_3_vpc_security_group_restrict_common_port
  ]
  tags          = local.rbi_annex_i_1_3_common_tags
}

control "rbi_annex_i_1_3_acm_certificate_expires_30_days" {
  title       = "Imported ACM certificates should be renewed after a specified time period"
  description = "Ensure network integrity is protected by ensuring X509 certificates are issued by AWS ACM."
  sql         = query.acm_certificate_expires_30_days.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "acm"
  })
}

control "rbi_annex_i_1_3_elb_application_drop_http_headers" {
  title       = "ELB application load balancer should be configured to drop http headers"
  description = "Ensure that your Elastic Load Balancers (ELB) are configured to drop http headers."
  sql         = query.elb_application_drop_http_headers.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "elb"
  })
}

control "rbi_annex_i_1_3_ec2_application_lb_configured_to_redirect_http_request_to_https" {
  title       = "ELB application load balancer should be configured to redirect http request to https"
  description = "To help protect data in transit, ensure that your Application Load Balancer automatically redirects unencrypted HTTP requests to HTTPS."
  sql         = query.ec2_application_lb_configured_to_redirect_http_request_to_https.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "elb"
  })
}

control "rbi_annex_i_1_3_cloudtrail_logs_encrypted_with_kms_cmk" {
  title       = "Cloudtrail logs should be encrypted with KMS CMK"
  description = "Because sensitive data may exist and to help protect data at rest, ensure encryption is enabled for your AWS CloudTrail trails."
  sql         = query.cloudtrail_logs_encrypted_with_kms_cmk.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "cloudtrail"
  })
}

control "rbi_annex_i_1_3_kms_cmk_rotation_enabled" {
  title       = "KMS CMK rotation should be enabled"
  description = "Enable key rotation to ensure that keys are rotated once they have reached the end of their crypto period."
  sql         = query.kms_cmk_rotation_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "kms"
  })
}

control "rbi_annex_i_1_3_dynamodb_table_encryption_enabled" {
  title       = "DynamoDB table encryption should be enabled"
  description = "Ensure that encryption is enabled for your Amazon DynamoDB tables. Because sensitive data can exist at rest in these tables, enable encryption at rest to help protect that data."
  sql         = query.dynamodb_table_encryption_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "dynamodb"
  })
}

control "rbi_annex_i_1_3_ebs_volume_encryption_enabled" {
  title       = "EBS volume encryption should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql         = query.ebs_volume_encryption_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "ec2"
  })
}

control "rbi_annex_i_1_3_efs_file_system_encrypt_data_at_rest" {
  title       = "EFS file system should encrypt data at rest"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic File System (EFS)."
  sql         = query.efs_file_system_encrypt_data_at_rest.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "efs"
  })
}

control "rbi_annex_i_1_3_es_domain_encryption_at_rest_enabled" {
  title       = "Elasticsearch domain encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elasticsearch Service (Amazon ES) domains."
  sql         = query.es_domain_encryption_at_rest_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "elasticsearch"
  })
}

control "rbi_annex_i_1_3_es_domain_node_to_node_encryption_enabled" {
  title       = "Elasticsearch domain node to node encryption should be enabled"
  description = "Ensure node-to-node encryption for Amazon Elasticsearch Service is enabled. Node-to-node encryption enables TLS 1.2 encryption for all communications within the Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.es_domain_node_to_node_encryption_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "elasticsearch"
  })
}

control "rbi_annex_i_1_3_elb_classic_configured_with_https_tls_termination" {
  title       = "ELB classic load balancer should be configured with https tls termination"
  description = "Ensure that your Elastic Load Balancers (ELBs) are configured with SSL or HTTPS listeners. Because sensitive data can exist, enable encryption in transit to help protect that data."
  sql         = query.elb_classic_configured_with_https_tls_termination.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "elb"
  })
}

control "rbi_annex_i_1_3_ebs_attached_volume_encryption_enabled" {
  title       = "EBS attached volume encryption should be enabled"
  description = "Because senstive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql         = query.ebs_attached_volume_encryption_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "ec2"
  })
}

control "rbi_annex_i_1_3_kms_key_not_pending_deletion" {
  title       = "KMS key should not scheduled for deletion"
  description = "To help protect data at rest, ensure necessary customer master keys (CMKs) are not scheduled for deletion in AWS Key Management Service (AWS KMS)."
  sql         = query.kms_key_not_pending_deletion.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "kms"
  })
}

control "rbi_annex_i_1_3_redshift_cluster_encryption_in_transit_enabled" {
  title       = "Redshift cluster encryption in transit should be enabled"
  description = "Ensure that your Amazon Redshift clusters require TLS/SSL encryption to connect to SQL clients."
  sql         = query.redshift_cluster_encryption_in_transit_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "redshift"
  })
}

control "rbi_annex_i_1_3_s3_bucket_default_encryption_enabled" {
  title       = "S3 bucket default encryption should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your Amazon Simple Storage Service (Amazon S3) buckets."
  sql         = query.s3_bucket_default_encryption_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "s3"
  })
}

control "rbi_annex_i_1_3_s3_bucket_enforces_ssl" {
  title       = "S3 bucket should enforces SSL"
  description = "To help protect data in transit, ensure that your Amazon Simple Storage Service (Amazon S3) buckets require requests to use Secure Socket Layer (SSL)."
  sql         = query.s3_bucket_enforces_ssl.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "s3"
  })
}

control "rbi_annex_i_1_3_sagemaker_endpoint_configuration_encryption_enabled" {
  title       = "Sagemaker endpoint configuration encryption should be enabled"
  description = "To help protect data at rest, ensure encryption with AWS Key Management Service (AWS KMS) is enabled for your SageMaker endpoint."
  sql         = query.sagemaker_endpoint_configuration_encryption_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "sagemaker"
  })
}

control "rbi_annex_i_1_3_sns_topic_encrypted_at_rest" {
  title       = "SNS topic should be encrypted at rest"
  description = "To help protect data at rest, ensure that your Amazon Simple Notification Service (Amazon SNS) topics require encryption using AWS Key Management Service (AWS KMS)."
  sql         = query.sns_topic_encrypted_at_rest.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "sns"
  })
}

control "rbi_annex_i_1_3_dms_replication_instances_not_publicly_accessible" {
  title       = "DMS replication instances should not publicly accessible"
  description = "Manage access to the AWS Cloud by ensuring DMS replication instances cannot be publicly accessed."
  sql         = query.dms_replication_instances_not_publicly_accessible.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "dms"
  })
}

control "rbi_annex_i_1_3_ebs_snapshot_not_publicly_restorable" {
  title       = "EBS snapshot should not publicly restorable"
  description = "Manage access to the AWS Cloud by ensuring EBS snapshots are not publicly restorable."
  sql         = query.ebs_snapshot_not_publicly_restorable.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "ec2"
  })
}

control "rbi_annex_i_1_3_ec2_instance_not_publicly_accessible" {
  title       = "EC2 instance should not publicly accessible"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elastic Compute Cloud (Amazon EC2) instances cannot be publicly accessed."
  sql         = query.ec2_instance_not_publicly_accessible.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "ec2"
  })
}

control "rbi_annex_i_1_3_es_domain_in_vpc" {
  title       = "Elasticsearch domain should be within a vpc"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elasticsearch Service (Amazon ES) Domains are within an Amazon Virtual Private Cloud (Amazon VPC). An Amazon ES domain within an Amazon VPC enables secure communication between Amazon ES and other services within the Amazon VPC without the need for an internet gateway, NAT device, or VPN connection."
  sql         = query.es_domain_in_vpc.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "elasticsearch"
  })
}

control "rbi_annex_i_1_3_emr_cluster_master_nodes_no_public_ip" {
  title       = "EMR cluster master nodes should not have public ip"
  description = "Manage access to the AWS Cloud by ensuring Amazon EMR cluster master nodes cannot be publicly accessed."
  sql         = query.emr_cluster_master_nodes_no_public_ip.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "emr"
  })
}

control "rbi_annex_i_1_3_lambda_function_restrict_public_access" {
  title       = "Lambda function should restrict public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS Lambda functions cannot be publicly accessed. Public access can potentially lead to degradation of availability of resources."
  sql         = query.lambda_function_restrict_public_access.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "lambda"
  })
}

control "rbi_annex_i_1_3_lambda_function_in_vpc" {
  title       = "Lambda function should be within a vpc"
  description = "Deploy AWS Lambda functions within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a function and other services within the Amazon VPC. With this configuration, there is no requirement for an internet gateway, NAT device, or VPN connection."
  sql         = query.lambda_function_in_vpc.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "lambda"
  })
}

control "rbi_annex_i_1_3_rds_db_instance_prohibit_public_access" {
  title       = "RDS DB instance should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql         = query.rds_db_instance_prohibit_public_access.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "rds"
  })
}

control "rbi_annex_i_1_3_redshift_cluster_prohibit_public_access" {
  title       = "Redshift cluster should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Redshift clusters are not public."
  sql         = query.redshift_cluster_prohibit_public_access.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "redshift"
  })
}

control "rbi_annex_i_1_3_vpc_security_group_restrict_common_port" {
  title       = "VPC security group should restrict common port"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) security groups. Not restricting access to ports to trusted sources can lead to attacks against the availability, integrity and confidentiality of systems."
  sql         = query.vpc_security_group_restrict_common_port.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "vpc"
  })
}

control "rbi_annex_i_1_3_s3_bucket_public_access_blocked" {
  title       = "S3 bucket should not publicly accessible"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Simple Storage Service (Amazon S3) buckets cannot be publicly accessed. This rule helps keeping sensitive data safe from unauthorized remote users by preventing public access."
  sql         = query.s3_bucket_public_access_blocked.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "s3"
  })
}

control "rbi_annex_i_1_3_s3_bucket_restrict_public_read_access" {
  title       = "S3 bucket should restrict public read access"
  description = "Manage access to resources in the AWS Cloud by only allowing authorized users, processes, and devices access to Amazon Simple Storage Service (Amazon S3) buckets."
  sql         = query.s3_bucket_restrict_public_read_access.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "s3"
  })
}

control "rbi_annex_i_1_3_sagemaker_notebook_instance_direct_internet_access_disabled" {
  title       = "Sagemaker notebook instance direct internet access should be disabled"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon SageMaker notebooks do not allow direct internet access."
  sql         = query.sagemaker_notebook_instance_direct_internet_access_disabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "sagemaker"
  })
}

control "rbi_annex_i_1_3_apigateway_stage_cache_encryption_at_rest_enabled" {
  title       = "API Gateway stage cache encryption at rest should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your API Gateway stage’s cache."
  sql         = query.apigateway_stage_cache_encryption_at_rest_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "apigateway"
  })
}

control "rbi_annex_i_1_3_cloudwatch_log_group_encryption_at_rest_enabled" {
  title       = "Cloudwatch log group should be encryption at rest"
  description = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Groups."
  sql         = query.log_group_encryption_at_rest_enabled.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "cloudwatch"
  })
}
