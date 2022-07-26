locals {
  cis_supply_chain_v100_common_tags = merge(local.aws_compliance_common_tags, {
    cis         = "true"
    cis_version = "v1.0.0"
  })
}

benchmark "cis_supply_chain_v100" {
  title         = "CIS Supply Chain v1.0.0"
  description   = "The CIS Amazon Web Services Foundations Benchmark for Software Supply Chain Security provides prescriptive guidance for configuring security options for a subset of Amazon Web Services with an emphasis on auditing the entire SDLC process, where it can reveal risks from code time into deploy time."
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_overview.md")
  children = [
    benchmark.cis_supply_chain_v100_2
  ]

  tags = merge(local.cis_supply_chain_v100_common_tags, {
    type = "Benchmark"
  })
}
