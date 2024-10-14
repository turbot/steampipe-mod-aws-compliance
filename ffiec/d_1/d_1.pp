benchmark "ffiec_d_1" {
  title       = "Cyber Risk Management and Oversight (Domain 1)"
  description = "Cyber risk management and oversight addresses the board of directors' (board's) oversight and management's development and implementation of an effective enterprise-wide cybersecurity program with comprehensive policies and procedures for establishing appropriate accountability and oversight."
  children = [
    benchmark.ffiec_d_1_g,
    benchmark.ffiec_d_1_rm
  ]

  tags = local.ffiec_common_tags
}
