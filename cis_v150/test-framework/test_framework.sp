locals {
  cis_v150_1_common_tags = merge(local.cis_v150_common_tags, {
  })
}

benchmark "test_framework_custom_benchmark" {
  title         = "Custom Benchmark"
  children = [
    control.acm_certificate_transparency_logging_enabled,
    control.cloudformation_stack_notifications_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ec2_instance_in_vpc,
    control.ecs_task_definition_logging_enabled,
    control.elb_application_lb_with_outbound_rule,
    control.kms_cmk_rotation_enabled,
    control.lambda_function_in_vpc,
    control.iam_root_user_hardware_mfa_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.s3_bucket_versioning_enabled,
    control.s3_public_access_block_account,
    control.s3_bucket_object_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.secretsmanager_secret_unused_90_day,
    control.vpc_security_group_associated_to_eni,
    control.vpc_security_group_restricted_common_ports
  ]

  tags = merge(local.cis_v150_1_common_tags, {
    type = "Benchmark"
  })
}