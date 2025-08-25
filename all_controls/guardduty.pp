locals {
  all_controls_guardduty_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "all_controls_guardduty" {
  title       = "GuardDuty"
  description = "This section contains recommendations for configuring GuardDuty resources."
  children = [
    control.guardduty_centrally_configured,
    control.guardduty_detector_ec2_malware_protection_enabled,
    control.guardduty_detector_ec2_runtime_monitoring_enabled,
    control.guardduty_detector_ecs_runtime_monitoring_enabled,
    control.guardduty_detector_eks_audit_log_monitoring_enabled,
    control.guardduty_detector_eks_runtime_monitoring_enabled,
    control.guardduty_detector_lambda_protection_enabled,
    control.guardduty_detector_rds_protection_enabled,
    control.guardduty_detector_runtime_monitoring_enabled,
    control.guardduty_detector_s3_protection_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.guardduty_no_high_severity_findings
  ]

  tags = merge(local.all_controls_guardduty_common_tags, {
    type = "Benchmark"
  })
}
