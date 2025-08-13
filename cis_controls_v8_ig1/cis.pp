locals {
  cis_controls_v8_ig1_common_tags = merge(local.aws_compliance_common_tags, {
    cis_controls_v8_ig1 = "true"
    type                = "Benchmark"
  })
}

benchmark "cis_controls_v8_ig1" {
  title         = "AWS CIS Controls v8 IG1"
  description   = "The CIS Critical Security Controls (CIS Controls) are a prioritized set of Safeguards to mitigate the most prevalent cyber-attacks against systems and networks. They are mapped to and referenced by multiple legal, regulatory, and policy frameworks."
  documentation = file("./cis_controls_v8_ig1/docs/cis_overview.md")
  children = [
    benchmark.cis_controls_v8_ig1_1,
    benchmark.cis_controls_v8_ig1_3,
    benchmark.cis_controls_v8_ig1_4,
    benchmark.cis_controls_v8_ig1_5,
    benchmark.cis_controls_v8_ig1_6,
    benchmark.cis_controls_v8_ig1_7,
    benchmark.cis_controls_v8_ig1_8,
    benchmark.cis_controls_v8_ig1_10,
    benchmark.cis_controls_v8_ig1_11,
    benchmark.cis_controls_v8_ig1_12
  ]

  tags = merge(local.cis_controls_v8_ig1_common_tags, {
    type = "Benchmark"
  })
}
