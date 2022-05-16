locals {
  fedramp_low_rev_4_common_tags = merge(local.aws_compliance_common_tags, {
    fedramp_low_rev_4_low_rev_4 = "true"
    type                        = "Benchmark"
  })
}

benchmark "fedramp_low_rev_4" {
  title         = "Federal Risk and Authorization Management Program (FedRAMP Low)"
  description   = "The Federal Risk and Authorization Management Program (FedRAMP) is a US government-wide program that delivers a standard approach to the security assessment, authorization, and continuous monitoring for cloud products and services."
  children = [
    benchmark.fedramp_low_rev_4_ac,
    benchmark.fedramp_low_rev_4_au,
    benchmark.fedramp_low_rev_4_ca,
    benchmark.fedramp_low_rev_4_cm,
    benchmark.fedramp_low_rev_4_cp,
    benchmark.fedramp_low_rev_4_ia,
    benchmark.fedramp_low_rev_4_ir,
    benchmark.fedramp_low_rev_4_sa,
    benchmark.fedramp_low_rev_4_sc,
    benchmark.fedramp_low_rev_4_si
  ]

  tags = local.fedramp_low_rev_4_common_tags
}
