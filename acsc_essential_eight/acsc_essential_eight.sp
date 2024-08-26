locals {
  acsc_essential_eight_common_tags = merge(local.aws_compliance_common_tags, {
    acsc_essential_eight = "true"
    type                 = "Benchmark"
  })
}

benchmark "acsc_essential_eight" {
  title         = "Australian Cyber Security Center (ACSC) Essential Eight"
  description   = "."
  documentation = file("./acsc_essential_eight/docs/acsc_essential_eight_overview.md")
  children = [
  ]

  tags = merge(local.acsc_essential_eight_common_tags, {
    type = "Benchmark"
  })
}
