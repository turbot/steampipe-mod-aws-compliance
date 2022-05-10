locals {
  fedramp_common_tags = merge(local.aws_compliance_common_tags, {
    fedramp = "true"
  })
}

benchmark "fedramp" {
  title         = "Federal Risk and Authorization Management Program"
  description   = "The Federal Risk and Authorization Management Program (FedRAMP) is a US government-wide program that delivers a standard approach to the security assessment, authorization, and continuous monitoring for cloud products and services."
  children = [
    benchmark.fedramp_ac,
    benchmark.fedramp_au,
    benchmark.fedramp_ca,
    benchmark.fedramp_cm,
    benchmark.fedramp_cp,
    benchmark.fedramp_ia,
    benchmark.fedramp_ir,
    benchmark.fedramp_ra,
    benchmark.fedramp_sa,
    benchmark.fedramp_sc,
    benchmark.fedramp_si,
  ]

  tags = merge(local.fedramp_common_tags, {
    type = "Benchmark"
  })
}
