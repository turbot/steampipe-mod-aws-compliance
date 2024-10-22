benchmark "ffiec_d_2" {
  title       = "Threat Intelligence and Collaboration (Domain 2)"
  description = "Threat intelligence and collaboration includes processes to effectively discover, analyze, and understand cyber threats, with the capability to share information internally and with appropriate third parties."
  children = [
    benchmark.ffiec_d_2_is,
    benchmark.ffiec_d_2_ma,
    benchmark.ffiec_d_2_ti
  ]

  tags = local.ffiec_common_tags
}
