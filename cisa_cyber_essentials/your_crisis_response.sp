locals {
  cisa_cyber_essentials_your_crisis_response_common_tags = merge(local.cisa_cyber_essentials_common_tags, {
    section = "your_surroundings"
  })
}

benchmark "cisa_cyber_essentials_your_crisis_response" {
  title       = "Your Crisis Response"
  description = "to do"
  children = [
    benchmark.cisa_cyber_essentials_your_crisis_response_2,
  ]

  tags = local.cisa_cyber_essentials_your_crisis_response_common_tags
}

benchmark "cisa_cyber_essentials_your_crisis_response_2" {
  title       = "Your Crisis Response-2	Your Crisis Response-2"
  description = "Lead development of an internal reporting structure to detect, communicate and contain attacks."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
  ]

  tags = merge(local.cisa_cyber_essentials_your_systems_common_tags, {
    item = "your_crisis_response_2"
  })
}