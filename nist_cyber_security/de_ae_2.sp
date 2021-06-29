benchmark "nist_cyber_security_de_ae_2" {
  title       = "DE.AE-2"
  description = "Detected events are analyzed to understand attack targets and methods."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "de_ae_2"
  })
}