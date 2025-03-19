locals {
  pci_dss_v400_requirement_1_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "1"
  })
}

benchmark "pci_dss_v400_requirement_1" {
  title = "Requirement 1: Install and Maintain Network Security Controls (19)"

  children = [
    benchmark.pci_dss_v400_requirement_1_2,
    benchmark.pci_dss_v400_requirement_1_3
  ]

  tags = local.pci_dss_v400_requirement_1_common_tags
}

benchmark "pci_dss_v400_requirement_1_2" {
  title = "1.2: Install and Maintain Network Security Controls"

  children = [
    benchmark.pci_dss_v400_requirement_1_2_5,
    benchmark.pci_dss_v400_requirement_1_2_8
  ]


  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.2"
  })
}

benchmark "pci_dss_v400_requirement_1_2_5" {
  title       = "1.2.5: Network security controls (NSCs) are configured and maintained."
  description = "All services, protocols and ports allowed are identified, approved, and have a defined business need."

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
  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.2.5"
  })
}

benchmark "pci_dss_v400_requirement_1_2_8" {
  title       = "1.2.8: Network security controls (NSCs) are configured and maintained."
  description = "Configuration files for NSCs are: Secured from unauthorized access. Kept consistent with active network configurations. Applicability Notes Any file or setting used to configure or synchronize NSCs is considered to be a configuration file. This includes files, automated and system-based controls, scripts, settings, infrastructure as code, or other parameters that are backed up, archived, or stored remotely."

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
  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.2.8"
  })
}

benchmark "pci_dss_v400_requirement_1_3" {
  title = "1.3: Install and Maintain Network Security Controls"

  children = [
    benchmark.pci_dss_v400_requirement_1_3_1,
    benchmark.pci_dss_v400_requirement_1_3_2
  ]

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.3"
  })
}

benchmark "pci_dss_v400_requirement_1_3_1" {
  title       = "1.3.1: Network access to and from the cardholder data environment is restricted."
  description = "Inbound traffic to the CDE is restricted as follows: To only traffic that is necessary. All other traffic is specifically denied."

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

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.3.1"
  })
}

benchmark "pci_dss_v400_requirement_1_3_2" {
  title       = "1.3.2: Network access to and from the cardholder data environment is restricted."
  description = "Outbound traffic from the CDE is restricted as follows: To only traffic that is necessary. All other traffic is specifically denied."


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

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.3.2"
  })
}

benchmark "pci_dss_v400_requirement_1_4" {
  title = "1.4: Install and Maintain Network Security Controls"

  children = [
    benchmark.pci_dss_v400_requirement_1_4_1,
    benchmark.pci_dss_v400_requirement_1_4_2,
    benchmark.pci_dss_v400_requirement_1_4_3,
    benchmark.pci_dss_v400_requirement_1_4_4,
    benchmark.pci_dss_v400_requirement_1_4_5
  ]

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.4"
  })
}

benchmark "pci_dss_v400_requirement_1_4_1" {
  title       = "1.4.1: Network connections between trusted and untrusted networks are controlled."
  description = "NSCs are implemented between trusted and untrusted networks."

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

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.4.1"
  })
}

benchmark "pci_dss_v400_requirement_1_4_2" {
  title       = "1.4.2: Network connections between trusted and untrusted networks are controlled."
  description = "Inbound traffic from untrusted networks to trusted networks is restricted to: Communications with system components that are authorized to provide publicly accessible services, protocols, and ports. Stateful responses to communications initiated by system components in a trusted network. All other traffic is denied. Applicability Notes The intent of this requirement is to address communication sessions between trusted and untrusted networks, rather than the specifics of protocols. This requirement does not limit the use of UDP or other connectionless network protocols if state is maintained by the NSC."

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

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.4.2"
  })
}

benchmark "pci_dss_v400_requirement_1_4_3" {
  title       = "1.4.3: Network connections between trusted and untrusted networks are controlled."
  description = "Anti-spoofing measures are implemented to detect and block forged source IP addresses from entering the trusted network."

  children = [
    control.networkfirewall_firewall_policy_default_stateless_action_check_fragmented_packets,
    control.networkfirewall_firewall_policy_default_stateless_action_check_full_packets,
    control.networkfirewall_firewall_policy_rule_group_not_empty
  ]

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.4.3"
  })
}

benchmark "pci_dss_v400_requirement_1_4_4" {
  title       = "1.4.4: Network connections between trusted and untrusted networks are controlled."
  description = "System components that store cardholder data are not directly accessible from untrusted networks. Applicability Notes This requirement is not intended to apply to storage of account data in volatile memory but does apply where memory is being treated as persistent storage (for example, RAM disk). Account data can only be stored in volatile memory during the time necessary to support the associated business process (for example, until completion of the related payment card transaction)."

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

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.4.1"
  })
}

benchmark "pci_dss_v400_requirement_1_4_5" {
  title       = "1.4.5: Network connections between trusted and untrusted networks are controlled."
  description = "Publicly accessible services are protected by NSCs."

  children = [
    control.ec2_launch_template_not_publicly_accessible,
    control.ecs_task_definition_no_host_pid_mode
  ]

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.4.5"
  })
}

benchmark "pci_dss_v400_requirement_1_5" {
  title = "1.5: Install and Maintain Network Security Controls"

  children = [
    benchmark.pci_dss_v400_requirement_1_5_1
  ]

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.5"
  })
}

benchmark "pci_dss_v400_requirement_1_5_1" {
  title       = "1.5.1: Risks to the CDE from computing devices that are able to connect to both untrusted networks and the CDE are mitigated."
  description = "Security controls are implemented on any computing devices, including company- and employee-owned devices, that connect to both untrusted networks (including the Internet) and the CDE as follows. Specific configuration settings are defined to prevent threats being introduced into the entity's network. Security controls are actively running. Security controls are not alterable by users of the computing devices unless specifically documented and authorized by management on a case-by-case basis for a limited period. Applicability Notes These security controls may be temporarily disabled only if there is legitimate technical need, as authorized by management on a case-by-case basis. If these security controls need to be disabled for a specific purpose, it must be formally authorized. Additional security measures may also need to be implemented for the period during which these security controls are not active. This requirement applies to employee-owned and company-owned computing devices. Systems that cannot be managed by corporate policy introduce weaknesses and provide opportunities that malicious individuals may exploit."

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

  tags = merge(local.pci_dss_v400_requirement_1_common_tags, {
    pci_dss_v400_item_id = "1.5.1"
  })
}
