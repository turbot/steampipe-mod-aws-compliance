benchmark "nist_cyber_security_de_dp_4" {
  title       = "DE.DP-4"
  description = "Event detection information is communicated."

  children = [
    control.guardduty_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "de_dp_4"
  })
}