locals {
  ffiec_common_tags = merge(local.aws_compliance_common_tags, {
    ffiec = "true"
    type  = "Benchmark"
  })
}

benchmark "ffiec" {
  title       = "AWS Federal Financial Institutions Examination Council (FFIEC)"
  description = "Federal Financial Institutions Examination Council (FFIEC) developed the Cybersecurity Assessment Tool (Assessment) to help institutions identify their risks and determine their cybersecurity preparedness."
  documentation = file("./ffiec/docs/ffiec_overview.md")
  children = [
    benchmark.ffiec_d_1,
    benchmark.ffiec_d_2,
    benchmark.ffiec_d_3,
    benchmark.ffiec_d_4,
    benchmark.ffiec_d_5
  ]

  tags = local.ffiec_common_tags
}
