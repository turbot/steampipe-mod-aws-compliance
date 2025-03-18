locals {
  pci_dss_v400_requirement_12_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "12"
  })
}

benchmark "pci_dss_v400_requirement_12" {
  title = "Requirement 12: Support Information Security with Organizational Policies and Programs"

  children = [
    benchmark.pci_dss_v400_requirement_12_10,
  ]

  tags = local.pci_dss_v400_requirement_12_common_tags
}

benchmark "pci_dss_v400_requirement_12_10" {
  title = "12.10: Implement an Incident Response Plan"

  children = [
    benchmark.pci_dss_v400_requirement_12_10_5,
  ]

  tags = merge(local.pci_dss_v400_requirement_12_common_tags, {
    pci_dss_v400_item_id = "12.10"
  })
}

benchmark "pci_dss_v400_requirement_12_10_5" {
  title       = "12.10.5: The security incident response plan defines alerts from monitoring systems."
  description = "The security incident response plan defines alerts from monitoring systems, including but not limited to intrusion-detection and intrusion-prevention systems, security information and event management systems, network monitoring systems, file integrity monitoring systems and automated security testing tools."

  children = [
    control.cloudformation_stack_notifications_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.log_metric_filter_console_authentication_failure,
    control.log_metric_filter_console_login_mfa,
    control.log_metric_filter_disable_or_delete_cmk,
    control.log_metric_filter_root_login,
    control.s3_bucket_event_notifications_enabled,
    control.sns_topic_notification_delivery_status_enabled,
  ]

  tags = merge(local.pci_dss_v400_requirement_12_common_tags, {
    pci_dss_v400_item_id = "12.10.5"
  })
} 