locals {
  audit_manager_pci_v321_requirement_1_common_tags = merge(local.audit_manager_pci_v321_common_tags, {
    control_set = "pci_v321_requirement_1"
  })
}

benchmark "audit_manager_pci_v321_requirement_1" {
  title       = "Requirement 1: Install and maintain a firewall configuration to protect cardholder data"
  description = ""

  children = [
    benchmark.audit_manager_pci_v321_requirement_1_1,
    benchmark.audit_manager_pci_v321_requirement_1_2,
    benchmark.audit_manager_pci_v321_requirement_1_3
  ]

  tags = local.audit_manager_pci_v321_requirement_1_common_tags
}

benchmark "audit_manager_pci_v321_requirement_1_1" {
  title       = "1.1 Establish and implement firewall and router configuration standards that include the following"
  description = "Firewalls and routers are key components of the architecture that controls entry to and exit from the network. These devices are software or hardware devices that block unwanted access and manage authorized access into and out of the network. Configuration standards and procedures will help to ensure that the organization's first line of defense in the protection of its data remains strong."

  children = [
    benchmark.audit_manager_pci_v321_requirement_1_1_4,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.1"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_1_4" {
  title         = "1.1.4 Requirements for a firewall at each Internet connection and between any demilitarized zone (DMZ) and the internal network zone"
  description   = "Using a firewall on every Internet connection coming into (and out of) the network, and between any DMZ and the internal network, allows the organization to monitor and control access and minimizes the chances of a malicious individual obtaining access to the internal network via an unprotected connection."

  children = [
    benchmark.audit_manager_pci_v321_requirement_1_1_4_c
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.1.4"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_1_4_c" {
  title       = "1.1.4.c Observe network configurations to verify that a firewall is in place at each Internet connection and between any demilitarized zone (DMZ) and the internal network zone, per the documented configuration standards and network diagrams"
  description = "Using a firewall on every Internet connection coming into (and out of) the network, and between any DMZ and the internal network, allows the organization to monitor and control access and minimizes the chances of a malicious individual obtaining access to the internal network via an unprotected connection."

  children = [
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.apigateway_stage_use_waf_web_acl,
    control.elb_application_lb_waf_enabled,
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.1.4c"
    audit_manager_pci_v321_requirement_type    = "automated"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2" {
  title       = "1.2 Examine firewall and router configurations and perform the following to verify that connections are restricted between untrusted networks and system components in the cardholder data environment"
  description = "It is essential to install network protection between the internal, trusted network and any untrusted network that is external and/or out of the entity’s ability to control or manage. Failure to implement this measure correctly results in the entity being vulnerable to unauthorized access by malicious individuals or software. For firewall functionality to be effective, it must be properly configured to control and/or limit traffic into and out of the entity's network."

  children = [
    benchmark.audit_manager_pci_v321_requirement_1_2_1,
    benchmark.audit_manager_pci_v321_requirement_1_2_2,
    benchmark.audit_manager_pci_v321_requirement_1_2_3,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2_1" {
  title       = "1.2.1 Restrict inbound and outbound traffic to that which is necessary for the cardholder data environment, and specifically deny all other traffic"
  description = "Examination of all inbound and outbound connections allows for inspection and restriction of traffic based on the source and/or destination address, thus preventing unfiltered access between untrusted and trusted environments. This prevents malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner (for example, to send data they've obtained from within the entity's network out to an untrusted server). Implementing a rule that denies all inbound and outbound traffic that is not specifically needed helps to prevent inadvertent holes that would allow unintended and potentially harmful traffic in or out."

  children = [
    benchmark.audit_manager_pci_v321_requirement_1_2_1_a,
    benchmark.audit_manager_pci_v321_requirement_1_2_1_b,
    benchmark.audit_manager_pci_v321_requirement_1_2_1_c,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2.1"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2_1_a" {
  title       = "1.2.1.a Examine firewall and router configuration standards to verify that they identify inbound and outbound traffic necessary for the cardholder data environment"
  description = "Examination of all inbound and outbound connections allows for inspection and restriction of traffic based on the source and/or destination address, thus preventing unfiltered access between untrusted and trusted environments. This prevents malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner (for example, to send data they've obtained from within the entity's network out to an untrusted server). Implementing a rule that denies all inbound and outbound traffic that is not specifically needed helps to prevent inadvertent holes that would allow unintended and potentially harmful traffic in or out."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.vpc_default_security_group_restricts_all_traffic,
    control.es_domain_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.lambda_function_in_vpc,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_igw_attached_to_authorized_vpc,
    control.autoscaling_launch_config_public_ip_disabled,
    control.vpc_network_acl_remote_administration
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2.1_a"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2_1_b" {
  title       = "1.2.1.b Examine firewall and router configurations to verify that inbound and outbound traffic is limited to that which is necessary for the cardholder data environment"
  description = "Examination of all inbound and outbound connections allows for inspection and restriction of traffic based on the source and/or destination address, thus preventing unfiltered access between untrusted and trusted environments. This prevents malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner (for example, to send data they've obtained from within the entity's network out to an untrusted server). Implementing a rule that denies all inbound and outbound traffic that is not specifically needed helps to prevent inadvertent holes that would allow unintended and potentially harmful traffic in or out."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.vpc_default_security_group_restricts_all_traffic,
    control.es_domain_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.lambda_function_in_vpc,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_igw_attached_to_authorized_vpc,
    control.autoscaling_launch_config_public_ip_disabled,
    control.vpc_network_acl_remote_administration
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2.1_b"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2_1_c" {
  title       = "1.2.1.c Examine firewall and router configurations to verify that all other inbound and outbound traffic is specifically denied, for example by using an explicit “deny all” or an implicit deny after allow statement"
  description = "Examination of all inbound and outbound connections allows for inspection and restriction of traffic based on the source and/or destination address, thus preventing unfiltered access between untrusted and trusted environments. This prevents malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner (for example, to send data they've obtained from within the entity's network out to an untrusted server). Implementing a rule that denies all inbound and outbound traffic that is not specifically needed helps to prevent inadvertent holes that would allow unintended and potentially harmful traffic in or out."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.vpc_default_security_group_restricts_all_traffic,
    control.es_domain_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.lambda_function_in_vpc,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_igw_attached_to_authorized_vpc,
    control.autoscaling_launch_config_public_ip_disabled,
    control.vpc_network_acl_remote_administration
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2.1_c"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2_2" {
  title       = "1.2.2 Secure and synchronize router configuration files"
  description = "While the running (or active) router configuration files include the current, secure settings, the start- up files (which are used when routers are re- started or booted) must be updated with the same secure settings to ensure these settings are applied when the start-up configuration is run. Because they only run occasionally, start-up configuration files are often forgotten and are not updated. When a router re-starts and loads a start-up configuration that has not been updated with the same secure settings as those in the running configuration, it may result in weaker rules that allow malicious individuals into the network."

  children = [
    benchmark.audit_manager_pci_v321_requirement_1_2_2_b
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2.2"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2_2_b" {
  title       = "1.2.2.b Examine router configurations to verify they are synchronized—for example, the running (or active) configuration matches the start-up configuration (used when machines are booted)"
  description = "While the running (or active) router configuration files include the current, secure settings, the start- up files (which are used when routers are re- started or booted) must be updated with the same secure settings to ensure these settings are applied when the start-up configuration is run. Because they only run occasionally, start-up configuration files are often forgotten and are not updated. When a router re-starts and loads a start-up configuration that has not been updated with the same secure settings as those in the running configuration, it may result in weaker rules that allow malicious individuals into the network."

  children = [
    control.cloudformation_stack_drift_detection_check
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2.2_b"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2_3" {
  title       = "1.2.3 Install perimeter firewalls between all wireless networks and the cardholder data environment, and configure these firewalls to deny or, if traffic is necessary for business purposes, permit only authorized traffic between the wireless environment and the cardholder data environment"
  description = "The known (or unknown) implementation and exploitation of wireless technology within a network is a common path for malicious individuals to gain access to the network and cardholder data. If a wireless device or network is installed without the entity’s knowledge, a malicious individual could easily and “invisibly” enter the network. If firewalls do not restrict access from wireless networks into the CDE, malicious individuals that gain unauthorized access to the wireless network can easily connect to the CDE and compromise account information. Firewalls must be installed between all wireless networks and the CDE, regardless of the purpose of the environment to which the wireless network is connected. This may include, but is not limited to, corporate networks, retail stores, guest networks, warehouse environments, etc."

  children = [
    benchmark.audit_manager_pci_v321_requirement_1_2_3_b
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2.3"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_2_3_b" {
  title       = "1.2.3.b Verify that the firewalls deny or, if traffic is necessary for business purposes, permit only authorized traffic between the wireless environment and the cardholder data environment"
  description = "The known (or unknown) implementation and exploitation of wireless technology within a network is a common path for malicious individuals to gain access to the network and cardholder data. If a wireless device or network is installed without the entity’s knowledge, a malicious individual could easily and “invisibly” enter the network. If firewalls do not restrict access from wireless networks into the CDE, malicious individuals that gain unauthorized access to the wireless network can easily connect to the CDE and compromise account information. Firewalls must be installed between all wireless networks and the CDE, regardless of the purpose of the environment to which the wireless network is connected. This may include, but is not limited to, corporate networks, retail stores, guest networks, warehouse environments, etc."

  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_igw_attached_to_authorized_vpc,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_network_acl_remote_administration
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.2.3_b"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_3" {
  title       = "1.3 Examine firewall and router configurations—including but not limited to the choke router at the Internet, the DMZ router and firewall, the DMZ cardholder segment, the perimeter router, and the internal cardholder network segment—and perform the following to determine that there is no direct access between the Internet and system components in the internal cardholder network segment"
  description = "While there may be legitimate reasons for untrusted connections to be permitted to DMZ systems (e.g., to allow public access to a web server), such connections should never be granted to systems in the internal network. A firewall's intent is to manage and control all connections between public systems and internal systems, especially those that store, process or transmit cardholder data. If direct access is allowed between public systems and the CDE, the protections offered by the firewall are bypassed, and system components storing cardholder data may be exposed to compromise."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.es_domain_in_vpc,
    control.emr_cluster_master_nodes_no_public_ip,
    control.ec2_instance_in_vpc,
    control.vpc_igw_attached_to_authorized_vpc,
    control.lambda_function_restrict_public_access,
    control.lambda_function_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_public_access_block_bucket_account,
    control.s3_bucket_restrict_public_read_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_endpoint_service_acceptance_required_enabled,
    control.eks_cluster_endpoint_restrict_public_access,
    benchmark.audit_manager_pci_v321_requirement_1_3_1,
    // benchmark.audit_manager_pci_v321_requirement_1_3_1,
    benchmark.audit_manager_pci_v321_requirement_1_3_2,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.3"
  })
}

benchmark "audit_manager_pci_v321_requirement_1_3_1" {
  title       = "1.3.1 Examine firewall and router configurations to verify that a DMZ is implemented to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports"
  description = "The DMZ is that part of the network that manages connections between the Internet (or other untrusted networks), and services that an organization needs to have available to the public (like a web server). This functionality is intended to prevent malicious individuals from accessing the organization's internal network from the Internet, or from using services, protocols, or ports in an unauthorized manner."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.es_domain_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.autoscaling_launch_config_public_ip_disabled,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.lambda_function_in_vpc,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.3.1"
  })
}

// benchmark "audit_manager_pci_v321_requirement_1_3_1" {
//   title       = "1.3.1 Implement a DMZ to limit inbound traffic to only system components that provide authorized publicly accessible services, protocols, and ports"
//   description = "The DMZ is that part of the network that manages connections between the Internet (or other untrusted networks), and services that an organization needs to have available to the public (like a web server). This functionality is intended to prevent malicious individuals from accessing the organization's internal network from the Internet, or from using services, protocols, or ports in an unauthorized manner."

//   children = [
//     control.dms_replication_instance_not_publicly_accessible,
//     control.ebs_snapshot_not_publicly_restorable,
//     control.es_domain_in_vpc,
//     control.lambda_function_restrict_public_access,
//     control.rds_db_snapshot_prohibit_public_access,
//     control.rds_db_instance_prohibit_public_access,
//     control.redshift_cluster_prohibit_public_access,
//     control.s3_bucket_restrict_public_write_access,
//     control.s3_public_access_block_bucket_account,
//     control.sagemaker_notebook_instance_direct_internet_access_disabled,
//     control.vpc_security_group_restrict_ingress_ssh_all,
//     control.lambda_function_in_vpc,
//   ]
//   tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
//     audit_manager_pci_v321_item_id = "1.3.1"
//   })
// }

benchmark "audit_manager_pci_v321_requirement_1_3_2" {
  title       = "1.3.2 Examine firewall and router configurations to verify that inbound Internet traffic is limited to IP addresses within the DMZ"
  description = "The DMZ is that part of the network that manages connections between the Internet (or other untrusted networks), and services that an organization needs to have available to the public (like a web server). This functionality is intended to prevent malicious individuals from accessing the organization's internal network from the Internet, or from using services, protocols, or ports in an unauthorized manner."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.es_domain_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.lambda_function_in_vpc,
    control.autoscaling_launch_config_public_ip_disabled,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_1_common_tags, {
    audit_manager_pci_v321_item_id = "1.3.1"
  })
}