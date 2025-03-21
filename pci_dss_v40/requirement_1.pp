locals {
  pci_dss_v40_requirement_1_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "1"
  })
}

benchmark "pci_dss_v40_requirement_1" {
  title       = "Requirement 1: Install and Maintain Network Security Controls"
  description = "Network security controls (NSCs), such as firewalls and other network security technologies, are network policy enforcement points that typically control network traffic between two or more logical or physical network segments (or subnets) based on pre-defined policies or rules."

  children = [
    benchmark.pci_dss_v40_requirement_1_2,
    benchmark.pci_dss_v40_requirement_1_3,
    benchmark.pci_dss_v40_requirement_1_4,
    benchmark.pci_dss_v40_requirement_1_5
  ]

  tags = local.pci_dss_v40_requirement_1_common_tags
}

benchmark "pci_dss_v40_requirement_1_2" {
  title       = "1.2: Network security controls (NSCs) are configured and maintained"
  description = "Network configurations, policies, and their supporting processes are defined and implemented to meet security requirements."

  children = [
    benchmark.pci_dss_v40_requirement_1_2_5,
    benchmark.pci_dss_v40_requirement_1_2_8
  ]


  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.2"
  })
}

benchmark "pci_dss_v40_requirement_1_2_5" {
  title       = "1.2.5: All services, protocols, and ports allowed are identified, approved, and have a defined business need"
  description = "Compromises often happen due to unused or insecure services (for example, telnet and FTP), protocols, and ports, since these can lead to unnecessary points of access being opened into the CDE. Additionally, services, protocols, and ports that are enabled but not in use are often overlooked and left unsecured and unpatched."

  children = [
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudfront_distribution_sni_enabled,
    control.cloudfront_distribution_use_secure_cipher,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_kerberos_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.opensearch_domain_https_required,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]
  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.2.5"
  })
}

benchmark "pci_dss_v40_requirement_1_2_8" {
  title       = "1.2.8: Configuration files for NSCs are secured from unauthorized access and are kept consistent with active network configurations"
  description = "To prevent unauthorized configurations from being applied to the network, stored files with configurations for network controls need to be kept up to date and secured against unauthorized changes."

  children = [
    control.api_gatewayv2_route_authorization_type_configured,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.cloudfront_distribution_waf_enabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.eks_cluster_endpoint_restrict_public_access,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.emr_account_public_access_blocked,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.log_metric_filter_network_gateway,
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_network_acl_unused,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_rule_attached
  ]
  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.2.8"
  })
}

benchmark "pci_dss_v40_requirement_1_3" {
  title       = "1.3 Network access to and from the cardholder data environment is restricted"

  children = [
    benchmark.pci_dss_v40_requirement_1_3_1,
    benchmark.pci_dss_v40_requirement_1_3_2
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.3"
  })
}

benchmark "pci_dss_v40_requirement_1_3_1" {
  title       = "1.3.1: Inbound traffic to the CDE is restricted as follows: To only traffic that is necessary, All other traffic is specifically denied"
  description = "This requirement aims to prevent malicious individuals from accessing the entity's network via unauthorized IP addresses or from using services, protocols, or ports in an unauthorized manner."

  children = [
    control.api_gatewayv2_route_authorization_type_configured,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_use_waf_web_acl,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.cloudfront_distribution_waf_enabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ec2_instance_in_vpc,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.eks_cluster_endpoint_restrict_public_access,
    control.elasticache_cluster_no_default_subnet_group,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.emr_account_public_access_blocked,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_network_acl_unused,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_vpn_tunnel_up,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_rule_attached
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.3.1"
  })
}

benchmark "pci_dss_v40_requirement_1_3_2" {
  title       = "1.3.2: Outbound traffic from the CDE is restricted as follows: To only traffic that is necessary, All other traffic is specifically denied"
  description = "This requirement aims to prevent malicious individuals and compromised system components within the entity's network from communicating with an untrusted external host."
  children = [
    control.api_gatewayv2_route_authorization_type_configured,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_use_waf_web_acl,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.cloudfront_distribution_waf_enabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ec2_instance_in_vpc,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.eks_cluster_endpoint_restrict_public_access,
    control.elasticache_cluster_no_default_subnet_group,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.emr_account_public_access_blocked,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_network_acl_unused,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_vpn_tunnel_up,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_rule_attached
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.3.2"
  })
}

benchmark "pci_dss_v40_requirement_1_4" {
  title       = "1.4: Network connections between trusted and untrusted networks are controlled"

  children = [
    benchmark.pci_dss_v40_requirement_1_4_1,
    benchmark.pci_dss_v40_requirement_1_4_2,
    benchmark.pci_dss_v40_requirement_1_4_3,
    benchmark.pci_dss_v40_requirement_1_4_4,
    benchmark.pci_dss_v40_requirement_1_4_5
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.4"
  })
}

benchmark "pci_dss_v40_requirement_1_4_1" {
  title       = "1.4.1: NSCs are implemented between trusted and untrusted networks"
  description = "Implementing NSCs at every connection coming into and out of trusted networks allows the entity to monitor and control access and minimizes the chances of a malicious individual obtaining access to the internal network via an unprotected connection."

  children = [
    control.api_gatewayv2_route_authorization_type_configured,
    control.apigateway_stage_use_waf_web_acl,
    control.ec2_instance_in_vpc,
    control.elasticache_cluster_no_default_subnet_group,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_vpn_tunnel_up
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.4.1"
  })
}

benchmark "pci_dss_v40_requirement_1_4_2" {
  title       = "1.4.2: Inbound traffic from untrusted networks to trusted networks is restricted"
  description = "Ensuring that public access to a system component is specifically authorized reduces the risk of system components being unnecessarily exposed to untrusted networks."

  children = [
    control.api_gatewayv2_route_authorization_type_configured,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_use_waf_web_acl,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.cloudfront_distribution_waf_enabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.eks_cluster_endpoint_restrict_public_access,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.emr_account_public_access_blocked,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_network_acl_unused,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_vpn_tunnel_up,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_rule_attached
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.4.2"
  })
}

benchmark "pci_dss_v40_requirement_1_4_3" {
  title       = "1.4.3 Anti-spoofing measures are implemented to detect and block forged source IP addresses from entering the trusted network"
  description = "Filtering packets coming into the trusted network helps to, among other things, ensure packets are not “spoofed” to appear as if they are coming from an organization's own internal network. For example, anti-spoofing measures prevent internal addresses originating from the Internet from passing into the DMZ."

  children = [
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_default_stateless_action_check_full_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.4.3"
  })
}

benchmark "pci_dss_v40_requirement_1_4_4" {
  title       = "1.4.4: System components that store cardholder data are not directly accessible from untrusted networks"
  description = "Cardholder data that is directly accessible from an untrusted network, for example, because it is stored on a system within the DMZ or in a cloud database service, is easier for an external attacker to access because there are fewer defensive layers to penetrate. Using NSCs to ensure that system components that store cardholder data (such as a database or a file) can only be directly accessed from trusted networks can prevent unauthorized network traffic from reaching the system component."

  children = [
    control.api_gatewayv2_route_authorization_type_configured,
    control.apigateway_stage_use_waf_web_acl,
    control.ec2_instance_in_vpc,
    control.elasticache_cluster_no_default_subnet_group,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_vpn_tunnel_up
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.4.1"
  })
}

benchmark "pci_dss_v40_requirement_1_4_5" {
  title       = "1.4.5 The disclosure of internal IP addresses and routing information is limited to only authorized parties"
  description = "Restricting the disclosure of internal, private, and local IP addresses is useful to prevent a hacker from obtaining knowledge of these IP addresses and using that information to access the network."

  children = [
    control.ec2_launch_template_not_publicly_accessible,
    control.ecs_task_definition_no_host_pid_mode
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.4.5"
  })
}

benchmark "pci_dss_v40_requirement_1_5" {
  title       = "1.5 Risks to the CDE from computing devices that are able to connect to both untrusted networks and the CDE are mitigated"

  children = [
    benchmark.pci_dss_v40_requirement_1_5_1
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.5"
  })
}

benchmark "pci_dss_v40_requirement_1_5_1" {
  title       = "1.5.1 Security controls are implemented on any computing devices, including company- and employee-owned devices, that connect to both untrusted networks"
  description = "Computing devices that are allowed to connect to the Internet from outside the corporate environment—for example, desktops, laptops, tablets, smartphones, and other mobile computing devices used by employees—are more vulnerable to Internet-based threats."

  children = [
    control.api_gatewayv2_route_authorization_type_configured,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.cloudfront_distribution_waf_enabled,
    control.codebuild_project_source_repo_oauth_configured,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.eks_cluster_endpoint_restrict_public_access,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.emr_account_public_access_blocked,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty,
    control.networkfirewall_stateless_rule_group_not_empty,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.sagemaker_notebook_instance_in_vpc,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_network_acl_remote_administration,
    control.vpc_network_acl_unused,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_rule_attached
  ]

  tags = merge(local.pci_dss_v40_requirement_1_common_tags, {
    pci_dss_v40_item_id = "1.5.1"
  })
}
