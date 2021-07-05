benchmark "nist_800_53_rev_4_ac_2_12_a" {
  title       = "AC-2(12)(a) Account Monitoring"
  description = "Monitors information system accounts for organization-defined atypical usage."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_800_53_rev_4_common_tags
}