locals {
  cis_v200_common_tags = merge(local.aws_compliance_common_tags, {
    cis         = "true"
    cis_version = "v2.0.0"
  })
}

benchmark "cis_v200" {
  title         = "AWS CIS v2.0.0"
  description   = "The CIS Amazon Web Services Foundations Benchmark provides prescriptive guidance for configuring security options for a subset of Amazon Web Services with an emphasis on foundational, testable, and architecture agnostic settings."
  documentation = file("./cis_v200/docs/cis_overview.md")
  children = [
    benchmark.cis_v200_1,
    benchmark.cis_v200_2,
    benchmark.cis_v200_3,
    benchmark.cis_v200_4,
    benchmark.cis_v200_5
  ]

  tags = merge(local.cis_v200_common_tags, {
    type = "Benchmark"
  })
}
