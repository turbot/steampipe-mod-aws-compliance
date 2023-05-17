locals {
  pci_dss_v321_requirement_1_common_tags = merge(local.pci_dss_v321_common_tags, {
    control_set = "1"
  })
}

benchmark "pci_dss_v321_requirement_1" {
  title       = "Requirement 1: Install and maintain a firewall configuration to protect cardholder data"
  description = "A firewall examines all network traffic and blocks those transmissions that do not meet the specified security criteria. All systems must be protected from unauthorized access from untrusted networks."

  children = [
    benchmark.pci_dss_v321_requirement_1_1,
    benchmark.pci_dss_v321_requirement_1_2,
    benchmark.pci_dss_v321_requirement_1_3
  ]

  tags = local.pci_dss_v321_requirement_1_common_tags
}

benchmark "pci_dss_v321_requirement_1_1" {
  title       = "1.1 Establish and implement firewall and router configuration standards"
  description = "Firewalls and routers are key components of the architecture that controls entry to and exit from the network. These devices are software or hardware devices that block unwanted access and manage authorized access into and out of the network. Configuration standards and procedures will help to ensure that the organization's first line of defense in the protection of its data remains strong."

  children = [
    benchmark.pci_dss_v321_requirement_1_1_4
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.1"
  })
}

benchmark "pci_dss_v321_requirement_1_1_4" {
  title       = "1.1.4 Requirements for a firewall at each Internet connection and between any demilitarized zone (DMZ) and the internal network zone"
  description = "Using a firewall on every Internet connection coming into (and out of) the network, and between any DMZ and the internal network, allows the organization to monitor and control access and minimizes the chances of a malicious individual obtaining access to the internal network via an unprotected connection."

  children = [
    benchmark.pci_dss_v321_requirement_1_1_4_c
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.1.4"
  })
}

benchmark "pci_dss_v321_requirement_1_1_4_c" {
  title       = "1.1.4.c Observe network configurations to verify that a firewall is in place at each Internet connection and between any demilitarized zone (DMZ) and the internal network zone, per the documented configuration standards and network diagrams"
  description = "Using a firewall on every Internet connection coming into (and out of) the network, and between any DMZ and the internal network, allows the organization to monitor and control access and minimizes the chances of a malicious individual obtaining access to the internal network via an unprotected connection."

  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.elb_application_lb_waf_enabled,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.1.4.c"
  })
}

benchmark "pci_dss_v321_requirement_1_2" {
  title       = "1.2 Examine firewall and router configurations and perform the following to verify that connections are restricted between untrusted networks and system components in the cardholder data environment"
  description = "It is essential to install network protection between the internal, trusted network and any untrusted network that is external and/or out of the entity's ability to control or manage. Failure to implement this measure correctly results in the entity being vulnerable to unauthorized access by malicious individuals or software. For firewall functionality to be effective, it must be properly configured to control and/or limit traffic into and out of the entity's network."

  children = [
    benchmark.pci_dss_v321_requirement_1_2_1,
    benchmark.pci_dss_v321_requirement_1_2_2,
    benchmark.pci_dss_v321_requirement_1_2_3
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2"
  })
}

benchmark "pci_dss_v321_requirement_1_2_1" {
  title       = "1.2.1 Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment, and specifically deny all other traffic"
  description = "Examination of all inbound and outbound connections allows for inspection and restriction of traffic based on the source and/or destination address, thus preventing unfiltered access between untrusted and trusted environments. This prevents malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner (for example, to send data they've obtained from within the entity's network out to an untrusted server). Implementing a rule that denies all inbound and outbound traffic that is not specifically needed helps to prevent inadvertent holes that would allow unintended and potentially harmful traffic in or out."

  children = [
    benchmark.pci_dss_v321_requirement_1_2_1_a,
    benchmark.pci_dss_v321_requirement_1_2_1_b,
    benchmark.pci_dss_v321_requirement_1_2_1_c
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2.1"
  })
}

benchmark "pci_dss_v321_requirement_1_2_1_a" {
  title       = "1.2.1.a Examine firewall and router configuration standards to verify that they identify inbound and outbound traffic necessary for the cardholder data environment"
  description = "Examination of all inbound and outbound connections allows for inspection and restriction of traffic based on the source and/or destination address, thus preventing unfiltered access between untrusted and trusted environments. This prevents malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner (for example, to send data they've obtained from within the entity's network out to an untrusted server). Implementing a rule that denies all inbound and outbound traffic that is not specifically needed helps to prevent inadvertent holes that would allow unintended and potentially harmful traffic in or out."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2.1.a"
  })
}

benchmark "pci_dss_v321_requirement_1_2_1_b" {
  title       = "1.2.1.b Examine firewall and router configurations to verify that inbound and outbound traffic is limited to that which is necessary for the cardholder data environment"
  description = "Examination of all inbound and outbound connections allows for inspection and restriction of traffic based on the source and/or destination address, thus preventing unfiltered access between untrusted and trusted environments. This prevents malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner (for example, to send data they've obtained from within the entity's network out to an untrusted server). Implementing a rule that denies all inbound and outbound traffic that is not specifically needed helps to prevent inadvertent holes that would allow unintended and potentially harmful traffic in or out."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2.1.b"
  })
}

benchmark "pci_dss_v321_requirement_1_2_1_c" {
  title       = "1.2.1.c Examine firewall and router configurations to verify that all other inbound and outbound traffic is specifically denied, for example by using an explicit “deny all” or an implicit deny after allow statement"
  description = "Examination of all inbound and outbound connections allows for inspection and restriction of traffic based on the source and/or destination address, thus preventing unfiltered access between untrusted and trusted environments. This prevents malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner (for example, to send data they've obtained from within the entity's network out to an untrusted server). Implementing a rule that denies all inbound and outbound traffic that is not specifically needed helps to prevent inadvertent holes that would allow unintended and potentially harmful traffic in or out."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2.1.c"
  })
}

benchmark "pci_dss_v321_requirement_1_2_2" {
  title       = "1.2.2 Secure and synchronize router configuration files"
  description = "While the running (or active) router configuration files include the current, secure settings, the start- up files (which are used when routers are re- started or booted) must be updated with the same secure settings to ensure these settings are applied when the start-up configuration is run. Because they only run occasionally, start-up configuration files are often forgotten and are not updated. When a router re-starts and loads a start-up configuration that has not been updated with the same secure settings as those in the running configuration, it may result in weaker rules that allow malicious individuals into the network."

  children = [
    benchmark.pci_dss_v321_requirement_1_2_2_b
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2.2"
  })
}

benchmark "pci_dss_v321_requirement_1_2_2_b" {
  title       = "1.2.2.b Examine router configurations to verify they are synchronized—for example, the running (or active) configuration matches the start-up configuration (used when machines are booted)"
  description = "While the running (or active) router configuration files include the current, secure settings, the start- up files (which are used when routers are re- started or booted) must be updated with the same secure settings to ensure these settings are applied when the start-up configuration is run. Because they only run occasionally, start-up configuration files are often forgotten and are not updated. When a router re-starts and loads a start-up configuration that has not been updated with the same secure settings as those in the running configuration, it may result in weaker rules that allow malicious individuals into the network."

  children = [
    control.cloudformation_stack_drift_detection_check
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2.2.b"
  })
}

benchmark "pci_dss_v321_requirement_1_2_3" {
  title       = "1.2.3 Install perimeter firewalls between all wireless networks and the cardholder data environment, and configure these firewalls to deny or, if traffic is necessary for business purposes, permit only authorized traffic between the wireless environment and the cardholder data environment"
  description = "The known (or unknown) implementation and exploitation of wireless technology within a network is a common path for malicious individuals to gain access to the network and cardholder data. If a wireless device or network is installed without the entity's knowledge, a malicious individual could easily and “invisibly” enter the network. If firewalls do not restrict access from wireless networks into the CDE, malicious individuals that gain unauthorized access to the wireless network can easily connect to the CDE and compromise account information. Firewalls must be installed between all wireless networks and the CDE, regardless of the purpose of the environment to which the wireless network is connected. This may include, but is not limited to, corporate networks, retail stores, guest networks, warehouse environments, etc."

  children = [
    benchmark.pci_dss_v321_requirement_1_2_3_b
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2.3"
  })
}

benchmark "pci_dss_v321_requirement_1_2_3_b" {
  title       = "1.2.3.b Verify that the firewalls deny or, if traffic is necessary for business purposes, permit only authorized traffic between the wireless environment and the cardholder data environment"
  description = "The known (or unknown) implementation and exploitation of wireless technology within a network is a common path for malicious individuals to gain access to the network and cardholder data. If a wireless device or network is installed without the entity's knowledge, a malicious individual could easily and “invisibly” enter the network. If firewalls do not restrict access from wireless networks into the CDE, malicious individuals that gain unauthorized access to the wireless network can easily connect to the CDE and compromise account information. Firewalls must be installed between all wireless networks and the CDE, regardless of the purpose of the environment to which the wireless network is connected. This may include, but is not limited to, corporate networks, retail stores, guest networks, warehouse environments, etc."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.2.3.b"
  })
}

benchmark "pci_dss_v321_requirement_1_3" {
  title       = "1.3 Examine firewall and router configurations—including but not limited to the choke router at the Internet, the DMZ router and firewall, the DMZ cardholder segment, the perimeter router, and the internal cardholder network segment—and perform the following to determine that there is no direct access between the Internet and system components in the internal cardholder network segment"
  description = "While there may be legitimate reasons for untrusted connections to be permitted to DMZ systems (e.g., to allow public access to a web server), such connections should never be granted to systems in the internal network. A firewall's intent is to manage and control all connections between public systems and internal systems, especially those that store, process or transmit cardholder data. If direct access is allowed between public systems and the CDE, the protections offered by the firewall are bypassed, and system components storing cardholder data may be exposed to compromise."

  children = [
    benchmark.pci_dss_v321_requirement_1_3_1,
    benchmark.pci_dss_v321_requirement_1_3_2,
    benchmark.pci_dss_v321_requirement_1_3_3,
    benchmark.pci_dss_v321_requirement_1_3_4,
    benchmark.pci_dss_v321_requirement_1_3_5,
    benchmark.pci_dss_v321_requirement_1_3_6,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.3"
  })
}

benchmark "pci_dss_v321_requirement_1_3_1" {
  title       = "1.3.1 Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports"
  description = "The DMZ is that part of the network that manages connections between the Internet (or other untrusted networks), and services that an organization needs to have available to the public (like a web server). This functionality is intended to prevent malicious individuals from accessing the organization's internal network from the Internet, or from using services, protocols, or ports in an unauthorized manner. The set of controls will examine firewall and router configurations to verify that a DMZ is implemented to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.3.1"
  })
}

benchmark "pci_dss_v321_requirement_1_3_2" {
  title       = "1.3.2 Limit inbound Internet traffic to IP addresses within the DMZ"
  description = "The DMZ is that part of the network that manages connections between the Internet (or other untrusted networks), and services that an organization needs to have available to the public (like a web server). This functionality is intended to prevent malicious individuals from accessing the organization's internal network from the Internet, or from using services, protocols, or ports in an unauthorized manner. The set of controls will limit inbound Internet traffic to IP addresses within the DMZ."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.3.2"
  })
}

benchmark "pci_dss_v321_requirement_1_3_3" {
  title       = "1.3.3 Examine firewall and router configurations to verify that anti-spoofing measures are implemented, for example internal addresses cannot pass from the Internet into the DMZ"
  description = "Normally a packet contains the IP address of the computer that originally sent it so other computers in the network know where the packet came from. Malicious individuals will often try to spoof (or imitate) the sending IP address so that the target system believes the packet is from a trusted source. Filtering packets coming into the network helps to, among other things, ensure packets are not “spoofed” to look like they are coming from an organization's own internal network."

  children = [
    control.autoscaling_launch_config_requires_imdsv2
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.3.3"
  })
}

benchmark "pci_dss_v321_requirement_1_3_4" {
  title       = "1.3.4 Do not allow unauthorized outbound traffic from the cardholder data environment to the Internet"
  description = "All traffic outbound from the cardholder data environment should be evaluated to ensure that it follows established, authorized rules. Connections should be inspected to restrict traffic to only authorized communications (for example by restricting source/destination addresses/ports, and/or blocking of content). The set of controls will examine firewall and router configurations to verify that outbound traffic from the cardholder data environment to the Internet is explicitly authorized."

  children = [
    control.autoscaling_launch_config_requires_imdsv2,
    control.dms_replication_instance_not_publicly_accessible,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.3.4"
  })
}

benchmark "pci_dss_v321_requirement_1_3_5" {
  title       = "1.3.5 Examine firewall and router configurations to verify that the firewall permits only established connections into the internal network and denies any inbound connections not associated with a previously established session"
  description = "A firewall that maintains the `state` (or the status) for each connection through the firewall knows whether an apparent response to a previous connection is actually a valid, authorized response (since it retains each connection's status) or is malicious traffic trying to trick the firewall into allowing the connection."

  children = [
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.3.5"
  })
}

benchmark "pci_dss_v321_requirement_1_3_6" {
  title       = "1.3.6 Examine firewall and router configurations to verify that system components that store cardholder data are on an internal network zone, segregated from the DMZ and other untrusted networks"
  description = "If cardholder data is located within the DMZ, it is easier for an external attacker to access this information, since there are fewer layers to penetrate. Securing system components that store cardholder data (such as a database) in an internal network zone that is segregated from the DMZ and other untrusted networks by a firewall can prevent unauthorized network traffic from reaching the system component."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.es_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled
  ]

  tags = merge(local.pci_dss_v321_requirement_1_common_tags, {
    pci_dss_v321_item_id = "1.3.6"
  })
}
