locals {
  gxp_eu_annex_11_common_tags = merge(local.aws_compliance_common_tags, {
    gxp_eu_annex_11 = "true"
    type            = "Benchmark"
  })
}

benchmark "gxp_eu_annex_11" {
  title         = "GxP EU Annex 11"
  description   = "EU Annex 11 is the European equivalent to FDA 21 CFR part 11 for the United States. This annex applies to all forms of computerized systems used as part of a GMP regulated activities. A computerized system is a set of software and hardware components which together fulfill certain functionalities. The application should be validated; IT infrastructure should be qualified. Where a computerized system replaces a manual operation, there should be no resultant decrease in product quality, process control or quality assurance. There should be no increase in the overall risk of the process."
  documentation = file("./gxp_eu_annex_11/docs/gxp_eu_annex_11_overview.md")
  children = [
    benchmark.gxp_eu_annex_11_1,
    benchmark.gxp_eu_annex_11_4_2,
    benchmark.gxp_eu_annex_11_4_5,
    benchmark.gxp_eu_annex_11_4_6,
    benchmark.gxp_eu_annex_11_4_8,
    benchmark.gxp_eu_annex_11_5,
    benchmark.gxp_eu_annex_11_7_1,
    benchmark.gxp_eu_annex_11_7_2,
    benchmark.gxp_eu_annex_11_8_2,
    benchmark.gxp_eu_annex_11_9,
    benchmark.gxp_eu_annex_11_10,
    benchmark.gxp_eu_annex_11_12_4,
    benchmark.gxp_eu_annex_11_16,
    benchmark.gxp_eu_annex_11_17,
  ]

  tags = local.gxp_eu_annex_11_common_tags
}