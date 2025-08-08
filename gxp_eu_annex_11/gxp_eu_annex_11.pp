locals {
  gxp_eu_annex_11_common_tags = merge(local.aws_compliance_common_tags, {
    gxp_eu_annex_11 = "true"
    type            = "Benchmark"
  })
}

benchmark "gxp_eu_annex_11" {
  title         = "AWS GxP EU Annex 11"
  description   = "EU Annex 11 is the European equivalent to FDA 21 CFR part 11 for the United States. This annex applies to all forms of computerized systems used as part of a GMP regulated activities. A computerized system is a set of software and hardware components which together fulfill certain functionalities. The application should be validated; IT infrastructure should be qualified. Where a computerized system replaces a manual operation, there should be no resultant decrease in product quality, process control or quality assurance. There should be no increase in the overall risk of the process."
  documentation = file("./gxp_eu_annex_11/docs/gxp_eu_annex_11_overview.md")
  children = [
    benchmark.gxp_eu_annex_11_general,
    benchmark.gxp_eu_annex_11_operational_phase,
    benchmark.gxp_eu_annex_11_project_phase
  ]

  tags = local.gxp_eu_annex_11_common_tags
}
