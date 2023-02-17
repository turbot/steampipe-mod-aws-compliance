locals {
  testing_framework_common_tags = merge(local.aws_compliance_common_tags, {
    version = "v1.0.0"
  })
}

benchmark "testing_framework" {
  title         = "Testing Framework for AWS plugin major release testing"
  description   = "This is just an adhoc testing framework for specific controls"
  # documentation = file("./cis_v150/docs/cis_overview.md")
  children = [
    control.cloudformation_stack_notifications_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ec2_instance_in_vpc,
    control.elb_application_lb_with_outbound_rule,
    control.kms_cmk_rotation_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.s3_public_access_block_account,
    control.s3_bucket_object_logging_enabled,
    control.secretsmanager_secret_unused_90_day,
    control.vpc_security_group_associated_to_eni,
    # problematic ones
    control.vpc_flow_logs_enabled,
    control.iam_user_no_inline_attached_policies,
    control.s3_bucket_versioning_enabled,
    control.vpc_security_group_restricted_common_ports,
    control.test_cis_v150_5_3_vpc_security_group_remote_administration_ipv6,
    control.iam_user_access_key_age_90
  ]

  tags = merge(local.testing_framework_common_tags, {
    type = "Benchmark"
  })
}

control "test_cis_v150_5_3_vpc_security_group_remote_administration_ipv6" {
  title         = "5.3 Ensure no security groups allow ingress from ::/0 to remote server administration ports"
  description   = "Security groups provide stateful filtering of ingress and egress network traffic to AWS resources. It is recommended that no security group allows unrestricted ingress access to remote server administration ports, such as SSH to port 22 and RDP to port 3389."
  query         = query.vpc_security_group_remote_administration_ipv6
}