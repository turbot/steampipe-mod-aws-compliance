locals {
  cis_v150_common_tags = merge(local.aws_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.5.0"
  })
}

benchmark "cis_v150" {
  title         = "AWS CIS v1.5.0"
  description   = "The CIS Amazon Web Services Foundations Benchmark provides prescriptive guidance for configuring security options for a subset of Amazon Web Services with an emphasis on foundational, testable, and architecture agnostic settings."
  documentation = file("./cis_v150/docs/cis_overview.md")
  children = [
    benchmark.cis_v150_1,
    benchmark.cis_v150_2,
    benchmark.cis_v150_3,
    benchmark.cis_v150_4,
    benchmark.cis_v150_5
  ]

  tags = merge(local.cis_v150_common_tags, {
    type = "Benchmark"
  })
}
