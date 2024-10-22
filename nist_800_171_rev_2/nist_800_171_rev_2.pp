locals {
  nist_800_171_rev_2_common_tags = merge(local.aws_compliance_common_tags, {
    nist_800_171_rev_2 = "true"
    type               = "Benchmark"
  })
}

benchmark "nist_800_171_rev_2" {
  title         = "NIST 800-171 Revision 2"
  description   = "NIST SP 800-171 focuses on protecting the confidentiality of Controlled Unclassified Information (CUI) in nonfederal systems and organizations, and recommends specific security requirements to achieve that objective. NIST 800-171 is a publication that outlines the required security standards and practices for non-federal organizations that handle CUI on their networks."
  documentation = file("./nist_800_171_rev_2/docs/nist_800_171_rev_2_overview.md")

  children = [
    benchmark.nist_800_171_rev_2_2,
    benchmark.nist_800_171_rev_2_3_1,
    benchmark.nist_800_171_rev_2_3_3,
    benchmark.nist_800_171_rev_2_3_4,
    benchmark.nist_800_171_rev_2_3_5,
    benchmark.nist_800_171_rev_2_3_6,
    benchmark.nist_800_171_rev_2_3_8,
    benchmark.nist_800_171_rev_2_3_11,
    benchmark.nist_800_171_rev_2_3_12,
    benchmark.nist_800_171_rev_2_3_13,
    benchmark.nist_800_171_rev_2_3_14
  ]

  tags = local.nist_800_171_rev_2_common_tags
}
