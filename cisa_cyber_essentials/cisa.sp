locals {
  cisa_cyber_essentials_common_tags = {
    cisa_cyber_essentials = "true"
    plugin   = "aws"
  }
}

benchmark "cisa_cyber_essentials" {
  title         = "AWS Best Practices for CISA Cyber Essentials"
  description   = "The AWS Best Practices for CISA Cyber Essentials provide a general-purpose compliance framework designed to enable you to create security, operational or cost-optimization governance checks using managed or custom AWS Config rules and AWS Config remediation actions."
  documentation = file("./nist_csf/docs/nist_csf_overview.md")

  children = [
    benchmark.cisa_cyber_essentials_your_systems,
    benchmark.cisa_cyber_essentials_your_surroundings,
    benchmark.cisa_cyber_essentials_your_data,
    benchmark.cisa_cyber_essentials_your_crisis_response,
    benchmark.cisa_cyber_essentials_booting_up_things_to_do_first
  ]

  tags = local.cisa_cyber_essentials_common_tags
}
