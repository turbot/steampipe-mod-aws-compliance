locals {
  nist_800_172_common_tags = merge(local.aws_compliance_common_tags, {
    nist_800_172 = "true"
    type         = "Benchmark"
  })
}

benchmark "nist_800_172" {
  title         = "AWS NIST 800-172"
  description   = "NIST Special Publication (SP) 800-172 provides federal agencies with a set of enhanced security requirements for protecting the confidentiality, integrity, and availability of controlled unclassified information (CUI) in nonfederal systems and organizations from the advanced persistent threat when the CUI is associated with a critical program or high value asset."
  documentation = file("./nist_800_172/docs/nist_800_172_overview.md")

  children = [
    benchmark.nist_800_172_3_1,
    benchmark.nist_800_172_3_4,
    benchmark.nist_800_172_3_5,
    benchmark.nist_800_172_3_11,
    benchmark.nist_800_172_3_13,
    benchmark.nist_800_172_3_14
  ]

  tags = local.nist_800_172_common_tags
}
