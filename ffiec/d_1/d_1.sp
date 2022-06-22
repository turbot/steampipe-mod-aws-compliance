locals {
  d_1_common_tags = merge(local.ffiec_common_tags, {
    ffiec_domain = "1"
  })
}

benchmark "d_1" {
  title         = "Cyber Risk Management and Oversight (Domain 1)"
  description = "Cyber risk management and oversight addresses the board of directors' (board's) oversight and management's development and implementation of an effective enterprise-wide cybersecurity program with comprehensive policies and procedures for establishing appropriate accountability and oversight."
  children = [
    benchmark.d_1_g,
    benchmark.d_1_rm
  ]

  tags = local.d_1_common_tags

}
