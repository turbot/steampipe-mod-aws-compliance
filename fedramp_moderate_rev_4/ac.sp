benchmark "fedramp_moderate_rev_4_ac" {
  title       = benchmark.nist_800_53_rev_4_ac.title
  description = benchmark.nist_800_53_rev_4_ac.description
  children = [
    benchmark.fedramp_moderate_rev_4_ac_2,
    benchmark.fedramp_moderate_rev_4_ac_3,
    benchmark.fedramp_moderate_rev_4_ac_4,
    benchmark.fedramp_moderate_rev_4_ac_5,
    benchmark.fedramp_moderate_rev_4_ac_6,
    benchmark.fedramp_moderate_rev_4_ac_17,
    benchmark.fedramp_moderate_rev_4_ac_21
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_2" {
  title       = benchmark.nist_800_53_rev_4_ac_2.title
  description = benchmark.nist_800_53_rev_4_ac_2.description
  children = [
    benchmark.fedramp_moderate_rev_4_ac_2_1,
    benchmark.fedramp_moderate_rev_4_ac_2_4,
    benchmark.fedramp_moderate_rev_4_ac_2_12,
    benchmark.fedramp_moderate_rev_4_ac_2_f,
    benchmark.fedramp_moderate_rev_4_ac_2_g,
    benchmark.fedramp_moderate_rev_4_ac_2_j,
    benchmark.fedramp_moderate_rev_4_ac_2_3
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_2_f" {
  title       = "AC-2(f)"
  description = "The organization: f. Creates, enables, modifies, disables, and removes information system accounts in accordance with [Assignment: organization-defined procedures or conditions]."
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.fedramp_moderate_rev_4_common_tags, {
    service  = "AWS/IAM"
  })
}

benchmark "fedramp_moderate_rev_4_ac_2_g" {
  title       = "AC-2(g)"
  description = "The organization: g. Monitors the use of information system accounts."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.es_domain_logs_to_cloudwatch,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_2_j" {
  title       = "AC-2(j)"
  description = "The organization: j. Reviews accounts for compliance with account management requirements [Assignment: organization-defined frequency]."
  children = [
    control.ecs_task_definition_user_for_host_mode_check,
    control.iam_account_password_policy_min_length_14,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_2_1" {
  title       = benchmark.nist_800_53_rev_4_ac_2_1.title
  description = benchmark.nist_800_53_rev_4_ac_2_1.description
  children = [
    control.guardduty_enabled,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.securityhub_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_2_3" {
  title       = benchmark.nist_800_53_rev_4_ac_2_3.title
  description = benchmark.nist_800_53_rev_4_ac_2_3.description
  children = [
    control.iam_account_password_policy_min_length_14,
    control.iam_user_unused_credentials_90
  ]

  tags = merge(local.fedramp_moderate_rev_4_common_tags, {
    service  = "AWS/IAM"
  })
}

benchmark "fedramp_moderate_rev_4_ac_2_4" {
  title       = benchmark.nist_800_53_rev_4_ac_2_4.title
  description = benchmark.nist_800_53_rev_4_ac_2_4.description
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_2_12" {
  title       = benchmark.nist_800_53_rev_4_ac_2_12.title
  description = benchmark.nist_800_53_rev_4_ac_2_12.description
  children = [
    benchmark.fedramp_moderate_rev_4_ac_2_12_a
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_2_12_a" {
  title       = "AC-2(12)(a)"
  description = "The organization: a. Monitors information system accounts for [Assignment: organization-defined atypical use]."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_3" {
  title       = "Access Enforcement (AC-3)"
  description = "The information system enforces approved authorizations for logical access to information and system resources in accordance with applicable access control policies."
  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_uses_imdsv2,
    control.ecs_task_definition_user_for_host_mode_check,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_4" {
  title       = benchmark.nist_800_53_rev_4_ac_4.title
  description = benchmark.nist_800_53_rev_4_ac_4.description
  children = [
    control.acm_certificate_expires_30_days,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
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
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_5" {
  title       = benchmark.nist_800_53_rev_4_ac_5.title
  description = benchmark.nist_800_53_rev_4_ac_5.description
  children = [
    benchmark.fedramp_moderate_rev_4_ac_5_c
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_5_c" {
  title       = "AC-5(c)"
  description = "The organization: c. Defines information system access authorizations to support separation of duties."
  children = [
    control.ecs_task_definition_user_for_host_mode_check,
    control.iam_account_password_policy_min_length_14,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_6" {
  title       = benchmark.nist_800_53_rev_4_ac_6.title
  description = benchmark.nist_800_53_rev_4_ac_6.description
  children = [
    benchmark.fedramp_moderate_rev_4_ac_6_10,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_uses_imdsv2,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_6_10" {
  title       = benchmark.nist_800_53_rev_4_ac_6_10.title
  description = benchmark.nist_800_53_rev_4_ac_6_10.description
  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.fedramp_moderate_rev_4_common_tags, {
    service  = "AWS/IAM"
  })
}

benchmark "fedramp_moderate_rev_4_ac_17" {
  title       = benchmark.nist_800_53_rev_4_ac_17.title
  description = benchmark.nist_800_53_rev_4_ac_17.description
  children = [
    benchmark.fedramp_moderate_rev_4_ac_17_1,
    benchmark.fedramp_moderate_rev_4_ac_17_2
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_17_1" {
  title       = benchmark.nist_800_53_rev_4_ac_17_1.title
  description = benchmark.nist_800_53_rev_4_ac_17_1.description
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.guardduty_enabled,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.securityhub_enabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_17_2" {
  title       = benchmark.nist_800_53_rev_4_ac_17_2.title
  description = benchmark.nist_800_53_rev_4_ac_17_2.description
  children = [
    control.acm_certificate_expires_30_days,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_21" {
  title       = benchmark.nist_800_53_rev_4_ac_21.title
  description = benchmark.nist_800_53_rev_4_ac_21.description
  children = [
    benchmark.fedramp_moderate_rev_4_ac_21_b
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}

benchmark "fedramp_moderate_rev_4_ac_21_b" {
  title       = "AC-21(b)"
  description = "The organization: b. Employs [Assignment: organization-defined automated mechanisms or manual processes] to assist users in making information sharing/collaboration decisions."
  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.fedramp_moderate_rev_4_common_tags
}