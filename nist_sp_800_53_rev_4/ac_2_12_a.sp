benchmark "nist_sp_800_53_rev4_ac_2_12_a" {
  title       = "AC-2(12)(a) Account Monitoring"
  description = "Monitors information system accounts for organization-defined atypical usage."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_sp_800_53_rev4_common_tags
}