locals {
  rbi_itf_nbfc_common_tags = merge(local.aws_compliance_common_tags, {
    rbi_itf_nbfc = "true"
    type         = "Benchmark"
  })
}

benchmark "rbi_itf_nbfc" {
  title         = "AWS Reserve Bank of India - Information Technology Framework for Non-Banking Financial Companies (RBI ITF-NBFC)"
  description   = "The NBFC (Non-Banking Finance Company) sector has grown in size and complexity over the years. As the NBFC industry matures and achieves scale, its Information Technology /Information Security (IT/IS) framework, Business continuity planning (BCP), Disaster Recovery (DR) Management, IT audit, etc. must be benchmarked to best practices."
  documentation = file("./rbi_itf_nbfc/docs/rbi_itf_nbfc_overview.md")
  children = [
    benchmark.rbi_itf_nbfc_3,
    benchmark.rbi_itf_nbfc_4,
    benchmark.rbi_itf_nbfc_6,
    benchmark.rbi_itf_nbfc_8
  ]
  tags = local.rbi_itf_nbfc_common_tags
}
