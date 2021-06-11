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
    control.rbi_annex_i_1_3_cloudtrail_logs_encrypted_with_kms_cmk,
    control.rbi_annex_i_1_3_dynamodb_table_encryption_enabled,
    control.rbi_annex_i_1_3_ebs_attached_volume_encryption_enabled
    control.rbi_annex_i_1_3_ebs_volume_encryption_enabled,
    control.rbi_annex_i_1_3_ec2_application_lb_configured_to_redirect_http_request_to_https,
    control.rbi_annex_i_1_3_efs_file_system_encrypt_data_at_rest,
    control.rbi_annex_i_1_3_elb_application_drop_http_headers,
    control.rbi_annex_i_1_3_elb_classic_configured_with_https_tls_termination
    control.rbi_annex_i_1_3_es_domain_encryption_at_rest_enabled,
    conteol.rbi_annex_i_1_3_es_domain_node_to_node_encryption_enabled,
    control.rbi_annex_i_1_3_kms_cmk_rotation_enabled,
    control.rbi_annex_i_1_3_kms_key_not_pending_deletion,
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
