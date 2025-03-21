locals {
  pci_dss_v40_requirement_11_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "11"
  })
}

benchmark "pci_dss_v40_requirement_11" {
  title       = "Requirement 11: Test Security of Systems and Networks Regularly"
  description = "Vulnerabilities are being discovered continually by malicious individuals and researchers, as well as being introduced by new software. System components, processes, and bespoke and custom software should be tested frequently to ensure security controls continue to reflect a changing environment."

  children = [
    benchmark.pci_dss_v40_requirement_11_3,
    benchmark.pci_dss_v40_requirement_11_5,
    benchmark.pci_dss_v40_requirement_11_6
  ]

  tags = local.pci_dss_v40_requirement_11_common_tags
}

benchmark "pci_dss_v40_requirement_11_3" {
  title       = "11.3: External and internal vulnerabilities are regularly identified, prioritized, and addressed"

  children = [
    benchmark.pci_dss_v40_requirement_11_3_1
  ]

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.3"
  })
}

benchmark "pci_dss_v40_requirement_11_3_1" {
  title       = "11.3.1: Internal vulnerability scans are performed"
  description = "Identifying and addressing vulnerabilities promptly reduces the likelihood of a vulnerability being exploited and the potential compromise of a system component or cardholder data. Vulnerability scans conducted at least every three months provide this detection and identification."

  children = [
    benchmark.pci_dss_v40_requirement_11_3_1_1,
    benchmark.pci_dss_v40_requirement_11_3_1_2,
    benchmark.pci_dss_v40_requirement_11_3_1_3,
    control.ecr_repository_image_scan_on_push_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.3.1"
  })
}

benchmark "pci_dss_v40_requirement_11_3_1_1" {
  title       = "11.3.1.1: All other applicable vulnerabilities (those not ranked as high-risk vulnerabilities or critical vulnerabilities according to the entity's vulnerability risk rankings)"
  description = "All vulnerabilities, regardless of criticality, provide a potential avenue of attack and must therefore be addressed periodically, with the vulnerabilities that expose the most risk addressed more quickly to limit the potential window of attack."

  children = [
    control.guardduty_enabled,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.3.1.1"
  })
}

benchmark "pci_dss_v40_requirement_11_3_1_2" {
  title       = "11.3.1.2: Application-layer penetration tests include application components that support or impact the security of cardholder data"
  description = "Application-layer penetration tests include application components."

  children = [
    control.ecr_repository_image_scan_on_push_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.3.1.2"
  })
}

benchmark "pci_dss_v40_requirement_11_3_1_3" {
  title       = "11.3.1.3: 3 Internal vulnerability scans are performed after any significant change"
  description = "Scanning an environment after any significant changes ensures that changes were completed appropriately such that the security of the environment was not compromised because of the change."

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

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.3.1.3"
  })
}

benchmark "pci_dss_v40_requirement_11_5" {
  title       = "11.5: Network intrusions and unexpected file changes are detected and responded to"

  children = [
    benchmark.pci_dss_v40_requirement_11_5_1,
    benchmark.pci_dss_v40_requirement_11_5_2
  ]

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.5"
  })
}

benchmark "pci_dss_v40_requirement_11_5_1" {
  title       = "11.5.1: Intrusion-detection and/or intrusionprevention techniques are used to detect and/or prevent intrusions into the network"
  description = "Intrusion-detection and/or intrusion-prevention techniques (such as IDS/IPS) compare the traffic coming into the network with known “signatures” and/or behaviors of thousands of compromise types (hacker tools, Trojans, and other malware), and then send alerts and/or stop the attempt as it happens. Without a proactive approach to detect unauthorized activity, attacks on (or misuse of) computer resources could go unnoticed for long periods of time. The impact of an intrusion into the CDE is, in many ways, a factor of the time that an attacker has in the environment before being detected."

  children = [
    benchmark.pci_dss_v40_requirement_11_5_1_1,
    control.guardduty_enabled
  ]

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.5.1"
  })
}

benchmark "pci_dss_v40_requirement_11_5_1_1" {
  title       = "11.5.1.1: Additional requirement for service providers only: Intrusion-detection and/or intrusion-prevention techniques detect, alert on/prevent, and address covert malware communication channels"
  description = "Detecting covert malware communication attempts (for example, DNS tunneling) can help block the spread of malware laterally inside a network and the exfiltration of data. When deciding where to place this control, entities should consider critical locations in the network, and likely routes for covert channels."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.5.1.1"
  })
}

benchmark "pci_dss_v40_requirement_11_5_2" {
  title       = "11.5.2: A change-detection mechanism (for example, file integrity monitoring tools) is deployed"
  description = "Changes to critical system, configuration, or content files can be an indicator an attacker has accessed an organization's system. Such changes can allow an attacker to take additional malicious actions, access cardholder data, and/or conduct activities without detection or record."

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
    control.iam_policy_no_star_star,
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

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.5.2"
  })
}

benchmark "pci_dss_v40_requirement_11_6" {
  title       = "11.6: Unauthorized changes on payment pages are detected and responded to"

  children = [
    benchmark.pci_dss_v40_requirement_11_6_1
  ]

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.6"
  })
}

benchmark "pci_dss_v40_requirement_11_6_1" {
  title       = "11.6.1: A change- and tamper-detection mechanism is deployed"
  description = "Many web pages now rely on assembling objects, including active content (primarily JavaScript), from multiple internet locations. Additionally, the content of many web pages is defined using content management and tag management systems that may not be possible to monitor using traditional change detection mechanisms."

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

  tags = merge(local.pci_dss_v40_requirement_11_common_tags, {
    pci_dss_v40_item_id = "11.6.1"
  })
} 