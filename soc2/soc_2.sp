locals {
  soc_2_common_tags = {
    soc_2 = "true"
    plugin             = "aws"
  }
}

benchmark "soc_2" {
  title       = "SOC 2"
  description = "System and Organization Controls (SOC) 2 is an auditing procedure that ensures a company's data is securely managed. AWS Audit Manager provides a prebuilt framework that supports SOC 2 to assist you with your audit preparation."
  children = [
    benchmark.cc_1,
    benchmark.cc_2,
    benchmark.cc_3,
    benchmark.cc_4,
    benchmark.cc_5,
    benchmark.cc_6,
    benchmark.cc_7,
    benchmark.cc_8,
    benchmark.cc_9,
    benchmark.cc_a_1,
    benchmark.cc_c_1,
    benchmark.p_1,
    benchmark.p_2,
    benchmark.p_3,
    benchmark.p_4,
    benchmark.p_5,
    benchmark.p_6,
    benchmark.p_7,
    benchmark.p_8
  ]
  tags = local.soc_2_common_tags
}
