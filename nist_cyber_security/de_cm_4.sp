benchmark "nist_cyber_security_de_cm_4" {
  title       = "DE.CM-4"
  description = "Malicious code is detected."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "de_cm_4"
  })
}