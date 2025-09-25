benchmark "nist_800_172_3_1" {
  title       = "3.1 Access Control"
  description = "The access control family consists of security requirements detailing system logging. This includes who has access to what assets and reporting capabilities like account management, system privileges, and remote access logging to determine when users have access to the system and their level of access."
  children = [
    benchmark.nist_800_172_3_1_3_e
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_1_3_e" {
  title       = "3.1.3e Employ [Assignment: organization-defined secure information transfer solutions] to control information flows between security domains on connected systems"
  description = "Organizations employ information flow control policies and enforcement mechanisms to control the flow of information between designated sources and destinations within systems and between connected systems. Flow control is based on the characteristics of the information and/or the information path. Enforcement occurs, for example, in boundary protection devices that employ rule sets or establish configuration settings that restrict system services, provide a packet-filtering capability based on header information, or provide a message-filtering capability based on message content. Organizations also consider the trustworthiness of filtering and inspection mechanisms (i.e., hardware, firmware, and software components) that are critical to information flow enforcement. Transferring information between systems in different security domains with different security policies introduces the risk that the transfers violate one or more domain security policies. In such situations, information owners or information stewards provide guidance at designated policy enforcement points between connected systems. Organizations mandate specific architectural solutions when required to enforce logical or physical separation between systems in different security domains. Enforcement includes prohibiting information transfers between connected systems, employing hardware mechanisms to enforce one-way information flows, verifying write permissions before accepting information from another security domain or connected system, and implementing trustworthy regrading mechanisms to reassign security attributes and labels."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.elb_application_lb_desync_mitigation_mode,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_desync_mitigation_mode,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.es_domain_node_to_node_encryption_enabled,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.opensearch_domain_https_required,
    control.opensearch_domain_in_vpc,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_allows_ingress_authorized_ports,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.vpc_network_acl_remote_administration
  ]

  tags = local.nist_800_172_common_tags
}
