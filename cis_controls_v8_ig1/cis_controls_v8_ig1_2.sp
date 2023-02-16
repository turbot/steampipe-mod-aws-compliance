benchmark "cis_controls_v8_ig1_2" {
  title       = "Inventory and Control of Software Assets"
  description = "."
  children = [
    benchmark.cis_controls_v8_ig1_2_2
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}


benchmark "cis_controls_v8_ig1_2_2" {
  title       = "2.2 - Ensure Authorized Software is Currently Supported"
  description = "Ensure that only currently supported software is designated as authorized in the software inventory for enterprise assets. If software is unsupported, yet necessary for the fulfillment of the enterprise’s mission, document an exception detailing mitigating controls and residual risk acceptance. For any unsupported software without an exception documentation, designate as unauthorized. Review the software list to verify software support at least monthly, or more frequently."
  children = [
    # -- control.ELASTIC_BEANSTALK_MANAGED_UPDATES_ENABLED
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}