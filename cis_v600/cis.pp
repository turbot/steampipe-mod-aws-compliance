locals {
  cis_v600_common_tags = merge(local.aws_compliance_common_tags, {
    cis         = "true"
    cis_version = "v6.0.0"
  })
}

benchmark "cis_v600" {
  title         = "AWS CIS v6.0.0"
  description   = "The CIS Amazon Web Services Foundations Benchmark provides prescriptive guidance for configuring security options for a subset of Amazon Web Services with an emphasis on foundational, testable, and architecture agnostic settings."
  documentation = file("./cis_v600/docs/cis_overview.md")
  children = [
    benchmark.cis_v600_2,
    benchmark.cis_v600_3,
    benchmark.cis_v600_4,
    benchmark.cis_v600_5,
    benchmark.cis_v600_6
  ]

  tags = merge(local.cis_v600_common_tags, {
    type = "Benchmark"
  })
}
