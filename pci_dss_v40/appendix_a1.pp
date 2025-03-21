locals {
  pci_dss_v40_appendix_a1_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "A1"
  })
}

benchmark "pci_dss_v40_appendix_a1" {
  title       = "Appendix A1: Additional PCI DSS Requirements for Multi-Tenant Service Providers"
  description = "All service providers are responsible for meeting PCI DSS requirements for their own environments as applicable to the services offered to their customers. In addition, multi-tenant service providers must meet the requirements in this Appendix."

  children = [
    benchmark.pci_dss_v40_appendix_a1_1,
    benchmark.pci_dss_v40_appendix_a1_2,
  ]

  tags = local.pci_dss_v40_appendix_a1_common_tags
}

benchmark "pci_dss_v40_appendix_a1_1" {
  title       = "A1.1: Multi-tenant service providers protect and separate all customer environments and data"

  children = [
    benchmark.pci_dss_v40_appendix_a1_1_2,
    benchmark.pci_dss_v40_appendix_a1_1_3
  ]

  tags = merge(local.pci_dss_v40_appendix_a1_common_tags, {
    pci_dss_v40_item_id = "A1.1"
  })
}

benchmark "pci_dss_v40_appendix_a1_1_2" {
  title       = "A1.1.2: Controls are implemented such that each customer only has permission to access its own cardholder data and CDE"
  description = "It is important that a multi-tenant service provider define controls so that each customer can only access their own environment and CDE to prevent unauthorized access from one customer's environment to another."

  children = [
    control.backup_recovery_point_manual_deletion_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.docdb_cluster_snapshot_restrict_public_access,
    control.ebs_snapshot_not_publicly_restorable,
    control.ecs_task_definition_container_readonly_root_filesystem,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.emr_account_public_access_blocked,
    control.lambda_function_restrict_public_access,
    control.neptune_db_cluster_snapshot_prohibit_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_access_point_restrict_public_access,
    control.s3_bucket_mfa_delete_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access
  ]

  tags = merge(local.pci_dss_v40_appendix_a1_common_tags, {
    pci_dss_v40_item_id = "A1.1.2"
  })
}

benchmark "pci_dss_v40_appendix_a1_1_3" {
  title       = "A1.1.3: Controls are implemented such that each customer can only access resources allocated to them"
  description = "To prevent any inadvertent or intentional impact to other customers' environments or account data, it is important that each customer can access only resources allocated to that customer."

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

  tags = merge(local.pci_dss_v40_appendix_a1_common_tags, {
    pci_dss_v40_item_id = "A1.1.3"
  })
}

benchmark "pci_dss_v40_appendix_a1_2" {
  title       = "A1.2: 2 Multi-tenant service providers facilitate logging and incident response for all customers"
  description = "Log information is useful for detecting and troubleshooting security incidents and is invaluable for forensic investigations. Customers therefore need to have access to these logs."

  children = [
    benchmark.pci_dss_v40_appendix_a1_2_1,
    benchmark.pci_dss_v40_appendix_a1_2_3,
  ]

  tags = merge(local.pci_dss_v40_appendix_a1_common_tags, {
    pci_dss_v40_item_id = "A1.2"
  })
}

benchmark "pci_dss_v40_appendix_a1_2_1" {
  title       = "A1.2.1: Audit log capability is enabled for each customer's environment that is consistent"
  description = "Log information is useful for detecting and troubleshooting security incidents and is invaluable for forensic investigations. Customers therefore need to have access to these logs."

  children = [
    control.apigateway_rest_api_stage_xray_tracing_enabled,
    control.apigateway_stage_logging_enabled,
    control.appsync_graphql_api_field_level_logging_enabled,
    control.cloudfront_distribution_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_security_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.codebuild_project_logging_enabled,
    control.dms_replication_task_source_database_logging_enabled,
    control.dms_replication_task_target_database_logging_enabled,
    control.ec2_client_vpn_endpoint_client_connection_logging_enabled,
    control.ecs_task_definition_logging_enabled,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.gatewayv2_stage_access_logging_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.neptune_db_cluster_audit_logging_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.rds_db_cluster_aurora_mysql_audit_logging_enabled,
    control.rds_db_cluster_events_subscription,
    control.rds_db_instance_events_subscription,
    control.rds_db_instance_logging_enabled,
    control.rds_db_parameter_group_events_subscription,
    control.rds_db_security_group_events_subscription,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.s3_public_access_block_bucket,
    control.sfn_state_machine_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v40_appendix_a1_common_tags, {
    pci_dss_v40_item_id = "A1.2.1"
  })
}

benchmark "pci_dss_v40_appendix_a1_2_3" {
  title       = "A1.2.3: Processes or mechanisms are implemented for reporting and addressing suspected or confirmed security incidents and vulnerabilities"
  description = "Security vulnerabilities in the provided services can impact the security of all the service provider's customers and therefore must be managed in accordance with the service provider's established processes, with priority given to resolving vulnerabilities that have the highest probability of compromise."

  children = [
    control.account_alternate_contact_security_registered
  ]

  tags = merge(local.pci_dss_v40_appendix_a1_common_tags, {
    pci_dss_v40_item_id = "A1.2.3"
  })
}
