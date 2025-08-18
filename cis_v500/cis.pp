locals {
  cis_v500_common_tags = merge(local.aws_compliance_common_tags, {
    cis         = "true"
    cis_version = "v5.0.0"
  })
}

benchmark "cis_v500" {
  title         = "AWS CIS v5.0.0"
  description   = "The CIS Amazon Web Services Foundations Benchmark provides prescriptive guidance for configuring security options for a subset of Amazon Web Services with an emphasis on foundational, testable, and architecture agnostic settings."
  documentation = file("./cis_v500/docs/cis_overview.md")
  children = [
    benchmark.cis_v500_1,
    benchmark.cis_v500_2,
    benchmark.cis_v500_3,
    benchmark.cis_v500_4,
    benchmark.cis_v500_5
  ]

  tags = merge(local.cis_v500_common_tags, {
    type = "Benchmark"
  })
}
