locals {
  soc_2_cc_3_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc3"
  })
}

benchmark "cc_3" {
  title       = "CC3.0 - Common Criteria Related to Risk Assessment"
  description = "The criteria relevant to how the entity (i) specifies suitable objectives, (ii) identifies and analyzes risk, and (iii) assess fraud risk."

  children = [
    benchmark.cc_3_1
  ]

  tags = local.soc_2_cc_3_common_tags
}

benchmark "cc_3_1" {
  title         = "CC3.1 COSO Principle 6: The entity specifies objectives with sufficient clarity to enable the identification and assessment of risks relating to objectives."
  documentation = file("./soc2/docs/cc_3_1.md")

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.config_enabled_all_regions
  ]

  tags = merge(local.soc_2_cc_3_common_tags, {
    soc_2_item_id = "3.1"
    soc_2_type    = "automated"
  })
}
