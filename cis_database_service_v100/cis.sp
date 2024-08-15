locals {
  cis_v100_common_tags = merge(local.aws_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.0.0"
  })
}

benchmark "cis_v100" {
  title         = "CIS v1.0.0"
  description   = "The CIS Amazon Web Services Foundations Benchmark provides prescriptive guidance for configuring security options for a subset of Amazon Web Services with an emphasis on foundational, testable, and architecture agnostic settings."
  documentation = file("./cis_v100/docs/cis_overview.md")
  children = [
    benchmark.cis_v100_1,
    benchmark.cis_v100_2,
    benchmark.cis_v100_3,
    benchmark.cis_v100_4
  ]

  tags = merge(local.cis_v100_common_tags, {
    type = "Benchmark"
  })
}
