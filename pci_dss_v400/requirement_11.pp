locals {
  pci_dss_v400_requirement_11_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "11"
  })
}

benchmark "pci_dss_v400_requirement_11" {
  title = "Requirement 11: Test Security of Systems and Networks Regularly"

  children = [
    benchmark.pci_dss_v400_requirement_11_3,
    benchmark.pci_dss_v400_requirement_11_5,
    benchmark.pci_dss_v400_requirement_11_6
  ]

  tags = local.pci_dss_v400_requirement_11_common_tags
}

benchmark "pci_dss_v400_requirement_11_3" {
  title = "11.3: Perform Penetration Testing"

  children = [
    benchmark.pci_dss_v400_requirement_11_3_1
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.3"
  })
}

benchmark "pci_dss_v400_requirement_11_3_1" {
  title = "11.3.1: Penetration testing is performed."

  children = [
    benchmark.pci_dss_v400_requirement_11_3_1_1,
    benchmark.pci_dss_v400_requirement_11_3_1_2,
    benchmark.pci_dss_v400_requirement_11_3_1_3,
    control.ecr_repository_image_scan_on_push_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.3.1"
  })
}

benchmark "pci_dss_v400_requirement_11_3_1_1" {
  title       = "11.3.1.1: Network-layer penetration tests include network and application components that support or impact the security of cardholder data."
  description = "Network-layer penetration tests include components that support network functions as well as operating systems."

  children = [
    control.guardduty_enabled,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.3.1.1"
  })
}

benchmark "pci_dss_v400_requirement_11_3_1_2" {
  title       = "11.3.1.2: Application-layer penetration tests include application components that support or impact the security of cardholder data."
  description = "Application-layer penetration tests include application components."

  children = [
    control.ecr_repository_image_scan_on_push_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.3.1.2"
  })
}

benchmark "pci_dss_v400_requirement_11_3_1_3" {
  title       = "11.3.1.3: Penetration testing covers CDE perimeter, critical system, and applications."
  description = "The penetration testing includes the CDE perimeter and critical systems that may impact the security of the CDE, with focus on the cardholder data environment and those systems with connectivity to the CDE."

  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.ec2_instance_not_publicly_accessible,
    control.ecr_repository_image_scan_on_push_enabled,
    control.guardduty_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.lambda_function_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.3.1.3"
  })
}

benchmark "pci_dss_v400_requirement_11_5" {
  title = "11.5: Detect and Protect Against Security Failures"

  children = [
    benchmark.pci_dss_v400_requirement_11_5_1,
    benchmark.pci_dss_v400_requirement_11_5_2
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.5"
  })
}

benchmark "pci_dss_v400_requirement_11_5_1" {
  title       = "11.5.1: Intrusion-detection and/or intrusion-prevention techniques detect and protect against intrusions into the network."
  description = "Intrusion-detection and/or intrusion-prevention techniques detect and protect against intrusions into the network."

  children = [
    benchmark.pci_dss_v400_requirement_11_5_1_1,
    control.guardduty_enabled
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.5.1"
  })
}

benchmark "pci_dss_v400_requirement_11_5_1_1" {
  title       = "11.5.1.1: All traffic is monitored at the network level."
  description = "All traffic is monitored at the network level, including traffic from within the CDE to third-party service providers, and from the CDE to outside the network."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.5.1.1"
  })
}

benchmark "pci_dss_v400_requirement_11_5_2" {
  title       = "11.5.2: Automated security scanning and testing tools are used as follows."
  description = "Automated security scanning and testing tools are used for continuous monitoring or configuration testing."

  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudformation_stack_notifications_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.config_enabled_all_regions,
    control.ec2_instance_not_publicly_accessible,
    control.guardduty_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_no_root_access_key,
    control.iam_policy_no_star_star,
    control.iam_root_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.lambda_function_restrict_public_access,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_root_login,
    control.s3_bucket_event_notifications_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.5.2"
  })
}

benchmark "pci_dss_v400_requirement_11_6" {
  title = "11.6: Respond to Security Control Failures"

  children = [
    benchmark.pci_dss_v400_requirement_11_6_1,
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.6"
  })
}

benchmark "pci_dss_v400_requirement_11_6_1" {
  title       = "11.6.1: A security incident response plan exists and is followed in the event of a system breach."
  description = "A security incident response plan exists and is ready to be activated in the event of a system breach."

  children = [
    control.cloudformation_stack_notifications_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_root_login,
    control.s3_bucket_event_notifications_enabled,
    control.securityhub_enabled,
    control.sns_topic_notification_delivery_status_enabled
  ]

  tags = merge(local.pci_dss_v400_requirement_11_common_tags, {
    pci_dss_v400_item_id = "11.6.1"
  })
} 