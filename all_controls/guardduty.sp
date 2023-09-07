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
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.guardduty_no_high_severity_findings
  ]

  tags = merge(local.all_controls_guardduty_common_tags, {
    type = "Benchmark"
  })
}
