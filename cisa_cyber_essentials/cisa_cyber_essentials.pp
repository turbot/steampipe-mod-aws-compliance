locals {
  cisa_cyber_essentials_common_tags = merge(local.aws_compliance_common_tags, {
    cisa_cyber_essentials = "true"
    type                  = "Benchmark"
  })
}

benchmark "cisa_cyber_essentials" {
  title         = "AWS CISA Cyber Essentials"
  description   = "CISA's Cyber Essentials is a guide for leaders of small businesses as well as leaders of small and local government agencies to develop an actionable understanding of where to start implementing organizational cybersecurity practices."
  documentation = file("./cisa_cyber_essentials/docs/cisa_cyber_essentials_overview.md")
  children = [
    benchmark.cisa_cyber_essentials_your_systems,
    benchmark.cisa_cyber_essentials_your_surroundings,
    benchmark.cisa_cyber_essentials_your_data,
    benchmark.cisa_cyber_essentials_your_crisis_response,
    benchmark.cisa_cyber_essentials_booting_up_things_to_do_first
  ]

  tags = local.cisa_cyber_essentials_common_tags
}
