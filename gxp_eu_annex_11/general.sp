benchmark "gxp_eu_annex_11_general" {
  title       = "General"
  description = "This section focuses on more human oriented checks that leverages risk management, personnel verification of process owners, suppliers and service providers agreement reviews, supplier audit and review documentation for COTS."
  children = [
    benchmark.gxp_eu_annex_11_general_1
  ]

  tags = local.gxp_eu_annex_11_common_tags
}

benchmark "gxp_eu_annex_11_general_1" {
  title       = "1 Risk Management"
  description = "Risk management should be applied throughout the lifecycle of the computerised system taking into account patient safety, data integrity and product quality. As part of a risk management system, decisions on the extent of validation and data integrity controls should be based on a justified and documented risk assessment of the computerised system."
  children = [
    control.cloudtrail_trail_enabled,
    control.config_enabled_all_regions,
    control.securityhub_enabled
  ]

  tags = local.gxp_eu_annex_11_common_tags
}
