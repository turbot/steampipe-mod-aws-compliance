locals {
  nist_csf_v2_common_tags = merge(local.aws_compliance_common_tags, {
    nist_csf_v2 = "true"
    type        = "Benchmark"
  })
}

benchmark "nist_csf_v2" {
  title         = "AWS NIST Cybersecurity Framework (CSF) v2.0"
  description   = "The NIST Cybersecurity Framework (CSF) v2.0 provides a comprehensive framework for managing cybersecurity risk in AWS environments."
  documentation = file("./nist_csf_v2/docs/nist_csf_v2_overview.md")

  children = [
    benchmark.nist_csf_v2_gv,
    benchmark.nist_csf_v2_id,
    benchmark.nist_csf_v2_pr,
    benchmark.nist_csf_v2_de,
    benchmark.nist_csf_v2_rs,
    benchmark.nist_csf_v2_rc
  ]

  tags = local.nist_csf_v2_common_tags
}
