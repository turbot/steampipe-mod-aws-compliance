locals {
  nist_800_172_common_tags = merge(local.aws_compliance_common_tags, {
    nist_800_172 = "true"
    type         = "Benchmark"
  })
}

benchmark "nist_800_172" {
  title         = "NIST 800-171"
  description   = "NIST SP 800-171 focuses on protecting the confidentiality of Controlled Unclassified Information (CUI) in nonfederal systems and organizations, and recommends specific security requirements to achieve that objective. NIST 800-171 is a publication that outlines the required security standards and practices for non-federal organizations that handle CUI on their networks."
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
