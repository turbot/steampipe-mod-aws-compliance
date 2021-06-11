locals {
  conformance_pack_cloudtrail_common_tags = {
    service = "cloudtrail"
  }
}

control "ec2_application_lb_configured_to_redirect_http_request_to_https" {
  title       = "EC2 application LB configured to redirect http request to https"
  description = "To help protect data in transit, ensure that your Application Load Balancer automatically redirects unencrypted HTTP requests to HTTPS."
  sql         = query.ec2_application_lb_configured_to_redirect_http_request_to_https.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}

control "ec2_ebs_default_encryption_enabled" {
  title       = "Amazon Elastic Block Store (EBS) encryption should be enabled by default"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql         = query.ec2_ebs_default_encryption_enabled.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}

control "ec2_instance_in_vpc" {
  title       = "EC2 instance should be in VPC"
  description = "Deploy Amazon Elastic Compute Cloud (Amazon EC2) instances within an Amazon Virtual Private Cloud (Amazon VPC) to enable secure communication between an instance and other services within the amazon VPC, without requiring an internet gateway, NAT device, or VPN connection."
  sql         = query.ec2_instance_in_vpc.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}

control "ec2_instance_not_publicly_accessible" {
  title       = "EC2 instances should not have a public IP address"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elastic Compute Cloud (Amazon EC2) instances cannot be publicly accessed."
  sql         = query.ec2_instance_not_publicly_accessible.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}

control "ec2_stopped_instance_30_days" {
  title       = "EC2 stopped instances should be removed in 30 days"
  description = "Enable this rule to help with the baseline configuration of Amazon Elastic Compute Cloud (Amazon EC2) instances by checking whether Amazon EC2 instances have been stopped for more than the allowed number of days, according to your organization's standards."
  sql         = query.ec2_stopped_instance_30_days.sql
  tags        = local.conformance_pack_cloudtrail_common_tags
}