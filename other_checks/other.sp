locals {
  other_common_tags = merge(local.aws_compliance_common_tags, {
    other_checks = "true"
  })
}

benchmark "other" {
  title         = "Other Compliance Checks"
  documentation = file("./other_checks/docs/other_checks_overview.md")
  children = [
    control.acm_certificate_no_wildcard_domain_name,
    control.acm_certificate_transparency_logging_enabled,
    control.api_gatewayv2_route_authorizer_configured,
    control.apigateway_rest_api_authorizers_configured,
    control.apigateway_rest_api_endpoint_restrict_public_access,
    control.autoscaling_ec2_launch_configuration_no_sensitive_data,
    control.autoscaling_group_no_suspended_process,
    control.backup_plan_region_configured,
    control.backup_vault_region_configured,
    control.cloudformation_stack_notifications_enabled,
    control.cloudformation_stack_output_no_secrets,
    control.cloudformation_stack_rollback_enabled,
    control.cloudformation_stack_termination_protection_enabled,
    control.cloudfront_distribution_field_level_encryption_enabled,
    control.cloudfront_distribution_geo_restrictions_enabled,
    control.cloudfront_distribution_non_s3_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_use_secure_cipher,
    control.cloudtrail_trail_bucket_mfa_enabled,
    control.cloudtrail_trail_insight_selectors_and_logging_enabled,
    control.cloudwatch_cross_account_sharing,
    control.codebuild_project_build_greater_then_90_days,
    control.codebuild_project_with_user_controlled_buildspec,
    control.directory_service_directory_snapshots_limit,
    control.docdb_cluster_instance_logging_enabled,
    control.drs_job_enabled,
    control.ebs_snapshot_encryption_enabled,
    control.ec2_ami_restrict_public_access,
    control.ec2_instance_no_high_level_finding_in_inspector_scan,
    control.ec2_instance_no_launch_wizard_security_group,
    control.ec2_instance_publicly_accessible_iam_profile_attached,
    control.ec2_instance_user_data_no_secrets,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.ecr_repository_image_scan_on_push_enabled,
    control.ecr_repository_prohibit_public_access,
    control.ecs_cluster_encryption_at_rest_enabled,
    control.ecs_cluster_instance_in_vpc,
    control.ecs_cluster_no_registered_container_instance,
    control.ecs_service_load_balancer_attached,
    control.ecs_task_definition_logging_enabled,
    control.efs_file_system_encrypted_with_cmk,
    control.efs_file_system_enforces_ssl,
    control.efs_file_system_restrict_public_access,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_endpoint_public_access_restricted,
    control.eks_cluster_no_default_vpc,
    control.elb_application_classic_network_lb_prohibit_public_access,
    control.elb_application_lb_listener_certificate_expire_30_days,
    control.elb_application_lb_listener_certificate_expire_7_days,
    control.elb_application_lb_with_outbound_rule,
    control.elb_application_network_lb_use_listeners,
    control.elb_classic_lb_with_outbound_rule,
    control.elb_listener_use_secure_ssl_cipher,
    control.elb_tls_listener_protocol_version,
    control.emr_account_public_access_blocked,
    control.es_domain_cognito_authentication_enabled,
    control.es_domain_internal_user_database_enabled,
    control.glacier_vault_restrict_public_access,
    control.glue_dev_endpoint_cloudwatch_logs_encryption_enabled,
    control.glue_dev_endpoint_job_bookmarks_encryption_enabled,
    control.glue_dev_endpoint_s3_encryption_enabled,
    control.glue_job_bookmarks_encryption_enabled,
    control.glue_job_cloudwatch_logs_encryption_enabled,
    control.glue_job_s3_encryption_enabled,
    control.guardduty_centrally_configured,
    control.guardduty_no_high_severity_findings,
    control.iam_access_analyzer_enabled_without_findings,
    control.iam_custom_policy_unattached_no_star_star,
    control.iam_policy_custom_no_assume_role,
    control.iam_policy_custom_no_permissive_role_assumption,
    control.iam_policy_no_full_access_to_cloudtrail,
    control.iam_policy_no_full_access_to_kms,
    control.iam_role_cross_account_read_only_access_policy,
    control.iam_role_unused_60,
    control.iam_security_audit_role,
    control.iam_user_hardware_mfa_enabled,
    control.iam_user_with_administrator_access_mfa_enabled,
    control.kinesis_stream_encrypted_with_kms_cmk,
    control.kinesis_stream_server_side_encryption_enabled,
    control.kms_cmk_unused,
    control.kms_cmk_policy_prohibit_public_access,
    control.kms_key_decryption_restricted_in_iam_customer_managed_policy,
    control.kms_key_decryption_restricted_in_iam_inline_policy,
    control.lambda_function_cloudtrail_logging_enabled,
    control.lambda_function_restrict_public_url,
    control.lambda_function_tracing_enabled,
    control.lambda_function_variables_no_sensitive_data,
    control.networkfirewall_firewall_in_vpc,
    control.opensearch_domain_cognito_authentication_enabled_for_kibana,
    control.opensearch_domain_internal_user_database_disabled,
    control.opensearch_domain_updated_with_latest_service_software_version,
    control.rds_db_instance_ca_certificate_expires_7_days,
    control.rds_db_instance_cloudwatch_logs_enabled,
    control.rds_db_instance_connections_encryption_enabled,
    control.route53_domain_auto_renew_enabled,
    control.route53_domain_expires_30_days,
    control.route53_domain_expires_7_days,
    control.route53_domain_not_expired,
    control.route53_domain_privacy_protection_enabled,
    control.route53_domain_transfer_lock_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_object_logging_enabled,
    control.s3_bucket_static_website_hosting_disabled,
    control.sagemaker_model_in_vpc,
    control.sagemaker_model_network_isolation_enabled,
    control.sagemaker_notebook_instance_encrypted_with_kms_cmk,
    control.sagemaker_notebook_instance_in_vpc,
    control.sagemaker_notebook_instance_root_access_disabled,
    control.sagemaker_training_job_in_vpc,
    control.sagemaker_training_job_inter_container_traffic_encryption_enabled,
    control.sagemaker_training_job_network_isolation_enabled,
    control.sagemaker_training_job_volume_and_data_encryption_enabled,
    control.sns_topic_policy_prohibit_public_access,
    control.sqs_queue_dead_letter_queue_configured,
    control.sqs_queue_policy_prohibit_public_access,
    control.vpc_endpoint_service_acceptance_required_enabled,
    control.vpc_in_more_than_one_region,
    control.vpc_security_group_allows_ingress_authorized_ports,
    control.vpc_security_group_allows_ingress_to_cassandra_ports,
    control.vpc_security_group_allows_ingress_to_memcached_port,
    control.vpc_security_group_allows_ingress_to_mongodb_ports,
    control.vpc_security_group_allows_ingress_to_oracle_ports,
    control.vpc_security_group_not_uses_launch_wizard_sg,
    control.vpc_security_group_restrict_ingress_kafka_port,
    control.vpc_security_group_restrict_ingress_kibana_port,
    control.vpc_security_group_restrict_ingress_redis_port,
    control.vpc_security_group_restricted_common_ports,
    control.vpc_subnet_multi_az_enabled,
    control.vpc_subnet_public_and_private,
    control.workspaces_workspace_volume_encryption_enabled
  ]

  tags = merge(local.other_common_tags, {
    type = "Benchmark"
  })
}
