locals {
  conformance_pack_vpc_common_tags = {
    service = "vpc"
  }
}

control "vpc_flow_log_enabled" {
  title       = "VPC flow log should be enabled"
  description = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC."
  sql         = query.vpc_flow_log_enabled.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_internet_gw_attached_to_authorized_vpc" {
  title       = "VPC internet gateway should be attached to authorized vpc"
  description = "Manage access to resources in the AWS Cloud by ensuring that internet gateways are only attached to authorized Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.vpc_internet_gw_attached_to_authorized_vpc.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_no_ingress_tcp_udp_all" {
  title       = "Security groups with inbound 0.0.0.0/0 should not have TCP or UDP ports accessible"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) Security Groups."
  sql         = query.vpc_security_group_no_ingress_tcp_udp_all.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_common_port" {
  title       = "VPC security group should restrict common ports"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) security groups."
  sql         = query.vpc_security_group_restrict_common_port.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_ssh" {
  title       = "VPC security group should restrict SSH"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) Security Groups can help manage network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_security_group_restrict_ssh.sql
  tags        = local.conformance_pack_vpc_common_tags
}
