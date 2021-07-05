benchmark "nist_800_53_rev_4_au_7_1" {
  title       = "AU-7(1) Automatic Processing"
  description = "The information system provides the capability to process audit records for events of interest based on [Assignment: organization-defined audit fields within audit records]."
  children = [
    control.cloudwatch_alarm_action_enabled,
    control.cloudtrail_trail_integrated_with_logs,
  ]

  tags = local.nist_800_53_rev_4_common_tags
}