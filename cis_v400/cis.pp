locals {
  cis_v400_common_tags = merge(local.aws_compliance_common_tags, {
    cis         = "true"
    cis_version = "v4.0.0"
  })
}

benchmark "cis_v400" {
  title         = "AWS CIS v4.0.0"
  description   = "The CIS Amazon Web Services Foundations Benchmark provides prescriptive guidance for configuring security options for a subset of Amazon Web Services with an emphasis on foundational, testable, and architecture agnostic settings."
  documentation = file("./cis_v400/docs/cis_overview.md")
  children = [
    benchmark.cis_v400_1,
    benchmark.cis_v400_2,
    benchmark.cis_v400_3,
    benchmark.cis_v400_4,
    benchmark.cis_v400_5
  ]

  tags = merge(local.cis_v400_common_tags, {
    type = "Benchmark"
  })
}
