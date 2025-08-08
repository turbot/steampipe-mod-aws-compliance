locals {
  gxp_21_cfr_part_11_common_tags = merge(local.aws_compliance_common_tags, {
    gxp_21_cfr_part_11 = "true"
    type               = "Benchmark"
  })
}

benchmark "gxp_21_cfr_part_11" {
  title         = "AWS GxP 21 CFR Part 11"
  description   = "The overall intent of GxP requirements is to ensure that food and medical products are safe for consumers and to ensure the integrity of data used to make product-related safety decisions."
  documentation = file("./gxp_21_cfr_part_11/docs/gxp_21_cfr_part_11_overview.md")
  children = [
    benchmark.gxp_21_cfr_part_11_11_10,
    benchmark.gxp_21_cfr_part_11_11_30,
    benchmark.gxp_21_cfr_part_11_11_200,
    benchmark.gxp_21_cfr_part_11_11_300
  ]

  tags = local.gxp_21_cfr_part_11_common_tags
}
