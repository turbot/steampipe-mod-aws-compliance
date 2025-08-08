locals {
  cis_compute_service_v100_common_tags = merge(local.aws_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.0.0"
  })
}

benchmark "cis_compute_service_v100" {
  title         = "AWS CIS Compute Services Benchmark v1.0.0"
  description   = "This CIS AWS Compute Services Benchmark provides prescriptive guidance for configuring security options for the services within the Compute category in AWS. This Benchmark is intended to be used in conjunction with the CIS Amazon Web Services Foundations Benchmark."
  documentation = file("./cis_compute_service_v100/docs/cis_overview.md")
  children = [
    benchmark.cis_compute_service_v100_2,
    benchmark.cis_compute_service_v100_3,
    benchmark.cis_compute_service_v100_4,
    benchmark.cis_compute_service_v100_5,
    benchmark.cis_compute_service_v100_6,
    benchmark.cis_compute_service_v100_10,
    benchmark.cis_compute_service_v100_11
  ]

  tags = merge(local.cis_compute_service_v100_common_tags, {
    type = "Benchmark"
  })
}
