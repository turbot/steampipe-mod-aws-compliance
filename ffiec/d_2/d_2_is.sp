benchmark "d_2_is" {
  title       = "Information Sharing (IS)"
  description = "Information Sharing encompasses establishing relationships with peers and information-sharing forums and how threat information is communicated to those groups as well as internal stakeholders. "
  children = [
    benchmark.d_2_is_is_b_1
  ]

  tags = local.d_2_common_tags
}

benchmark "d_2_is_is_b_1" {
  title       = "D2.IS.Is.B.1"
  description = "Information security threats are gathered and shared with applicable internal employees."
  children = [
    control.guardduty_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.securityhub_enabled
  ]

  tags = merge(local.d_2_common_tags, {
    ffiec_item_id = "d_2_is_is_b_1"
  })
}
