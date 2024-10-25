benchmark "ffiec_d_3_pc" {
  title       = "Preventative Controls (PC)"
  description = "Preventative Controls deter and prevent cyber attacks and include infrastructure management, access management, device and end-point security, and secure coding."
  children = [
    benchmark.ffiec_d_3_pc_am_b_1,
    benchmark.ffiec_d_3_pc_am_b_10,
    benchmark.ffiec_d_3_pc_am_b_12,
    benchmark.ffiec_d_3_pc_am_b_13,
    benchmark.ffiec_d_3_pc_am_b_15,
    benchmark.ffiec_d_3_pc_am_b_16,
    benchmark.ffiec_d_3_pc_am_b_2,
    benchmark.ffiec_d_3_pc_am_b_3,
    benchmark.ffiec_d_3_pc_am_b_6,
    benchmark.ffiec_d_3_pc_am_b_7,
    benchmark.ffiec_d_3_pc_am_b_8,
    benchmark.ffiec_d_3_pc_im_b_1,
    benchmark.ffiec_d_3_pc_im_b_2,
    benchmark.ffiec_d_3_pc_im_b_3,
    benchmark.ffiec_d_3_pc_im_b_5,
    benchmark.ffiec_d_3_pc_im_b_6,
    benchmark.ffiec_d_3_pc_im_b_7,
    benchmark.ffiec_d_3_pc_se_b_1
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_1" {
  title       = "D3.PC.Am.B.1"
  description = "Employee access is granted to systems and confidential data based on job responsibilities and the principles of least privilege."
  children = [
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_user_for_host_mode_check,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_10" {
  title       = "D3.PC.Am.B.10"
  description = "Production and non-production environments are segregated to prevent unauthorized access or changes to information assets. (*N/A if no production environment exists at the institution or the institution's third party.)"
  children = [
    control.ec2_instance_in_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_12" {
  title       = "D3.PC.Am.B.12"
  description = "All passwords are encrypted in storage and in transit."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.backup_recovery_point_encryption_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_kerberos_enabled,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_13" {
  title       = "D3.PC.Am.B.13"
  description = "Confidential data is encrypted when transmitted across public or untrusted networks (e.g., Internet)."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_15" {
  title       = "D3.PC.Am.B.15"
  description = "Remote access to critical systems by employees, contractors, and third parties uses encrypted connections and multifactor authentication."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_16" {
  title       = "D3.PC.Am.B.16"
  description = "Administrative, physical, or technical controls are in place to prevent users without administrative responsibilities from installing unauthorized software."
  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_user_in_group
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_2" {
  title       = "D3.PC.Am.B.2"
  description = "Employee access to systems and confidential data provides for separation of duties."
  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_policy_no_star_star,
    control.iam_user_in_group
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_3" {
  title       = "D3.PC.Am.B.3"
  description = "Elevated privileges (e.g., administrator privileges) are limited and tightly controlled (e.g., assigned to individuals, not shared, and require stronger password controls)"
  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_6" {
  title       = "D3.PC.Am.B.6"
  description = "Identification and authentication are required and managed for access to systems, applications, and hardware."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_7" {
  title       = "D3.PC.Am.B.7"
  description = "Access controls include password complexity and limits to password attempts and reuse."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_am_b_8" {
  title       = "D3.PC.Am.B.8"
  description = "All default passwords and unnecessary default accounts are changed before system implementation."
  children = [
    control.iam_root_user_no_access_keys
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_im_b_1" {
  title       = "D3.PC.Im.B.1"
  description = "Network perimeter defense tools (e.g., border router and firewall) are used."
  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_use_waf_web_acl,
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.elb_application_lb_waf_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_im_b_2" {
  title       = "D3.PC.IM.B.2"
  description = "Systems that are accessed from the Internet or by external parties are protected by firewalls or other similar devices."
  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.elb_application_lb_waf_enabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_im_b_3" {
  title       = "D3.PC.IM.B.3"
  description = "All ports are monitored."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_im_b_5" {
  title       = "D3.PC.Im.B.5"
  description = "Systems configurations (for servers, desktops, routers, etc.) follow industry standards and are enforced"
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_im_b_6" {
  title       = "D3.PC.Im.B.6"
  description = "Ports, functions, protocols and services are prohibited if no longer needed for business purposes."
  children = [
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_im_b_7" {
  title       = "D3.PC.Im.B.7"
  description = "Access to make changes to systems configurations (including virtual machines and hypervisors) is controlled and monitored."
  children = [
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_pc_se_b_1" {
  title       = "D3.PC.Se.B.1"
  description = "Developers working for the institution follow secure program coding practices, as part of a system development life cycle (SDLC), that meet industry standards."
  children = [
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured
  ]

  tags = local.ffiec_common_tags
}
