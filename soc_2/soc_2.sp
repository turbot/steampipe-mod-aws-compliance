locals {
  soc_2_common_tags = merge(local.aws_compliance_common_tags, {
    soc_2 = "true"
    type  = "Benchmark"
  })
}

benchmark "soc_2" {
  title         = "SOC 2"
  description   = "System and Organization Controls (SOC) 2 is an auditing procedure that ensures a company's data is securely managed. AWS Audit Manager provides a prebuilt framework that supports SOC 2 to assist you with your audit preparation."
  documentation = file("./soc_2/docs/soc_2_overview.md")
  children = [
    benchmark.soc_2_cc_1,
    benchmark.soc_2_cc_2,
    benchmark.soc_2_cc_3,
    benchmark.soc_2_cc_4,
    benchmark.soc_2_cc_6,
    benchmark.soc_2_cc_7,
    benchmark.soc_2_cc_8,
    benchmark.soc_2_a_1,
    benchmark.soc_2_c_1
  ]
  tags = local.soc_2_common_tags
}
