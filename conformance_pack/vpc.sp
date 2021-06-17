locals {
  conformance_pack_vpc_common_tags = {
    service = "vpc"
  }
}

control "vpc_flow_logs_enabled" {
  title       = "VPC flow logs should be enabled"
  description = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC."
  sql         = query.vpc_flow_logs_enabled.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_igw_attached_to_authorized_vpc" {
  title       = "VPC internet gateways should be attached to authorized vpc"
  description = "Manage access to resources in the AWS Cloud by ensuring that internet gateways are only attached to authorized Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.vpc_igw_attached_to_authorized_vpc.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_ingress_tcp_udp_all" {
  title       = "VPC security groups should restrict ingress TCP and UDP access from 0.0.0.0/0"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) Security Groups."
  sql         = query.vpc_security_group_restrict_ingress_tcp_udp_all.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_ingress_common_ports_all" {
  title       = "VPC security groups should restrict ingress access on ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) security groups."
  sql         = query.vpc_security_group_restrict_ingress_common_ports_all.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_ingress_ssh_all" {
  title       = "VPC security groups should restrict ingress SSH access from 0.0.0.0/0"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) Security Groups can help manage network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_security_group_restrict_ingress_ssh_all.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_default_security_group_restricts_all_traffic" {
  title       = "VPC default security group should not allow inbound and outbound traffic"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) security groups can help in the management of network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_default_security_group_restricts_all_traffic.sql
  tags        = local.conformance_pack_vpc_common_tags
}

control "vpc_vpn_tunnel_up" {
  title       = "Both VPN tunnels provided by AWS Site-to-Site VPN should be in UP status"
  description = "Redundant Site-to-Site VPN tunnels can be implemented to achieve resilience requirements."
  sql         = query.vpc_vpn_tunnel_up.sql
  tags        = local.conformance_pack_vpc_common_tags
}
