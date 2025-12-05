locals {
  foundational_security_ec2_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/EC2"
  })
}

benchmark "foundational_security_ec2" {
  title         = "EC2"
  documentation = file("./foundational_security/docs/foundational_security_ec2.md")
  children = [
    control.foundational_security_ec2_1,
    control.foundational_security_ec2_2,
    control.foundational_security_ec2_3,
    control.foundational_security_ec2_4,
    control.foundational_security_ec2_6,
    control.foundational_security_ec2_7,
    control.foundational_security_ec2_8,
    control.foundational_security_ec2_9,
    control.foundational_security_ec2_10,
    control.foundational_security_ec2_15,
    control.foundational_security_ec2_16,
    control.foundational_security_ec2_17,
    control.foundational_security_ec2_18,
    control.foundational_security_ec2_19,
    control.foundational_security_ec2_20,
    control.foundational_security_ec2_21,
    control.foundational_security_ec2_23,
    control.foundational_security_ec2_24,
    control.foundational_security_ec2_25,
    control.foundational_security_ec2_51,
    control.foundational_security_ec2_55,
    control.foundational_security_ec2_56,
    control.foundational_security_ec2_57,
    control.foundational_security_ec2_58,
    control.foundational_security_ec2_60,
    control.foundational_security_ec2_170,
    control.foundational_security_ec2_171,
    control.foundational_security_ec2_172,
    control.foundational_security_ec2_173,
    control.foundational_security_ec2_180,
    control.foundational_security_ec2_181
  ]

  tags = merge(local.foundational_security_ec2_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_ec2_1" {
  title         = "1 Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone"
  description   = "Amazon EBS snapshots should not be public, determined by the ability to be restorable by anyone. EBS snapshots are used to back up the data on your EBS volumes to Amazon S3 at a specific point in time. You can use the snapshots to restore previous states of EBS volumes. It is rarely acceptable to share a snapshot with the public. Typically the decision to share a snapshot publicly was made in error or without a complete understanding of the implications. This check helps ensure that all such sharing was fully planned and intentional."
  severity      = "critical"
  query         = query.ebs_snapshot_not_publicly_restorable
  documentation = file("./foundational_security/docs/foundational_security_ec2_1.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_1"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_ec2_2" {
  title         = "2 VPC default security groups should not allow inbound or outbound traffic"
  description   = "This control checks that the default security group of a VPC does not allow inbound or outbound traffic. The rules for the default security group allow all outbound and inbound traffic from network interfaces (and their associated instances) that are assigned to the same security group."
  severity      = "high"
  query         = query.vpc_default_security_group_restricts_all_traffic
  documentation = file("./foundational_security/docs/foundational_security_ec2_2.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_2"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_ec2_3" {
  title         = "3 Attached EBS volumes should be encrypted at rest"
  description   = "This control checks whether the EBS volumes that are in an attached state are encrypted. To pass this check, EBS volumes must be in use and encrypted. If the EBS volume is not attached, then it is not subject to this check."
  severity      = "medium"
  query         = query.ebs_attached_volume_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_3.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_3"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_ec2_4" {
  title         = "4 Stopped EC2 instances should be removed after a specified time period"
  description   = "This control checks whether any EC2 instances have been stopped for more than the allowed number of days. An EC2 instance fails this check if it is stopped for longer than the maximum allowed time period, which by default is 30 days."
  severity      = "medium"
  query         = query.ec2_stopped_instance_30_days
  documentation = file("./foundational_security/docs/foundational_security_ec2_4.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_4"
    foundational_security_category = "inventory"
  })
}

control "foundational_security_ec2_6" {
  title         = "6 VPC flow logging should be enabled in all VPCs"
  description   = "This control checks whether Amazon VPC Flow Logs are found and enabled for VPCs. The traffic type is set to Reject. With the VPC Flow Logs feature, you can capture information about the IP address traffic going to and from network interfaces in your VPC. After you create a flow log, you can view and retrieve its data in CloudWatch Logs. To reduce cost, you can also send your flow logs to Amazon S3."
  severity      = "medium"
  query         = query.vpc_flow_logs_enabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_6.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_6"
    foundational_security_category = "logging"
  })
}

control "foundational_security_ec2_7" {
  title         = "7 EBS default encryption should be enabled"
  description   = "This control checks whether account-level encryption is enabled by default for Amazon Elastic Block Store(Amazon EBS). The control fails if the account level encryption is not enabled."
  severity      = "medium"
  query         = query.ebs_encryption_by_default_enabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_7.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_7"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_ec2_8" {
  title         = "8 EC2 instances should use IMDSv2"
  description   = "This control checks whether your EC2 instance metadata version is configured with Instance Metadata Service Version 2 (IMDSv2). The control passes if HttpTokens is set to required for IMDSv2. The control fails if HttpTokens is set to optional."
  severity      = "high"
  query         = query.ec2_instance_uses_imdsv2
  documentation = file("./foundational_security/docs/foundational_security_ec2_8.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_8"
    foundational_security_category = "network_security"
  })
}

control "foundational_security_ec2_9" {
  title         = "9 EC2 instances should not have a public IP address"
  description   = "This control checks whether EC2 instances have a public IP address. The control fails if the publicIp field is present in the EC2 instance configuration item. This control applies to IPv4 addresses only."
  severity      = "high"
  query         = query.ec2_instance_not_publicly_accessible
  documentation = file("./foundational_security/docs/foundational_security_ec2_9.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_9"
    foundational_security_category = "public_ip_addresses"
  })
}

control "foundational_security_ec2_10" {
  title         = "10 Amazon EC2 should be configured to use VPC endpoints"
  description   = "This control checks whether a service endpoint for Amazon EC2 is created for each VPC. The control fails if a VPC does not have a VPC endpoint created for the Amazon EC2 service."
  severity      = "medium"
  query         = query.vpc_configured_to_use_vpc_endpoints
  documentation = file("./foundational_security/docs/foundational_security_ec2_10.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_10"
    foundational_security_category = "api_private_access"
  })
}

control "foundational_security_ec2_15" {
  title         = "15 EC2 subnets should not automatically assign public IP addresses"
  description   = "This control checks whether the assignment of public IPs in Amazon Virtual Private Cloud (Amazon VPC) subnets have MapPublicIpOnLaunch set to FALSE. The control passes if the flag is set to FALSE."
  severity      = "medium"
  query         = query.vpc_subnet_auto_assign_public_ip_disabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_15.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_15"
    foundational_security_category = "network_security"
  })
}

control "foundational_security_ec2_16" {
  title         = "16 Unused network access control lists should be removed"
  description   = "This control checks whether there are any unused network access control lists (ACLs). The control checks the item configuration of the resource AWS::EC2::NetworkAcl and determines the relationships of the network ACL."
  severity      = "low"
  query         = query.vpc_network_acl_unused
  documentation = file("./foundational_security/docs/foundational_security_ec2_16.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_16"
    foundational_security_category = "network_security"
  })
}

control "foundational_security_ec2_17" {
  title         = "17 EC2 instances should not use multiple ENIs"
  description   = "This control checks whether an EC2 instance uses multiple Elastic Network Interfaces (ENIs) or Elastic Fabric Adapters (EFAs). This control passes if a single network adapter is used. The control includes an optional parameter list to identify the allowed ENIs."
  severity      = "low"
  query         = query.ec2_instance_not_use_multiple_enis
  documentation = file("./foundational_security/docs/foundational_security_ec2_17.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_17"
    foundational_security_category = "network_security"
  })
}

control "foundational_security_ec2_18" {
  title         = "18 Security groups should only allow unrestricted incoming traffic for authorized ports"
  description   = "This control checks whether the security groups that are in use allow unrestricted incoming traffic. Optionally the rule checks whether the port numbers are listed in the authorizedTcpPorts parameter. The default values for authorizedTcpPorts are 80 and 443."
  severity      = "high"
  query         = query.vpc_security_group_allows_ingress_authorized_ports
  documentation = file("./foundational_security/docs/foundational_security_ec2_18.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_18"
    foundational_security_category = "security_group_configuration"
  })
}

control "foundational_security_ec2_19" {
  title         = "19 Security groups should not allow unrestricted access to ports with high risk"
  description   = "This control checks whether unrestricted incoming traffic for the security groups is accessible to the specified ports that have the highest risk. This control passes when none of the rules in a security group allow ingress traffic from 0.0.0.0/0 for those ports."
  severity      = "medium"
  query         = query.vpc_security_group_restricted_common_ports
  documentation = file("./foundational_security/docs/foundational_security_ec2_19.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_19"
    foundational_security_category = "security_group_configuration"
  })
}

control "foundational_security_ec2_20" {
  title         = "20 Both VPN tunnels for an AWS Site-to-Site VPN connection should be up"
  description   = "This control checks that both VPN tunnels provided by AWS Site-to-Site VPN are in UP status. The control fails if one or both tunnels are in DOWN status."
  severity      = "medium"
  query         = query.vpc_vpn_tunnel_up
  documentation = file("./foundational_security/docs/foundational_security_ec2_20.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_20"
    foundational_security_category = "resilience"
  })
}

control "foundational_security_ec2_21" {
  title         = "21 Network ACLs should not allow ingress from 0.0.0.0/0 to port 22 or port 3389"
  description   = "This control checks if default ports for SSH/RDP ingress traffic for network access control lists (NACLs) is unrestricted. The rule fails if a NACL inbound entry allows a source CIDR block of '0.0.0.0/0' or '::/0' for ports 22 or 3389."
  severity      = "medium"
  query         = query.vpc_network_acl_remote_administration
  documentation = file("./foundational_security/docs/foundational_security_ec2_21.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_21"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_ec2_23" {
  title         = "23 EC2 Transit Gateways should not automatically accept VPC attachment requests"
  description   = "This control checks if EC2 Transit Gateways are automatically accepting shared VPC attachments. This control fails for a Transit Gateway that automatically accepts shared VPC attachment requests."
  severity      = "high"
  query         = query.ec2_transit_gateway_auto_cross_account_attachment_disabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_23.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_23"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_ec2_24" {
  title         = "24 Paravirtual EC2 instance types should not be used"
  description   = "This control checks whether the virtualization type of an EC2 instance is paravirtual. The control fails if the virtualizationType of the EC2 instance is set to paravirtual."
  severity      = "medium"
  query         = query.ec2_instance_virtualization_type_no_paravirtual
  documentation = file("./foundational_security/docs/foundational_security_ec2_24.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_24"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}

control "foundational_security_ec2_25" {
  title         = "25 Amazon EC2 launch templates should not assign public IPs to network interfaces"
  description   = "This control checks if Amazon EC2 launch templates are configured to assign public IP addresses to network interfaces upon launch. The control fails if an EC2 launch template is configured to assign a public IP address to network interfaces or if there is at least one network interface that has a public IP address."
  severity      = "high"
  query         = query.ec2_launch_template_not_publicly_accessible
  documentation = file("./foundational_security/docs/foundational_security_ec2_25.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_25"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_ec2_51" {
  title         = "51 EC2 Client VPN endpoints should have client connection logging enabled"
  description   = "This control checks whether an AWS Client VPN endpoint has client connection logging enabled. The control fails if the endpoint doesn't have client connection logging enabled."
  severity      = "low"
  query         = query.ec2_client_vpn_endpoint_client_connection_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_51.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_51"
    foundational_security_category = "logging"
  })
}

control "foundational_security_ec2_55" {
  title         = "55 VPCs should be configured with an interface endpoint for ECR API"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for Amazon ECR API. The control fails if the VPC doesn't have an interface VPC endpoint for ECR API. This control evaluates resources in a single account."
  severity      = "medium"
  query         = query.vpc_configured_to_use_interface_endpoint_for_ecr_api
  documentation = file("./foundational_security/docs/foundational_security_ec2_55.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_55"
    foundational_security_category = "access_control"
  })
}

control "foundational_security_ec2_56" {
  title         = "56 VPCs should be configured with an interface endpoint for Docker Registry"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for Docker Registry. The control fails if the VPC doesn't have an interface VPC endpoint for Docker Registry. This control evaluates resources in a single account."
  severity      = "medium"
  query         = query.vpc_configured_to_use_interface_endpoint_for_docker_registry
  documentation = file("./foundational_security/docs/foundational_security_ec2_56.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_56"
    foundational_security_category = "access_control"
  })
}

control "foundational_security_ec2_57" {
  title         = "57 VPCs should be configured with an interface endpoint for Systems Manager"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for AWS Systems Manager. The control fails if the VPC doesn't have an interface VPC endpoint for Systems Manager. This control evaluates resources in a single account."
  severity      = "medium"
  query         = query.vpc_configured_to_use_interface_endpoint_for_ssm
  documentation = file("./foundational_security/docs/foundational_security_ec2_57.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_57"
    foundational_security_category = "access_control"
  })
}

control "foundational_security_ec2_58" {
  title         = "58 VPCs should be configured with an interface endpoint for Systems Manager Incident Manager Contacts"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for AWS Systems Manager Incident Manager Contacts. The control fails if the VPC doesn't have an interface VPC endpoint for Systems Manager Incident Manager Contacts. This control evaluates resources in a single account."
  severity      = "medium"
  query         = query.vpc_configured_to_use_interface_endpoint_for_ssm_contacts
  documentation = file("./foundational_security/docs/foundational_security_ec2_58.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_58"
    foundational_security_category = "access_control"
  })
}

control "foundational_security_ec2_60" {
  title         = "60 VPCs should be configured with an interface endpoint for Systems Manager Incident Manager"
  description   = "This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for AWS Systems Manager Incident Manager. The control fails if the VPC doesn't have an interface VPC endpoint for Systems Manager Incident Manager. This control evaluates resources in a single account."
  severity      = "medium"
  query         = query.vpc_configured_to_use_interface_endpoint_for_ssm_incidents
  documentation = file("./foundational_security/docs/foundational_security_ec2_60.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_60"
    foundational_security_category = "access_control"
  })
}

control "foundational_security_ec2_170" {
  title         = "170 EC2 launch templates should use Instance Metadata Service Version 2 (IMDSv2)"
  description   = "This control checks whether an Amazon EC2 launch template is configured with Instance Metadata Service Version 2 (IMDSv2). The control fails if HttpTokens is set to optional."
  severity      = "low"
  query         = query.ec2_launch_template_default_version_uses_imdsv2
  documentation = file("./foundational_security/docs/foundational_security_ec2_170.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_170"
    foundational_security_category = "network_security"
  })
}

control "foundational_security_ec2_171" {
  title         = "171 EC2 VPN connections should have logging enabled"
  description   = "This control checks whether an AWS Site-to-Site VPN connection has Amazon CloudWatch Logs enabled for both tunnels. The control fails if a Site-to-Site VPN connection doesn't have CloudWatch Logs enabled for both tunnels."
  severity      = "medium"
  query         = query.vpc_vpn_connection_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_171.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_171"
    foundational_security_category = "logging"
  })
}

control "foundational_security_ec2_172" {
  title         = "172 EC2 VPC Block Public Access settings should block internet gateway traffic"
  description   = "This control checks whether Amazon EC2 VPC Block Public Access (BPA) settings are configured to block internet gateway traffic for all Amazon VPCs in the AWS account. The control fails if VPC BPA settings aren't configured to block internet gateway traffic. For the control to pass, the VPC BPA InternetGatewayBlockMode must be set to block-bidirectional or block-ingress. If the parameter vpcBpaInternetGatewayBlockMode is provided, the control passes only if the VPC BPA value for InternetGatewayBlockMode matches the parameter."
  severity      = "medium"
  query         = query.vpc_block_public_access_restrict_internet_gateway_traffic
  documentation = file("./foundational_security/docs/foundational_security_ec2_172.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_172"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_ec2_173" {
  title         = "173 EC2 Spot Fleet requests with launch parameters should enable encryption for attached EBS volumes"
  description   = "This control checks whether an Amazon EC2 Spot Fleet request that specifies launch parameters is configured to enable encryption for all Amazon Elastic Block Store (Amazon EBS) volumes attached to EC2 instances. The control fails if the Spot Fleet request specifies launch parameters and doesn't enable encryption for one or more EBS volumes specified in the request."
  severity      = "medium"
  query         = query.ec2_spot_fleet_request_with_launch_parameter_ebs_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_173.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_173"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_ec2_180" {
  title         = "180 EC2 network interfaces should have source/destination checking enabled"
  description   = "This control checks whether source/destination checking is enabled for an Amazon EC2 elastic network interface (ENI) that's managed by users. The control fails if source/destination checking is disabled for the user-managed ENI. This control checks only the following types of ENIs: aws_codestar_connections_managed, branch, efa, interface, lambda, and quicksight."
  severity      = "medium"
  query         = query.ec2_network_inteface_source_destination_check_enabled
  documentation = file("./foundational_security/docs/foundational_security_ec2_180.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_180"
    foundational_security_category = "network_security"
  })
}

control "foundational_security_ec2_181" {
  title         = "181 EC2 launch templates should enable encryption for attached EBS volumes"
  description   = "This control checks whether an Amazon EC2 launch template enables encryption for all attached EBS volumes. The control fails if the encryption parameter is set to False for any EBS volumes specified by the EC2 launch template."
  severity      = "medium"
  query         = query.ec2_launch_template_ebs_volume_encrypted
  documentation = file("./foundational_security/docs/foundational_security_ec2_181.md")

  tags = merge(local.foundational_security_ec2_common_tags, {
    foundational_security_item_id  = "ec2_181"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

