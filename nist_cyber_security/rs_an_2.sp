benchmark "nist_cyber_security_rs_an_2" {
  title       = "RS.AN-2"
  description = "The impact of the incident is understood."

  children = [
    control.guardduty_finding_archived,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "rs_an_2"
  })
}