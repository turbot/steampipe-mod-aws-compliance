locals {
  conformance_pack_ec2_common_tags = {
    service = "ec2"
  }
}

control "ec2_ebs_default_encryption_enabled" {
  title       = "EBS default encryption should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql         = query.ec2_ebs_default_encryption_enabled.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    hipaa              = "true"
  })
}

control "ec2_instance_in_vpc" {
  title       = "EC2 instances should be in a VPC"
  description = "Deploy Amazon Elastic Compute Cloud (Amazon EC2) instances within an Amazon Virtual Private Cloud (Amazon VPC) to enable secure communication between an instance and other services within the amazon VPC, without requiring an internet gateway, NAT device, or VPN connection."
  sql         = query.ec2_instance_in_vpc.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    hipaa               = "true"
    nist_cyber_security = "true"
    rbi_cyber_security  = "true"
  })
}

control "ec2_instance_not_publicly_accessible" {
  title       = "EC2 instances should not have a public IP address"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elastic Compute Cloud (Amazon EC2) instances cannot be publicly accessed."
  sql         = query.ec2_instance_not_publicly_accessible.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    hipaa               = "true"
    nist_cyber_security = "true"
    rbi_cyber_security  = "true"
  })
}

control "ec2_stopped_instance_30_days" {
  title       = "EC2 stopped instances should be removed in 30 days"
  description = "Enable this rule to help with the baseline configuration of Amazon Elastic Compute Cloud (Amazon EC2) instances by checking whether Amazon EC2 instances have been stopped for more than the allowed number of days, according to your organization's standards."
  sql         = query.ec2_stopped_instance_30_days.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    hipaa              = "true"
  })
}

control "ec2_unused_eips" {
  title       = "EC2 unused EIPs should be removed"
  description = "This rule ensures Elastic IPs allocated to a Amazon Virtual Private Cloud (Amazon VPC) are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances or in-use Elastic Network Interfaces."
  sql         = query.vpc_eip_associated.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_cyber_security = "true"
  })
}

control "ec2_unused_security_groups" {
  title       = "EC2 unused security groups should be removed"
  description = "This rule ensures the security groups are attached to an Amazon Elastic Compute Cloud (Amazon EC2) instance or to an ENI. This rule helps monitoring unused security groups in the inventory and the management of your environment."
  sql         = query.vpc_unused_security_group.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_cyber_security = "true"
  })
}