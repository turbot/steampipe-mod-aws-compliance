locals {
  rbi_nbfc_cyber_2026_common_tags = merge(local.aws_compliance_common_tags, {
    rbi_nbfc_cyber_2026 = "true"
    type                = "Benchmark"
  })
}

benchmark "rbi_nbfc_cyber_2026" {
  title         = "AWS Reserve Bank of India - Non-Banking Financial Companies Cybersecurity, Technology: Risk, Resilience and Assurance Framework Directions, 2026"
  description   = "The Reserve Bank of India (Non-Banking Financial Companies - Cybersecurity, Technology: Risk, Resilience and Assurance Framework) Directions, 2026 apply to all NBFCs. Chapter III applies to NBFCs-Base Layer with asset size below ₹500 crore and Core Investment Companies, Chapter IV to NBFCs-Base Layer with asset size ₹500 crore and above, and Chapter V to NBFCs-Middle Layer, Upper Layer and Top Layer, excluding Core Investment Companies."
  documentation = file("./rbi_nbfc_cyber_2026/docs/rbi_nbfc_cyber_2026_overview.md")
  children = [
    benchmark.rbi_nbfc_cyber_2026_iii,
    benchmark.rbi_nbfc_cyber_2026_iv,
    benchmark.rbi_nbfc_cyber_2026_v
  ]
  tags = local.rbi_nbfc_cyber_2026_common_tags
}
