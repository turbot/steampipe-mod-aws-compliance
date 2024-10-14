benchmark "cisa_cyber_essentials_your_crisis_response" {
  title       = "Your Crisis Response"
  description = "As your strategy for responding to and recovering from compromise, this is an essential element of your organization's Culture of Cyber Readiness. Your task for this element is to limit damage and quicken restoration of normal operations."
  children = [
    benchmark.cisa_cyber_essentials_your_crisis_response_2
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_your_crisis_response_2" {
  title       = "Your Crisis Response-2"
  description = "Lead development of an internal reporting structure to detect, communicate and contain attacks."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

