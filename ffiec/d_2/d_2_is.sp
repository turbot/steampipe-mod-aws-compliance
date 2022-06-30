benchmark "ffiec_d_2_is" {
  title       = "Information Sharing (IS)"
  description = "Information Sharing encompasses establishing relationships with peers and information-sharing forums and how threat information is communicated to those groups as well as internal stakeholders. "
  children = [
    benchmark.ffiec_d_2_is_is_b_1
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_2_is_is_b_1" {
  title       = "D2.IS.Is.B.1"
  description = "Information security threats are gathered and shared with applicable internal employees."
  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.ffiec_common_tags
}
