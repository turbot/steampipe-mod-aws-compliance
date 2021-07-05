benchmark "nist_sp_800_53_rev4_ac_2_4" {
  title       = "AC-2 (4) Automated Audit Actions"
  description = "The information system automatically audits account creation, modification, enabling, disabling, and removal actions, and notifies [Assignment: organization-defined personnel or roles]."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.cloudtrail_trail_enabled
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}