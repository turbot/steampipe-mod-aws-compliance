locals {
  conformance_pack_vpc_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/VPC"
  })
}

control "vpc_flow_logs_enabled" {
  title       = "VPC flow logs should be enabled"
  description = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC."
  sql         = query.vpc_flow_logs_enabled.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "vpc_igw_attached_to_authorized_vpc" {
  title       = "VPC internet gateways should be attached to authorized vpc"
  description = "Manage access to resources in the AWS Cloud by ensuring that internet gateways are only attached to authorized Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.vpc_igw_attached_to_authorized_vpc.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    gxp_21_cfr_part_11 = "true"
    hipaa              = "true"
    nist_800_171_rev_2 = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "vpc_security_group_restrict_ingress_tcp_udp_all" {
  title       = "VPC security groups should restrict ingress TCP and UDP access from 0.0.0.0/0"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) Security Groups."
  sql         = query.vpc_security_group_restrict_ingress_tcp_udp_all.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "vpc_security_group_restrict_ingress_common_ports_all" {
  title       = "VPC security groups should restrict ingress access on ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on Amazon Elastic Compute Cloud (Amazon EC2) security groups."
  sql         = query.vpc_security_group_restrict_ingress_common_ports_all.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    audit_manager_control_tower = "true"
    cisa_cyber_essentials       = "true"
    fedramp_low_rev_4           = "true"
    fedramp_moderate_rev_4      = "true"
    ffiec                       = "true"
    gxp_21_cfr_part_11          = "true"
    hipaa                       = "true"
    nist_800_171_rev_2          = "true"
    nist_800_53_rev_4           = "true"
    nist_800_53_rev_5           = "true"
    nist_csf                    = "true"
    rbi_cyber_security          = "true"
  })
}

control "vpc_security_group_restrict_ingress_ssh_all" {
  title       = "VPC security groups should restrict ingress SSH access from 0.0.0.0/0"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) Security Groups can help manage network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_security_group_restrict_ingress_ssh_all.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    audit_manager_control_tower = "true"
    cisa_cyber_essentials       = "true"
    fedramp_low_rev_4           = "true"
    fedramp_moderate_rev_4      = "true"
    ffiec                       = "true"
    gxp_21_cfr_part_11          = "true"
    hipaa                       = "true"
    nist_800_171_rev_2          = "true"
    nist_800_53_rev_4           = "true"
    nist_800_53_rev_5           = "true"
    nist_csf                    = "true"
    rbi_cyber_security          = "true"
    soc_2                       = "true"
  })
}

control "vpc_default_security_group_restricts_all_traffic" {
  title       = "VPC default security group should not allow inbound and outbound traffic"
  description = "Amazon Elastic Compute Cloud (Amazon EC2) security groups can help in the management of network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_default_security_group_restricts_all_traffic.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "vpc_vpn_tunnel_up" {
  title       = "Both VPN tunnels provided by AWS Site-to-Site VPN should be in UP status"
  description = "Redundant Site-to-Site VPN tunnels can be implemented to achieve resilience requirements."
  sql         = query.vpc_vpn_tunnel_up.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
  })
}

control "vpc_eip_associated" {
  title       = "VPC EIPs should be associated with an EC2 instance or ENI"
  description = "This rule ensures Elastic IPs allocated to a Amazon Virtual Private Cloud (Amazon VPC) are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances or in-use Elastic Network Interfaces."
  sql         = query.vpc_eip_associated.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials = "true"
    ffiec                 = "true"
    nist_800_171_rev_2    = "true"
    nist_csf              = "true"
  })
}

control "vpc_security_group_associated_to_eni" {
  title       = "VPC security groups should be associated with at least one ENI"
  description = "This rule ensures the security groups are attached to an Amazon Elastic Compute Cloud (Amazon EC2) instance or to an ENI. This rule helps monitoring unused security groups in the inventory and the management of your environment."
  sql         = query.vpc_security_group_associated_to_eni.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "vpc_subnet_auto_assign_public_ip_disabled" {
  title       = "VPC subnet auto assign public IP should be disabled"
  description = "Ensure if Amazon Virtual Private Cloud (Amazon VPC) subnets are assigned a public IP address. The control is compliant if Amazon VPC does not have subnets that are assigned a public IP address. The control is non compliant if Amazon VPC has subnets that are assigned a public IP address."
  sql         = query.vpc_subnet_auto_assign_public_ip_disabled.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "vpc_route_table_restrict_public_access_to_igw" {
  title       = "VPC route table should restrict public access to IGW"
  description = "Ensure if there are public routes in the route table to an Internet Gateway (IGW). The rule is non compliant if a route to an IGW has a destination CIDR block of '0.0.0.0/0' or '::/0'."
  sql         = query.vpc_route_table_restrict_public_access_to_igw.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_5      = "true"
    rbi_cyber_security     = "true"
  })
}

control "vpc_security_group_restricted_common_ports" {
  title       = "Security groups should not allow unrestricted access to ports with high risk"
  description = "This control checks whether unrestricted incoming traffic for the security groups is accessible to the specified ports that have the highest risk. This control passes when none of the rules in a security group allow ingress traffic from 0.0.0.0/0 for those ports."
  sql         = query.vpc_security_group_restricted_common_ports.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    nist_800_171_rev_2 = "true"
  })
}

control "vpc_security_group_restrict_ingress_redis_port" {
  title       = "VPC security groups should restrict ingress redis access from 0.0.0.0/0"
  description = "Amazon VPC security groups can help in managing network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_security_group_restrict_ingress_redis_port.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    other_checks = "true"
  })
}

control "vpc_security_group_restrict_kibana_port" {
  title       = "VPC security groups should restrict ingress kibana port access from 0.0.0.0/0"
  description = "Amazon VPC security groups can help in managing network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  sql         = query.vpc_security_group_restrict_kibana_port.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    other_checks = "true"
  })
}

control "vpc_security_group_not_uses_launch_wizard_sg" {
  title       = "VPC security groups should restrict uses of 'launch-wizard' security groups."
  description = "Ensure the launch-wizard security group in your AWS account is not being used."
  sql         = query.vpc_security_group_not_uses_launch_wizard_sg.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    other_checks = "true"
  })
}

control "vpc_endpoint_service_acceptance_required_enabled" {
  title       = "VPC endpoint services should have acceptance required enabled"
  description = "Ensure VPC endpoints connection requests to the service are accepted by the service owner."
  sql         = query.vpc_endpoint_service_acceptance_required_enabled.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    other_checks = "true"
  })
}

control "vpc_network_acl_unused" {
  title       = "VPC network access control lists (network ACLs) should be associated with a subnet."
  description = "Ensure there are no unused network access control lists (network ACLs). The rule is compliant if each network ACL is associated with a subnet. The rule is non-compliant if a network ACL is not associated with a subnet."
  sql         = query.vpc_network_acl_unused.sql

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials = "true"
  })
}
