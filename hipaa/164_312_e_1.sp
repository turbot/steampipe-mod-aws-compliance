locals {
  hipaa_164_312_e_1_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "hipaa_164_312_e_1"
  })
}

benchmark "hipaa_164_312_e_1" {
  title       = "164.312(e)(1) Transmission security"
  description = "Implement technical security measures to guard against unauthorized access to electronic protected health information that is being transmitted over an electronic communications network."
  children = [
    control.hipaa_164_312_e_1_ec2_instance_in_vpc,
    control.hipaa_164_312_e_1_elb_classic_lb_use_ssl_certificate,
    control.hipaa_164_312_e_1_es_domain_in_vpc,
    control.hipaa_164_312_e_1_lambda_function_in_vpc,
    control.hipaa_164_312_e_1_redshift_cluster_encryption_in_transit_enabled,
    control.hipaa_164_312_e_1_s3_bucket_enforces_ssl,
    control.hipaa_164_312_e_1_vpc_security_group_authorized_port,
    control.hipaa_164_312_e_1_vpc_security_group_remote_administration,
  ]
  tags = local.hipaa_164_312_e_1_common_tags
}

control "hipaa_164_312_e_1_es_domain_in_vpc" {
  title       = "ES domain should be in VPC"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elasticsearch Service (Amazon ES) Domains are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.es_domain_in_vpc.sql

  tags = merge(local.hipaa_164_312_e_1_common_tags, {
    service = "es"
  })
}

control "hipaa_164_312_e_1_elb_classic_lb_use_ssl_certificate" {
  title       = "ELB classic LB should use SSL certificate"
  description = "Because sensitive data can exist and to help protect data at transit, ensure encryption is enabled for your Elastic Load Balancing."
  sql         = query.elb_classic_lb_use_ssl_certificate.sql

  tags = merge(local.hipaa_164_312_e_1_common_tags, {
    service = "elb"
  })
}

control "hipaa_164_312_e_1_vpc_security_group_remote_administration" {
  title       = "Security groups should not allow ingress from 0.0.0.0/0 to remote server administration ports"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) Security Groups can help manage network access by providing stateful filtering of ingress and egress network traffic to AWS resources. Not allowing ingress (or remote) traffic from 0.0.0.0/0 to port 22 on your resources help you restricting remote access."
  sql         = query.vpc_security_group_remote_administration.sql

  tags = merge(local.hipaa_164_312_e_1_common_tags, {
    service = "vpc"
  })
}

control "hipaa_164_312_e_1_ec2_instance_in_vpc" {
  title       = "EC2 instance should be in VPC"
  description = "Deploy Amazon Elastic Compute Cloud (Amazon EC2) instances within an Amazon Virtual Private Cloud (Amazon VPC) to enable secure communication between an instance and other services within the amazon VPC, without requiring an internet gateway, NAT device, or VPN connection."
  sql         = query.ec2_instance_in_vpc.sql

  tags = merge(local.hipaa_164_312_e_1_common_tags, {
    service = "ec2"
  })
}

control "hipaa_164_312_e_1_lambda_function_in_vpc" {
  title       = "Lambda function should be in VPC"
  description = "Deploy AWS Lambda functions within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a function and other services within the Amazon VPC."
  sql         = query.lambda_function_in_vpc.sql

  tags = merge(local.hipaa_164_312_e_1_common_tags, {
    service = "lambda"
  })
}

control "hipaa_164_312_e_1_redshift_cluster_encryption_in_transit_enabled" {
  title       = "Redshift cluster encryption in transit should be enabled"
  description = "Ensure that your Amazon Redshift clusters require TLS/SSL encryption to connect to SQL clients."
  sql         = query.redshift_cluster_encryption_in_transit_enabled.sql

  tags = merge(local.hipaa_164_312_e_1_common_tags, {
    service = "redshift"
  })
}

control "hipaa_164_312_e_1_s3_bucket_enforces_ssl" {
  title       = "S3 bucket should enforce SSL"
  description = "To help protect data in transit, ensure that your Amazon Simple Storage Service (Amazon S3) buckets require requests to use Secure Socket Layer (SSL)."
  sql         = query.s3_bucket_enforces_ssl.sql

  tags = merge(local.hipaa_164_312_e_1_common_tags, {
    service = "s3"
  })
}

control "hipaa_164_312_e_1_vpc_security_group_authorized_port" {
  title       = "Security groups with inbound 0.0.0.0/0 should not have TCP or UDP ports accessible"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) Security Groups."
  sql         = query.vpc_security_group_no_ingress_tcp_udp_all.sql

  tags = merge(local.hipaa_164_312_e_1_common_tags, {
    service = "vpc"
  })
}