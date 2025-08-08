locals {
  acsc_essential_eight_common_tags = merge(local.aws_compliance_common_tags, {
    acsc_essential_eight = "true"
    type                 = "Benchmark"
  })
}

benchmark "acsc_essential_eight" {
  title         = "AWS Australian Cyber Security Center (ACSC) Essential Eight"
  description   = "The Australian Cyber Security Center (ACSC) Essential Eight is a set of baseline security strategies designed to mitigate cyber security incidents. The Essential Eight is a prioritized list of mitigation strategies that organizations can implement to protect their systems against a range of adversaries. The Essential Eight is based on the Australian Signals Directorate (ASD) Strategies to Mitigate Cyber Security Incidents."
  documentation = file("./acsc_essential_eight/docs/acsc_essential_eight_overview.md")
  children = [
    benchmark.acsc_essential_eight_ml_1,
    benchmark.acsc_essential_eight_ml_2,
    benchmark.acsc_essential_eight_ml_3
  ]

  tags = merge(local.acsc_essential_eight_common_tags, {
    type = "Benchmark"
  })
}
