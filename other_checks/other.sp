locals {
  other_common_tags = merge(local.aws_compliance_common_tags, {
    other = "true"
  })
}

benchmark "other" {
  title         = "Other Compliance Checks"
  documentation = file("./other_checks/docs/other_checks_overview.md")
  children = [
    control.acm_certificate_no_wildcard_domain_name,
    control.acm_certificate_transparency_logging_enabled,
    control.apigateway_rest_api_authorizers_configured,
    control.autoscaling_group_no_suspended_process,
    control.cloudformation_stack_notifications_enabled,
    control.cloudformation_stack_output_no_secrets,
    control.cloudformation_stack_rollback_enabled,
    control.cloudfront_distribution_geo_restrictions_enabled,
    control.ec2_instance_no_launch_wizard_security_group,
    control.ec2_instance_publicly_accessible_iam_profile_attached,
    control.ec2_instance_user_data_no_secrets,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.ecr_repository_image_scan_on_push_enabled,
    control.ecr_repository_prohibit_public_access,
    control.ecs_task_definition_logging_enabled,
    control.efs_file_system_encrypted_with_cmk,
    control.efs_file_system_enforces_ssl,
    control.eks_cluster_control_plane_audit_logging_enabled,
    control.eks_cluster_no_default_vpc,
    control.elb_application_classic_network_lb_prohibit_public_access,
    control.elb_application_lb_with_outbound_rule,
    control.elb_classic_lb_with_outbound_rule,
    control.elb_listener_use_secure_ssl_cipher,
    control.es_domain_cognito_authentication_enabled,
    control.es_domain_internal_user_database_enabled,
    control.glue_dev_endpoint_cloudwatch_logs_encryption_enabled,
    control.glue_dev_endpoint_job_bookmarks_encryption_enabled,
    control.glue_dev_endpoint_s3_encryption_enabled,
    control.glue_job_bookmarks_encryption_enabled,
    control.glue_job_cloudwatch_logs_encryption_enabled,
    control.glue_job_s3_encryption_enabled,
    control.iam_policy_custom_no_assume_role,
    control.iam_user_hardware_mfa_enabled,
    control.iam_user_with_administrator_access_mfa_enabled,
    control.kinesis_stream_encrypted_with_kms_cmk,
    control.kinesis_stream_server_side_encryption_enabled,
    control.kms_cmk_policy_prohibit_public_access,
    control.lambda_function_cloudtrail_logging_enabled,
    control.rds_db_instance_ca_certificate_expires_7_days,
    control.rds_db_instance_cloudwatch_logs_enabled,
    control.route53_domain_transfer_lock_enabled,
    control.route53_zone_query_logging_enabled,
    control.s3_bucket_object_logging_enabled,
    control.sagemaker_model_in_vpc,
    control.sagemaker_model_network_isolation_enabled,
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
    control.vpc_security_group_not_uses_launch_wizard_sg,
    control.vpc_security_group_restrict_ingress_redis_port,
    control.vpc_security_group_restrict_kibana_port
  ]

  tags = merge(local.other_common_tags, {
    type = "Benchmark"
  })
}
