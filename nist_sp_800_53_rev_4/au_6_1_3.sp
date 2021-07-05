benchmark "nist_sp_800_53_rev4_au_6_1_3" {
  title       = "AU-6 (1)(3) Process Integration And Audit Repositories"
  description = "(1) The organization employs automated mechanisms to integrate audit review, analysis, and reporting processes to support organizational processes for investigation and response to suspicious activities. (3) The organization analyzes and correlates audit records across different repositories to gain organization-wide situational awareness."
  children = [
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.securityhub_enabled
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}