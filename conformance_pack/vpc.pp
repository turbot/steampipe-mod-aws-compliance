locals {
  conformance_pack_vpc_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/VPC"
  })
}

control "vpc_flow_logs_enabled" {
  title       = "VPC flow logs should be enabled"
  description = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your AWS Virtual Private Cloud (AWS VPC."
  query       = query.vpc_flow_logs_enabled

  tags = merge(local.conformance_pack_vpc_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "vpc_security_group_remote_administration" {
  title       = "Ensure no security groups allow ingress from 0.0.0.0/0 to remote server administration ports"
  description = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389."
  query       = query.vpc_security_group_remote_administration

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_remote_administration_ipv4" {
  title       = "Ensure no security groups allow ingress from 0.0.0.0/0 to remote server administration ports"
  description = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389, using either the TCP (6), UDP (17) or ALL (-1) protocols."
  query       = query.vpc_security_group_remote_administration_ipv4

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_ingress_rdp_all" {
  title       = "Ensure no security groups allow ingress from 0.0.0.0/0 to port 3389"
  description = "Security groups provide stateful filtering of ingress/egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to port 3389."
  query       = query.vpc_security_group_restrict_ingress_rdp_all

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_remote_administration_ipv6" {
  title       = "Ensure no security groups allow ingress from ::/0 to remote server administration ports"
  description = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389."
  query       = query.vpc_security_group_remote_administration_ipv6

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_unused" {
  title       = "Unused EC2 security groups should be removed"
  description = "This AWS control checks that security groups are attached to AWS Elastic Compute Cloud (AWS EC2) instances or to an elastic network interface. The control will fail if the security group is not associated with an AWS EC2 instance or an elastic network interface."
  query       = query.vpc_security_group_unused

  tags = local.conformance_pack_ec2_common_tags
}

control "vpc_igw_attached_to_authorized_vpc" {
  title       = "VPC internet gateways should be attached to authorized vpc"
  description = "Manage access to resources in the AWS Cloud by ensuring that internet gateways are only attached to authorized AWS Virtual Private Cloud (AWS VPC)."
  query       = query.vpc_igw_attached_to_authorized_vpc

  tags = merge(local.conformance_pack_vpc_common_tags, {
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "vpc_network_acl_remote_administration" {
  title       = "Network ACLs should not allow ingress from 0.0.0.0/0 to port 22 or port 3389"
  description = "This control checks if default ports for SSH/RDP ingress traffic for network access control lists (NACLs) is unrestricted. The rule fails if a NACL inbound entry allows a source CIDR block of '0.0.0.0/0' or '::/0' for ports 22 or 3389."
  query       = query.vpc_network_acl_remote_administration

  tags = merge(local.conformance_pack_vpc_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
    pci_dss_v40  = "true"
  })
}

control "vpc_security_group_restrict_ingress_tcp_udp_all" {
  title       = "VPC security groups should restrict ingress TCP and UDP access from 0.0.0.0/0"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on AWS Elastic Compute Cloud (AWS EC2) Security Groups."
  query       = query.vpc_security_group_restrict_ingress_tcp_udp_all

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "vpc_security_group_restrict_ingress_common_ports_all" {
  title       = "VPC security groups should restrict ingress access on ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0"
  description = "Manage access to resources in the AWS Cloud by ensuring common ports are restricted on AWS Elastic Compute Cloud (AWS EC2) security groups."
  query       = query.vpc_security_group_restrict_ingress_common_ports_all

  tags = merge(local.conformance_pack_vpc_common_tags, {
    audit_manager_control_tower            = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "vpc_security_group_restrict_ingress_ssh_all" {
  title       = "VPC security groups should restrict ingress SSH access from 0.0.0.0/0"
  description = "AWS Elastic Compute Cloud (AWS EC2) Security Groups can help manage network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  query       = query.vpc_security_group_restrict_ingress_ssh_all

  tags = merge(local.conformance_pack_vpc_common_tags, {
    acsc_essential_eight                   = "true"
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "vpc_default_security_group_restricts_all_traffic" {
  title       = "VPC default security group should not allow inbound and outbound traffic"
  description = "AWS Elastic Compute Cloud (AWS EC2) security groups can help in the management of network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  query       = query.vpc_default_security_group_restricts_all_traffic

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "vpc_vpn_tunnel_up" {
  title       = "Both VPN tunnels provided by AWS Site-to-Site VPN should be in UP status"
  description = "Redundant Site-to-Site VPN tunnels can be implemented to achieve resilience requirements."
  query       = query.vpc_vpn_tunnel_up

  tags = merge(local.conformance_pack_vpc_common_tags, {
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23_common_tags                   = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "vpc_eip_associated" {
  title       = "VPC EIPs should be associated with an EC2 instance or ENI"
  description = "This rule ensures Elastic IPs allocated to a AWS Virtual Private Cloud (AWS VPC) are attached to AWS Elastic Compute Cloud (AWS EC2) instances or in-use Elastic Network Interfaces."
  query       = query.vpc_eip_associated

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cis_controls_v8_ig1   = "true"
    cisa_cyber_essentials = "true"
    ffiec                 = "true"
    nist_800_171_rev_2    = "true"
    nist_csf              = "true"
    nist_csf_v2           = "true"
    pci_dss_v321          = "true"
    soc_2                 = "true"
  })
}

control "vpc_security_group_associated_to_eni" {
  title       = "VPC security groups should be associated with at least one ENI"
  description = "This rule ensures the security groups are attached to an AWS Elastic Compute Cloud (AWS EC2) instance or to an ENI. This rule helps monitoring unused security groups in the inventory and the management of your environment."
  query       = query.vpc_security_group_associated_to_eni

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cis_controls_v8_ig1 = "true"
    nist_800_171_rev_2  = "true"
    soc_2               = "true"
  })
}

control "vpc_subnet_auto_assign_public_ip_disabled" {
  title       = "VPC subnet auto assign public IP should be disabled"
  description = "Ensure that AWS Virtual Private Cloud (AWS VPC) subnets are assigned a public IP address. The control is compliant if AWS VPC does not have subnets that are assigned a public IP address. The control is non-compliant if AWS VPC has subnets that are assigned a public IP address."
  query       = query.vpc_subnet_auto_assign_public_ip_disabled

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "vpc_route_table_restrict_public_access_to_igw" {
  title       = "VPC route table should restrict public access to IGW"
  description = "Ensure that there are public routes in the route table to an Internet Gateway (IGW). The rule is non-compliant if a route to an IGW has a destination CIDR block of '0.0.0.0/0' or '::/0'."
  query       = query.vpc_route_table_restrict_public_access_to_igw

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
  })
}

control "vpc_security_group_restrict_ingress_redis_port" {
  title       = "VPC security groups should restrict ingress redis access from 0.0.0.0/0"
  description = "AWS VPC security groups can help in managing network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  query       = query.vpc_security_group_restrict_ingress_redis_port

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_ingress_kafka_port" {
  title       = "VPC security groups should restrict ingress Kafka port access from 0.0.0.0/0"
  description = "AWS VPC security groups can help in managing network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  query       = query.vpc_security_group_restrict_ingress_kafka_port

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_ingress_kibana_port" {
  title       = "VPC security groups should restrict ingress kibana port access from 0.0.0.0/0"
  description = "AWS VPC security groups can help in managing network access by providing stateful filtering of ingress and egress network traffic to AWS resources."
  query       = query.vpc_security_group_restrict_ingress_kibana_port

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_not_uses_launch_wizard_sg" {
  title       = "VPC security groups should restrict uses of 'launch-wizard' security groups."
  description = "Ensure the launch-wizard security group in your AWS account is not being used."
  query       = query.vpc_security_group_not_uses_launch_wizard_sg

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_endpoint_service_acceptance_required_enabled" {
  title       = "VPC endpoint services should have acceptance required enabled"
  description = "Ensure VPC endpoints connection requests to the service are accepted by the service owner."
  query       = query.vpc_endpoint_service_acceptance_required_enabled

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_network_acl_unused" {
  title       = "VPC network access control lists (network ACLs) should be associated with a subnet."
  description = "Ensure there are no unused network access control lists (network ACLs). The rule is compliant if each network ACL is associated with a subnet. The rule is non-compliant if a network ACL is not associated with a subnet."
  query       = query.vpc_network_acl_unused

  tags = merge(local.conformance_pack_vpc_common_tags, {
    cis_controls_v8_ig1   = "true"
    cisa_cyber_essentials = "true"
    nist_csf              = "true"
    nist_csf_v2           = "true"
    pci_dss_v40           = "true"
  })
}

control "vpc_configured_to_use_vpc_endpoints" {
  title       = "VPC should be configured to use VPC endpoints"
  description = "Checks if Service Endpoint for the service provided in rule parameter is created for each AWS Virtual Private Cloud (AWS VPC). The rule is non-compliant if an AWS VPC doesn't have an AWS VPC endpoint created for the service."
  query       = query.vpc_configured_to_use_vpc_endpoints

  tags = merge(local.conformance_pack_vpc_common_tags, {
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
  })
}

control "vpc_security_group_restricted_common_ports" {
  title       = "Security groups should not allow unrestricted access to ports with high risk"
  description = "This control checks whether unrestricted incoming traffic for the security groups is accessible to the specified ports that have the highest risk. This control passes when none of the rules in a security group allow ingress traffic from 0.0.0.0/0 for those ports."
  query       = query.vpc_security_group_restricted_common_ports

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_allows_ingress_authorized_ports" {
  title       = "VPC Security groups should only allow unrestricted incoming traffic for authorized ports"
  description = "This control checks whether the VPC security groups that are in use allow unrestricted incoming traffic. Optionally the rule checks whether the port numbers are listed in the authorizedTcpPorts parameter. The default values for authorizedTcpPorts are 80 and 443."
  query       = query.vpc_security_group_allows_ingress_authorized_ports

  tags = merge(local.conformance_pack_vpc_common_tags, {
    nydfs_23 = "true"
  })
}

control "vpc_security_group_allows_ingress_to_cassandra_ports" {
  title       = "VPC security groups should restrict ingress from 0.0.0.0/0 or ::/0 to cassandra ports 7199 or 9160 or 8888"
  description = "This control checks whether the VPC security groups allow ingress from 0.0.0.0/0 or ::/0 to cassandra ports 7199 or 9160 or 8888. This control passes when none of the rules in a security group allow ingress traffic from 0.0.0.0/0 from ports 7199 or 9160 or 8888."
  query       = query.vpc_security_group_allows_ingress_to_cassandra_ports

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_allows_ingress_to_memcached_port" {
  title       = "VPC security groups should restrict ingress from 0.0.0.0/0 or ::/0 to memcached port 11211"
  description = "This control checks whether the VPC security groups that are in use allow allow ingress from 0.0.0.0/0 or ::/0 to memcached port 11211. Optionally the rule checks whether the port numbers are listed in the authorizedTcpPorts parameter. This control passes when none of the rules in a security group allow ingress traffic from 0.0.0.0/0 from port 11211."
  query       = query.vpc_security_group_allows_ingress_to_memcached_port

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_allows_ingress_to_mongodb_ports" {
  title       = "VPC security groups should restrict ingress from 0.0.0.0/0 or ::/0 to mongoDB ports 27017 and 27018"
  description = "This control checks whether the VPC security groups that are in use allow ingress from 0.0.0.0/0 or ::/0 to mongoDB ports 27017 and 27018. Optionally the rule checks whether the port numbers are listed in the authorizedTcpPorts parameter. This control passes when none of the rules in a security group allow ingress traffic from 0.0.0.0/0 from ports 27017 and 27018."
  query       = query.vpc_security_group_allows_ingress_to_mongodb_ports

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_allows_ingress_to_oracle_ports" {
  title       = "VPC security groups should restrict ingress from 0.0.0.0/0 or ::/0 to oracle ports 1521 or 2483"
  description = "This control checks whether the VPC security groups that are in use allow ingress from 0.0.0.0/0 or ::/0 to oracle ports 1521 or 2483. Optionally the rule checks whether the port numbers are listed in the authorizedTcpPorts parameter. This control passes when none of the rules in a security group allow ingress traffic from 0.0.0.0/0 from ports 1521 or 2483."
  query       = query.vpc_security_group_allows_ingress_to_oracle_ports

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_in_more_than_one_region" {
  title       = "VPCs should exist in multiple regions"
  description = "This control checks whether there are VPCs present in multiple regions."
  query       = query.vpc_in_more_than_one_region

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_subnet_multi_az_enabled" {
  title       = "VPCs subnets should exist in multiple availability zones"
  description = "Ensure that each VPC has subnets spread across multiple availability zones."
  query       = query.vpc_subnet_multi_az_enabled

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_subnet_public_and_private" {
  title       = "VPCs should have both public and private subnets configured"
  description = "Ensure that all VPCs have both public and private subnets configured."
  query       = query.vpc_subnet_public_and_private

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_peering_connection_route_table_least_privilege" {
  title       = "VPCs peering connection route tables should have least privilege"
  description = "Ensure that all VPCs peering connection route tables have least privilege."
  query       = query.vpc_peering_connection_route_table_least_privilege

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_not_in_use" {
  title       = "VPCs should be in use"
  description = "This control checks whether there are any unused VPCs."
  query       = query.vpc_not_in_use

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_peering_connection_no_cross_account_access" {
  title       = "VPCs peering connection should not be allowed in cross account"
  description = "Ensure that all VPCs peering connection are not having cross account access."
  query       = query.vpc_peering_connection_no_cross_account_access

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_gateway_endpoint_restrict_public_access" {
  title       = "VPC gateway endpoints should restrict public access"
  description = "Manage access to resources in the AWS Cloud by ensuring VPC gateway endpoints cannot be publicly accessed."
  query       = query.vpc_gateway_endpoint_restrict_public_access

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_security_group_restrict_ingress_cifs_port_all" {
  title       = "VPC security groups should restrict ingress CIFS access from 0.0.0.0/0 and ::/0"
  description = "Common Internet File System (CIFS) is a network file-sharing protocol that allows systems to share files over a network. However, unrestricted CIFS access can expose your data to unauthorized users, leading to potential security risks. It is important to restrict CIFS access to only trusted networks and users to prevent unauthorized access and data breaches."
  query       = query.vpc_security_group_restrict_ingress_cifs_port_all

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_configured_to_use_interface_endpoint_for_ecr_api" {
  title         = "VPCs should be configured with an interface endpoint for ECR API"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for Amazon ECR API. The control fails if the VPC doesn't have an interface VPC endpoint for ECR API. This control evaluates resources in a single account."
  query         = query.vpc_configured_to_use_interface_endpoint_for_ecr_api

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_configured_to_use_interface_endpoint_for_docker_registry" {
  title         = "VPCs should be configured with an interface endpoint for Docker Registry"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for Docker Registry. The control fails if the VPC doesn't have an interface VPC endpoint for Docker Registry. This control evaluates resources in a single account."
  query         = query.vpc_configured_to_use_interface_endpoint_for_docker_registry

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_configured_to_use_interface_endpoint_for_ssm" {
  title         = "VPCs should be configured with an interface endpoint for Systems Manager"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for AWS Systems Manager. The control fails if the VPC doesn't have an interface VPC endpoint for Systems Manager. This control evaluates resources in a single account."
  query         = query.vpc_configured_to_use_interface_endpoint_for_ssm

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_configured_to_use_interface_endpoint_for_ssm_contacts" {
  title         = "VPCs should be configured with an interface endpoint for Systems Manager Incident Manager Contacts"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for AWS Systems Manager Incident Manager Contacts. The control fails if the VPC doesn't have an interface VPC endpoint for Systems Manager Incident Manager Contacts. This control evaluates resources in a single account."
  query         = query.vpc_configured_to_use_interface_endpoint_for_ssm_contacts

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_configured_to_use_interface_endpoint_for_ssm_incidents" {
  title         = "VPCs should be configured with an interface endpoint for Systems Manager Incident Manager"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for AWS Systems Manager Incident Manager. The control fails if the VPC doesn't have an interface VPC endpoint for Systems Manager Incident Manager. This control evaluates resources in a single account."
  query         = query.vpc_configured_to_use_interface_endpoint_for_ssm_incidents

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_vpn_connection_logging_enabled" {
  title         = "EC2 VPN connections should have logging enabled"
  description   = "This control checks whether an AWS Site-to-Site VPN connection has Amazon CloudWatch Logs enabled for both tunnels. The control fails if a Site-to-Site VPN connection doesn't have CloudWatch Logs enabled for both tunnels."
  query         = query.vpc_vpn_connection_logging_enabled

  tags = local.conformance_pack_vpc_common_tags
}

control "vpc_block_public_access_restrict_internet_gateway_traffic" {
  title         = "EC2 VPC Block Public Access settings should block internet gateway traffic"
  description   = "This control checks whether Amazon EC2 VPC Block Public Access (BPA) settings are configured to block internet gateway traffic for all Amazon VPCs in the AWS account. The control fails if VPC BPA settings aren't configured to block internet gateway traffic. For the control to pass, the VPC BPA InternetGatewayBlockMode must be set to block-bidirectional or block-ingress. If the parameter vpcBpaInternetGatewayBlockMode is provided, the control passes only if the VPC BPA value for InternetGatewayBlockMode matches the parameter."
  query         = query.vpc_block_public_access_restrict_internet_gateway_traffic

  tags = local.conformance_pack_vpc_common_tags
}

query "vpc_flow_logs_enabled" {
  sql = <<-EOQ
    with vpcs as (
      select
        arn,
        account_id,
        region,
        owner_id,
        vpc_id,
        tags,
        _ctx
      from
        aws_vpc
      order by
        vpc_id
    ),
    flowlogs as (
      select
        resource_id,
        account_id,
        flow_log_status,
        region
      from
        aws_vpc_flow_log
      order by
        resource_id
    )
    select
      v.arn as resource,
      case
        when v.account_id <> v.owner_id then 'skip'
        when f.resource_id is not null and f.flow_log_status = 'ACTIVE' then 'ok'
        when f.resource_id is not null and f.flow_log_status <> 'ACTIVE' then 'alarm'
        else 'alarm'
      end as status,
      case
        when v.account_id <> v.owner_id then v.vpc_id || ' is a shared VPC.'
        when f.resource_id is not null and f.flow_log_status = 'ACTIVE' then v.vpc_id || ' flow logging enabled and active.'
        when f.resource_id is not null and f.flow_log_status <> 'ACTIVE' then v.vpc_id || ' flow logging enabled but inactive.'
        else v.vpc_id || ' flow logging disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
    from
      vpcs as v
      left join flowlogs as f on v.vpc_id = f.resource_id;
  EOQ
}

query "vpc_igw_attached_to_authorized_vpc" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':ec2:' || region || ':' || account_id || ':internet-gateway/' || title as resource,
      case
        when jsonb_array_length(attachments) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when jsonb_array_length(attachments) = 0 then title || ' not attached to VPC.'
        else title || ' attached to ' || split_part(
          substring(attachments :: text, 3, length(attachments :: text) -6),
          '"VpcId": "',
          2
        ) || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_internet_gateway;
  EOQ
}

query "vpc_network_acl_remote_administration" {
  sql = <<-EOQ
    with bad_rules as (
      select
        network_acl_id,
        count(*) as num_bad_rules,
        tags,
        region,
        account_id
      from
        aws_vpc_network_acl,
        jsonb_array_elements(entries) as att
      where
        att ->> 'Egress' = 'false' -- as per aws egress = false indicates the ingress
        and (
          att ->> 'CidrBlock' = '0.0.0.0/0'
          or att ->> 'Ipv6CidrBlock' =  '::/0'
        )
        and att ->> 'RuleAction' = 'allow'
        and (
          (
            att ->> 'Protocol' = '-1' -- all traffic
            and att ->> 'PortRange' is null
          )
          or (
            (att -> 'PortRange' ->> 'From') :: int <= 22
            and (att -> 'PortRange' ->> 'To') :: int >= 22
            and att ->> 'Protocol' in('6', '17')  -- TCP or UDP
          )
          or (
            (att -> 'PortRange' ->> 'From') :: int <= 3389
            and (att -> 'PortRange' ->> 'To') :: int >= 3389
            and att ->> 'Protocol' in('6', '17')  -- TCP or UDP
        )
      )
      group by
        network_acl_id,
        region,
        account_id,
        tags
      order by
        network_acl_id,
        region,
        account_id,
        tags
    ),
    aws_vpc_network_acls as (
      select
        network_acl_id,
        tags,
        partition,
        region,
        account_id,
        _ctx
      from
        aws_vpc_network_acl
      order by
        network_acl_id,
        region,
        account_id
    )
    select
      'arn:' || acl.partition || ':ec2:' || acl.region || ':' || acl.account_id || ':network-acl/' || acl.network_acl_id  as resource,
      case
        when bad_rules.network_acl_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when bad_rules.network_acl_id is null then acl.network_acl_id || ' does not allow ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
        else acl.network_acl_id || ' contains ' || bad_rules.num_bad_rules || ' rule(s) allowing ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "acl.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "acl.")}
    from
      aws_vpc_network_acls as acl
      left join bad_rules on bad_rules.network_acl_id = acl.network_acl_id;
  EOQ
}

query "vpc_security_group_restrict_ingress_tcp_udp_all" {
  sql = <<-EOQ
    with bad_rules as (
      select
        group_id,
        count(*) as num_bad_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
          ip_protocol in ('tcp', 'udp')
          or (
            ip_protocol = '-1'
            and from_port is null
          )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when bad_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when bad_rules.group_id is null then sg.group_id || ' does not allow ingress to TCP or UDP ports from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || bad_rules.num_bad_rules || ' rule(s) that allow ingress to TCP or UDP ports from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as sg
      left join bad_rules on bad_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_restrict_ingress_common_ports_all" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
                from_port <= 22
                and to_port >= 22
            )
            or (
                from_port <= 3389
                and to_port >= 3389
            )
            or (
                from_port <= 21
                and to_port >= 21
            )
            or (
                from_port <= 20
                and to_port >= 20
            )
            or (
                from_port <= 3306
                and to_port >= 3306
            )
            or (
                from_port <= 4333
                and to_port >= 4333
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_ssh_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0.'
        else  sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access on ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_restrict_ingress_ssh_all" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
                from_port <= 22
                and to_port >= 22
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_ssh_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for SSH from 0.0.0.0/0.'
        else  sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing SSH from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_default_security_group_restricts_all_traffic" {
  sql = <<-EOQ
    select
      arn resource,
      case
        when jsonb_array_length(ip_permissions) = 0 and jsonb_array_length(ip_permissions_egress) = 0 then 'ok'
        else 'alarm'
      end status,
      case
        when jsonb_array_length(ip_permissions) > 0 and jsonb_array_length(ip_permissions_egress) > 0
          then 'Default security group ' || group_id || ' has inbound and outbound rules.'
        when jsonb_array_length(ip_permissions) > 0 and jsonb_array_length(ip_permissions_egress) = 0
          then 'Default security group ' || group_id || ' has inbound rules.'
        when jsonb_array_length(ip_permissions) = 0 and jsonb_array_length(ip_permissions_egress) > 0
          then 'Default security group ' || group_id || ' has outbound rules.'
        else 'Default security group ' || group_id || ' has no inbound or outbound rules.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_security_group
    where
      group_name = 'default';
  EOQ
}

query "vpc_vpn_tunnel_up" {
  sql = <<-EOQ
    with filter_data as (
      select
        arn,
        count(t ->> 'Status')
      from
        aws_vpc_vpn_connection,
        jsonb_array_elements(vgw_telemetry) as t
      where t ->> 'Status' = 'UP'
      group by arn
    )
    select
      a.arn as resource,
      case
        when b.count is null or b.count < 2 then 'alarm'
        else 'ok'
      end as status,
      case
        when b.count is null then a.title || ' has both tunnels offline.'
        when b.count = 1 then a.title || ' has one tunnel offline.'
        else a.title || ' has both tunnels online.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_vpn_connection as a
      left join filter_data as b on a.arn = b.arn;
  EOQ
}

query "vpc_eip_associated" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':ec2:' || region || ':' || account_id || ':eip/' || allocation_id as resource,
      case
        when association_id is null then 'alarm'
        else 'ok'
      end status,
      case
        when association_id is null then title || ' is not associated with any resource.'
        else title || ' is associated with a resource.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_eip;
  EOQ
}

query "vpc_security_group_associated_to_eni" {
  sql = <<-EOQ
    with associated_sg as (
      select
        count(sg ->> 'GroupId'),
        sg ->> 'GroupId' as secgrp_id
      from
        aws_ec2_network_interface,
        jsonb_array_elements(groups) as sg
        group by sg ->> 'GroupId'
    )
    select
      distinct s.arn as resource,
      case
        when a.secgrp_id = s.group_id then 'ok'
        else 'alarm'
      end as status,
      case
        when a.secgrp_id = s.group_id then s.title || ' is associated with ' || a.count || ' ENI(s).'
        else s.title || ' not associated to any ENI.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as s
      left join associated_sg as a on s.group_id = a.secgrp_id;
  EOQ
}

query "vpc_subnet_auto_assign_public_ip_disabled" {
  sql = <<-EOQ
    select
      subnet_id as resource,
      case
        when map_public_ip_on_launch = 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when map_public_ip_on_launch = 'false' then title || ' auto assign public IP disabled.'
        else title || ' auto assign public IP enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_subnet;
  EOQ
}

query "vpc_route_table_restrict_public_access_to_igw" {
  sql = <<-EOQ
    with route_with_public_access as (
      select
        route_table_id,
        count(*) as num
      from
        aws_vpc_route_table,
        jsonb_array_elements(routes) as r
      where
        ( r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
          or r ->> 'DestinationCidrBlock' = '::/0'
        )
        and r ->> 'GatewayId' like 'igw%'
      group by
        route_table_id
    )
    select
      a.route_table_id as resource,
      case
        when b.route_table_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.route_table_id is null then a.title || ' does not have public routes to an Internet Gateway (IGW)'
        else a.title || ' contains ' || b.num || ' rule(s) which have public routes to an Internet Gateway (IGW)'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_route_table as a
      left join route_with_public_access as b on b.route_table_id = a.route_table_id;
  EOQ
}

query "vpc_security_group_restrict_ingress_redis_port" {
  sql = <<-EOQ
    with ingress_redis_port as (
      select
        group_id,
        count(*) as num_redis_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and
          (cidr_ipv4 = '0.0.0.0/0'
          or cidr_ipv6 = '::/0')
        and
        (
          ( ip_protocol = '-1'
          and from_port is null
          )
          or (
            from_port <= 6379
            and to_port >= 6379
          )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_redis_port.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_redis_port.group_id is null then sg.group_id || ' restricted ingress from 0.0.0.0/0 or ::/0 to Redis port 6379.'
        else sg.group_id || ' contains ' || ingress_redis_port.num_redis_rules || ' ingress rule(s) from 0.0.0.0/0 or ::/0 to Redis port 6379.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as sg
      left join ingress_redis_port on ingress_redis_port.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_restrict_ingress_kafka_port" {
  sql = <<-EOQ
    with ingress_kafka_port as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and (
          cidr_ipv4 = '0.0.0.0/0'
          or cidr_ipv6 = '::/0'
        )
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
              from_port <= 9092
              and to_port >= 9092
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when k.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when k.group_id is null then sg.group_id || ' ingress restricted for kafka port from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || k.num_ssh_rules || ' ingress rule(s) allowing kafka port from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_kafka_port as k on k.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_restrict_ingress_kibana_port" {
  sql = <<-EOQ
    with ingress_kibana_port as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and (
          cidr_ipv4 = '0.0.0.0/0'
          or cidr_ipv6 = '::/0'
        )
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
              from_port <= 9200
              and to_port >= 9200
            )
            or (
              from_port <= 5601
              and to_port >= 5601
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when k.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when k.group_id is null then sg.group_id || ' ingress restricted for kibana port from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || k.num_ssh_rules || ' ingress rule(s) allowing kibana port from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_kibana_port as k on k.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_not_uses_launch_wizard_sg" {
  sql = <<-EOQ
    with associated_sg as (
      select
        distinct (sg ->> 'GroupName') as sg_name
      from
        aws_ec2_network_interface,
        jsonb_array_elements(groups) as sg
      where
        (sg ->> 'GroupName') like 'launch-wizard%'
    )
    select
      arn as resource,
      case
        when a.sg_name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.sg_name is null then title || ' not in use.'
        else title || ' in use.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as s
      left join associated_sg as a on a.sg_name = s.group_name
    where
      group_name like 'launch-wizard%';
  EOQ
}

query "vpc_endpoint_service_acceptance_required_enabled" {
  sql = <<-EOQ
    select
      service_id as resource,
      case
        when acceptance_required then 'ok'
        else 'alarm'
      end as status,
      case
        when acceptance_required then title || ' acceptance_required enabled.'
        else title || ' acceptance_required disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_endpoint_service;
  EOQ
}

query "vpc_network_acl_unused" {
  sql = <<-EOQ
    select
      network_acl_id as resource,
      case
        when jsonb_array_length(associations) >= 1  then 'ok'
        else 'alarm'
      end status,
      case
        when jsonb_array_length(associations) >= 1 then title || ' associated with subnet.'
        else title || ' not associated with subnet.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_network_acl;
  EOQ
}

query "vpc_configured_to_use_vpc_endpoints" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_id not in (
          select
            vpc_id
          from
            aws_vpc_endpoint
          where
            service_name like 'com.amazonaws.' || region || '.ec2'
        ) then 'alarm'
        else 'ok'
      end as status,
      case
        when vpc_id not in (
          select
            vpc_id
          from
            aws_vpc_endpoint
          where
            service_name like 'com.amazonaws.' || region || '.ec2'
        ) then title || ' not configured to use VPC endpoints.'
        else title || ' configured to use VPC endpoints.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc;
  EOQ
}

query "vpc_security_group_allows_ingress_to_mongodb_ports" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
                from_port <= 27017
                and to_port >= 27017
            )
            or (
                from_port <= 27018
                and to_port >= 27018
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_ssh_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for mongodb ports from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access for mongodb ports from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_allows_ingress_to_cassandra_ports" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
                from_port <= 7199
                and to_port >= 7199
            ) or (
                from_port <= 9160
                and to_port >= 9160
            ) or (
                from_port <= 8888
                and to_port >= 8888
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_ssh_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for cassandra ports from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access for cassandra ports from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_allows_ingress_to_oracle_ports" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
                from_port <= 1521
                and to_port >= 1521
            ) or (
                from_port <= 2483
                and to_port >= 2483
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_ssh_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for oracle ports from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access for oracle ports from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_allows_ingress_to_memcached_port" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
                from_port <= 11211
                and to_port >= 11211
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_ssh_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for memcached port from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access for memcached port from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_remote_administration_ipv4" {
  sql = <<-EOQ
        with bad_rules as (
          select
            group_id,
            count(*) as num_bad_rules
          from
            aws_vpc_security_group_rule
          where
            type = 'ingress'
            and (
              cidr_ipv4 = '0.0.0.0/0'
              or cidr_ipv6 = '::/0'
            )
            and (
                ( ip_protocol = '-1'      -- all traffic
                and from_port is null
                )
                or (
                    from_port <= 22
                    and to_port >= 22
                )
                or (
                    from_port <= 3389
                    and to_port >= 3389
                )
            )
          group by
            group_id
        ),
        security_groups as (
          select
            arn,
            tags,
            region,
            account_id,
            group_id,
            _ctx
          from
            aws_vpc_security_group
          order by
            group_id
        )
        select
          arn as resource,
          case
            when bad_rules.group_id is null then 'ok'
            else 'alarm'
          end as status,
          case
            when bad_rules.group_id is null then sg.group_id || ' does not allow ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
            else  sg.group_id || ' contains ' || bad_rules.num_bad_rules || ' rule(s) that allow ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
          end as reason
          ${local.tag_dimensions_sql}
          ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
        from
          security_groups as sg
          left join bad_rules on bad_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_remote_administration_ipv6" {
  sql = <<-EOQ
    with bad_rules as (
      select
        group_id,
        count(*) as num_bad_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and (
          cidr_ipv6 = '::/0'
        )
        and (
            ( ip_protocol = '-1'      -- all traffic
            and from_port is null
            )
            or (
                from_port <= 22
                and to_port >= 22
            )
            or (
                from_port <= 3389
                and to_port >= 3389
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when bad_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when bad_rules.group_id is null then sg.group_id || ' does not allow ingress to port 22 or 3389 from ::/0.'
        else  sg.group_id || ' contains ' || bad_rules.num_bad_rules || ' rule(s) that allow ingress to port 22 or 3389 from ::/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join bad_rules on bad_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_remote_administration" {
  sql = <<-EOQ
    with bad_rules as (
      select
        group_id,
        count(*) as num_bad_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and (
          cidr_ipv4 = '0.0.0.0/0'
          or cidr_ipv6 = '::/0'
        )
        and (
            ( ip_protocol = '-1'      -- all traffic
            and from_port is null
            )
            or (
                from_port <= 22
                and to_port >= 22
            )
            or (
                from_port <= 3389
                and to_port >= 3389
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when bad_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when bad_rules.group_id is null then sg.group_id || ' does not allow ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
        else  sg.group_id || ' contains ' || bad_rules.num_bad_rules || ' rule(s) that allow ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join bad_rules on bad_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_restrict_ingress_rdp_all" {
  sql = <<-EOQ
    with ingress_rdp_rules as (
      select
        group_id,
        count(*) as num_rdp_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
                from_port <= 3389
                and to_port >= 3389
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_rdp_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_rdp_rules.group_id is null then sg.group_id || ' ingress restricted for RDP from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || ingress_rdp_rules.num_rdp_rules || ' ingress rule(s) allowing RDP from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_rdp_rules on ingress_rdp_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_unused" {
  sql = <<-EOQ
    with associated_sg as (
      select
        sg ->> 'GroupId' as secgrp_id
      from
        aws_ec2_network_interface,
        jsonb_array_elements(groups) as sg
        group by sg ->> 'GroupId'
      union
        select
        sg ->> 'GroupId' as secgrp_id
      from
        aws_ec2_instance,
        jsonb_array_elements(security_groups) as sg
        group by sg ->> 'GroupId'
    )
    select
      distinct s.arn as resource,
      case
        when a.secgrp_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.secgrp_id is not null then s.title || ' is in use.'
        else s.title || ' not in use.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "s.")}
    from
      aws_vpc_security_group as s
      left join associated_sg as a on s.group_id = a.secgrp_id;
  EOQ
}

query "vpc_security_group_restricted_common_ports" {
  sql = <<-EOQ
    with ingress_ssh_rules as (
      select
        group_id,
        count(*) as num_ssh_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
            ( ip_protocol = '-1'
            and from_port is null
            )
            or (
                from_port <= 22
                and to_port >= 22
            )
            or (
                from_port <= 3389
                and to_port >= 3389
            )
            or (
                from_port <= 21
                and to_port >= 21
            )
            or (
                from_port <= 20
                and to_port >= 20
            )
            or (
                from_port <= 3306
                and to_port >= 3306
            )
            or (
                from_port <= 4333
                and to_port >= 4333
            )
            or (
                from_port <= 23
                and to_port >= 23
            )
            or (
                from_port <= 25
                and to_port >= 25
            )
            or (
                from_port <= 445
                and to_port >= 445
            )
            or (
                from_port <= 110
                and to_port >= 110
            )
            or (
                from_port <= 135
                and to_port >= 135
            )
            or (
                from_port <= 143
                and to_port >= 143
            )
            or (
                from_port <= 1433
                and to_port >= 3389
            )
            or (
                from_port <= 3389
                and to_port >= 1434
            )
            or (
                from_port <= 5432
                and to_port >= 5432
            )
            or (
                from_port <= 5500
                and to_port >= 5500
            )
            or (
                from_port <= 5601
                and to_port >= 5601
            )
            or (
                from_port <= 9200
                and to_port >= 9300
            )
            or (
                from_port <= 8080
                and to_port >= 8080
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_ssh_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for common ports from 0.0.0.0/0..'
        else sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access for common ports from 0.0.0.0/0.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_security_group_allows_ingress_authorized_ports" {
  sql = <<-EOQ
    with ingress_unauthorized_ports as (
      select
        group_id,
        count(*)
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (from_port is null or from_port not in (80,443))
      group by
        group_id
    )
    select
      sg.arn as resource,
      case
        when ingress_unauthorized_ports.count > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when ingress_unauthorized_ports.count > 0 then sg.title || ' having unrestricted incoming traffic other than default ports from 0.0.0.0/0 '
        else sg.title || ' allows unrestricted incoming traffic for authorized default ports (80,443).'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_unauthorized_ports on ingress_unauthorized_ports.group_id = sg.group_id;
  EOQ
}

query "vpc_in_more_than_one_region" {
  sql = <<-EOQ
    with vpc_region_list as (
      select
        distinct region, account_id
      from
        aws_vpc
    ), vpc_count_in_account as (
        select
        count(*) as num,
        account_id
      from
        vpc_region_list
        group by account_id
    )
    select
      arn as resource,
      case
        when v.num > 1 then 'ok'
        when v.num = 1 then 'alarm'
        else 'alarm'
      end as status,
      case
        when v.num > 1 then 'VPCs exist in ' || v.num || ' regions.'
        when v.num = 1 then 'VPCs exist only in one region.'
        else 'VPC does not exist.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join vpc_count_in_account as v on v.account_id = a.account_id;
  EOQ
}

query "vpc_subnet_multi_az_enabled" {
  sql = <<-EOQ
    with subnet_list as (
      select
        distinct availability_zone,
        vpc_id,
        count(*)
      from
        aws_vpc_subnet
      group by
        vpc_id, availability_zone
    ), zone_list as (
      select
        vpc_id,
        count(*) as num
      from
        subnet_list
      group by
        vpc_id
    )
    select
      arn as resource,
      case
        when l.num is null then 'alarm'
        when l.num > 1 then 'ok'
        else 'alarm'
      end as status,
      case
        when l.num is null then v.title || ' no subnet exists.'
        when l.num > 1 then v.title || ' subnets exist in ' || num || ' availability zones.'
        else v.title || ' subnet(s) exist in single availability zone.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc as v
      left join zone_list as l on l.vpc_id = v.vpc_id;
  EOQ
}

query "vpc_subnet_public_and_private" {
  sql = <<-EOQ
    with subnets_with_explicit_route as (
      select
        distinct ( a ->> 'SubnetId') as all_sub
      from
        aws_vpc_route_table as t,
        jsonb_array_elements(associations) as a
      where
        a ->> 'SubnetId' is not null
    ), public_subnets_with_explicit_route as (
      select
        distinct a ->> 'SubnetId' as SubnetId
      from
        aws_vpc_route_table as t,
        jsonb_array_elements(associations) as a,
        jsonb_array_elements(routes) as r
      where
        r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
        and
          (
            r ->> 'GatewayId' like 'igw-%'
            or r ->> 'NatGatewayId' like 'nat-%'
          )
        and a ->> 'SubnetId' is not null
    ), public_subnets_with_implicit_route as (
        select
        distinct route_table_id,
        vpc_id,
        region
      from
        aws_vpc_route_table as t,
        jsonb_array_elements(associations) as a,
        jsonb_array_elements(routes) as r
      where
        a ->> 'Main' = 'true'
        and r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
        and (
            r ->> 'GatewayId' like 'igw-%'
            or r ->> 'NatGatewayId' like 'nat-%'
          )
    ), subnet_accessibility as (
    select
      subnet_id,
      vpc_id,
      case
        when s.subnet_id in (select all_sub from subnets_with_explicit_route where all_sub not in (select SubnetId from public_subnets_with_explicit_route )) then 'private'
        when p.SubnetId is not null or s.vpc_id in ( select vpc_id from public_subnets_with_implicit_route) then 'public'
        else 'private'
      end as access
    from
    aws_vpc_subnet as s
    left join public_subnets_with_explicit_route as p on p.SubnetId = s.subnet_id
    )
    select
      arn as resource,
      case
        when v.vpc_id not in (select vpc_id from subnet_accessibility) then 'alarm'
        when 'public' in (select access from subnet_accessibility where vpc_id = v.vpc_id) and 'private' in (select access from subnet_accessibility where vpc_id = v.vpc_id) then 'ok'
        when 'public' in (select access from subnet_accessibility where vpc_id = v.vpc_id) and not 'private' in (select access from subnet_accessibility where vpc_id = v.vpc_id) then 'alarm'
        when 'private' in (select access from subnet_accessibility where vpc_id = v.vpc_id) and not 'public' in (select access from subnet_accessibility where vpc_id = v.vpc_id) then 'alarm'
        end as status,
      case
        when v.vpc_id not in (select vpc_id from subnet_accessibility) then v.title || ' has no subnet.'
        when 'public' in (select access from subnet_accessibility where vpc_id = v.vpc_id) and 'private' in (select access from subnet_accessibility where vpc_id = v.vpc_id) then v.title || ' having both private and public subnet(s).'
        when 'public' in (select access from subnet_accessibility where vpc_id = v.vpc_id) and not 'private' in (select access from subnet_accessibility where vpc_id = v.vpc_id) then v.title || ' having only public subnet(s).'
        when 'private' in (select access from subnet_accessibility where vpc_id = v.vpc_id) and not 'public' in (select access from subnet_accessibility where vpc_id = v.vpc_id) then v.title || ' having only private subnet(s).'
        end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc as v;
  EOQ
}

query "vpc_peering_connection_route_table_least_privilege" {
  sql = <<-EOQ
    with vpc_peering_routing_tables as (
      select
        r ->> 'VpcPeeringConnectionId' as peering_connection_id
      from
        aws_vpc_route_table,
        jsonb_array_elements(routes) as r
        inner join aws_vpc_peering_connection as c on r ->> 'VpcPeeringConnectionId' = c.id
      where
        ( r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
          or r ->> 'DestinationCidrBlock' = '::/0'
          or (r ->> 'DestinationCidrBlock')::cidr = c.accepter_cidr_block
          or (r ->> 'DestinationCidrBlock')::cidr = c.requester_cidr_block
        )
      group by
      r ->> 'VpcPeeringConnectionId'
    )
    select
      'arn:' || c.partition || ':ec2:' || c.region || ':' || c.account_id || ':vpc-peering-connection/' || c.id as resource,
      case
        when t.peering_connection_id is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when t.peering_connection_id is not null then c.title || ' does not have least privilege access.'
        else c.title || ' has least privilege access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_peering_connection as c
      left join vpc_peering_routing_tables as t on t.peering_connection_id = c.id;
  EOQ
}

query "vpc_not_in_use" {
  sql = <<-EOQ
    with vpc_without_subnet as (
      select
        distinct vpc_id
      from
        aws_vpc
      where
        vpc_id not in (select vpc_id from aws_vpc_subnet)
    )
    select
      arn as resource,
      case
        when s.vpc_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when s.vpc_id is null then title || ' in use.'
        else title || ' not in use.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc as v
      left join vpc_without_subnet as s on s.vpc_id = v.vpc_id;
  EOQ
}

query "vpc_vpn_gateway_per_region_less_then_4" {
  sql = <<-EOQ
    with vpn_gateway_per_region as (
      select
        count(*),
        region,
        account_id
      from
        aws_vpc_vpn_gateway
      group by
        region,
        account_id
    )
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when v.count > 3 then 'alarm'
        else 'ok'
      end as status,
      r.region || ' region has ' || coalesce(v.count, 0) || ' VPN gateway(s).' as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join vpn_gateway_per_region as v on r.account_id = v.account_id and r.region = v.region;
  EOQ
}

query "vpc_peering_connection_no_cross_account_access" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':ec2:' || region || ':' || account_id || ':vpc-peering-connection/' || id as resource,
      case
        when status_code <> 'active' then 'alarm'
        when requester_owner_id <> accepter_owner_id then 'alarm'
        else 'ok'
      end as status,
      case
        when status_code <> 'active' then title || ' is not in active state.'
        when requester_owner_id <> accepter_owner_id then title || ' has cross account access.'
        else title || ' does not have cross account access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_peering_connection;
  EOQ
}

query "vpc_gateway_endpoint_restrict_public_access" {
  sql = <<-EOQ
    with wildcard_action_policies as (
      select
        vpc_endpoint_id,
        count(*) as statements_num
      from
        aws_vpc_endpoint,
        jsonb_array_elements(policy_std -> 'Statement') as s
      where
        s ->> 'Effect' = 'Allow'
        and s -> 'Condition' is null
        and (
          (s -> 'Principal' -> 'AWS') = '["*"]'
          or s ->> 'Principal' = '*'
        )
        and s ->> 'Action' = '["*"]'
      group by
        vpc_endpoint_id
    )
    select
      e.vpc_endpoint_id as resource,
      case
        when e.vpc_endpoint_type <> 'Gateway' then 'skip'
        when p.vpc_endpoint_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when vpc_endpoint_type <> 'Gateway' then e.title || ' is of ' || e.vpc_endpoint_type || ' endpoint type.'
        when p.vpc_endpoint_id is null then e.title || ' does not allow public access.'
        else title || ' contains ' || coalesce(p.statements_num, 0) ||
        ' statements that allow public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "e.")}
    from
      aws_vpc_endpoint as e
      left join wildcard_action_policies as p on p.vpc_endpoint_id = e.vpc_endpoint_id;
  EOQ
}

query "vpc_security_group_restrict_ingress_cifs_port_all" {
  sql = <<-EOQ
    with ingress_cifs_rules as (
      select
        group_id,
        count(*) as num_cifs_rules
      from
        aws_vpc_security_group_rule
      where
        type = 'ingress'
        and (cidr_ipv4 = '0.0.0.0/0' or cidr_ipv6 = '::/0')
        and (
          (
            ip_protocol = '-1'
            and from_port is null
          )
          or (
            from_port <= 445
            and to_port >= 445
          )
        )
        group by
          group_id
    )
    select
      arn as resource,
      case
        when ingress_cifs_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_cifs_rules.group_id is null then sg.group_id || ' ingress restricted for CIFS port (445) from 0.0.0.0/0 and ::/0.'
        else sg.group_id || ' contains ' || ingress_cifs_rules.num_cifs_rules || ' ingress rule(s) allowing access on CIFS port (445) from 0.0.0.0/0 or ::/0..'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as sg
      left join ingress_cifs_rules on ingress_cifs_rules.group_id = sg.group_id;
  EOQ
}

query "vpc_configured_to_use_interface_endpoint_for_ecr_api" {
  sql = <<-EOQ
    with vpc_endpoints as (
      select distinct
        vpc_id
      from
        aws_vpc_endpoint
      where
        service_name  like 'com.amazonaws.' || region || '.ecr.api'
    )
    select
      v.arn as resource,
      case
        when e.vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when e.vpc_id is null then v.title || ' not configured to use interface endpoint for ECR API.'
        else v.title || ' configured to use interface endpoint for ECR API.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc v left join vpc_endpoints e using (vpc_id);
  EOQ
}

query "vpc_configured_to_use_interface_endpoint_for_docker_registry" {
  sql = <<-EOQ
    with vpc_endpoints as (
      select distinct
        vpc_id
      from
        aws_vpc_endpoint
      where
        service_name  like 'com.amazonaws.' || region || '.ecr.dkr'
    )
    select
      v.arn as resource,
      case
        when e.vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when e.vpc_id is null then v.title || ' not configured to use interface endpoint for docker registry.'
        else v.title || ' configured to use interface endpoint for docker registry.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc v left join vpc_endpoints e using (vpc_id);
  EOQ
}

query "vpc_configured_to_use_interface_endpoint_for_ssm" {
  sql = <<-EOQ
    with vpc_endpoints as (
      select distinct
        vpc_id
      from
        aws_vpc_endpoint
      where
        service_name  like 'com.amazonaws.' || region || '.ssm'
    )
    select
      v.arn as resource,
      case
        when e.vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when e.vpc_id is null then v.title || ' not configured to use interface endpoint for SSM.'
        else v.title || ' configured to use interface endpoint for SSM.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc v left join vpc_endpoints e using (vpc_id);
  EOQ
}

query "vpc_configured_to_use_interface_endpoint_for_ssm_contacts" {
  sql = <<-EOQ
    with vpc_endpoints as (
      select distinct
        vpc_id
      from
        aws_vpc_endpoint
      where
        service_name  like 'com.amazonaws.' || region || '.ssm-contacts'
    )
    select
      v.arn as resource,
      case
        when e.vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when e.vpc_id is null then v.title || ' not configured to use interface endpoint for SSM contacts.'
        else v.title || ' configured to use interface endpoint for SSM contacts.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc v left join vpc_endpoints e using (vpc_id);
  EOQ
}

query "vpc_configured_to_use_interface_endpoint_for_ssm_incidents" {
  sql = <<-EOQ
    with vpc_endpoints as (
      select distinct
        vpc_id
      from
        aws_vpc_endpoint
      where
        service_name  like 'com.amazonaws.' || region || '.ssm-incidents'
    )
    select
      v.arn as resource,
      case
        when e.vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when e.vpc_id is null then v.title || ' not configured to use interface endpoint for SSM incidents.'
        else v.title || ' configured to use interface endpoint for SSM incidents.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc v left join vpc_endpoints e using (vpc_id);
  EOQ
}

query "vpc_vpn_connection_logging_enabled" {
  sql = <<-EOQ
    with tunnel_logging as (
      select
        distinct arn,
        count(*)
      from
        aws_vpc_vpn_connection,
        jsonb_array_elements(options -> 'TunnelOptions') as t
      where
        (t -> 'LogOptions' -> 'CloudWatchLogOptions' ->> 'LogEnabled')::bool
      group by arn
    )
    select
      a.arn as resource,
      case
        when b.count >= 1 then 'ok'
        else 'alarm'
      end as status,
      case
        when b.count = 1 then a.title || ' has logging enabled for one tunnel.'
        when b.count = 2 then a.title || ' has logging enabled for both tunnels.'
        else a.title || ' has logging disabled for both tunnels.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_vpc_vpn_connection as a
      left join tunnel_logging as b on a.arn = b.arn;
  EOQ
}

query "vpc_block_public_access_restrict_internet_gateway_traffic" {
  sql = <<-EOQ
    select
      'arn:' || partition || '::' || region || ':' || account_id as resource,
      case
        when internet_gateway_block_mode in ('block-bidirectional', 'block-ingress') then 'ok'
        else 'alarm'
      end as status,
      case
        when internet_gateway_block_mode in ('block-bidirectional', 'block-ingress') then title || ' restricts internet gateway traffic.'
        else title || ' allows internet gateway traffic.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_vpc_block_public_access_options;
  EOQ
}
