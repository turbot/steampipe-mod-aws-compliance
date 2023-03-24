locals {
  soc_2_cc_2_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc2"
  })
}

benchmark "soc_2_cc_2" {
  title       = "CC2 Common Criteria Related to Communication and Information"
  description = "The criteria relevant to how the entity (i) uses relevant information, (ii) communicates internally, and (iii) communicates externally."

  children = [
    benchmark.soc_2_cc_2_1
  ]

  tags = local.soc_2_cc_2_common_tags
}

benchmark "soc_2_cc_2_1" {
  title       = "CC2.1 COSO Principle 13: The entity obtains or generates and uses relevant, quality information to support the functioning of internal control"
  documentation = file("./soc_2/docs/cc_2_1.md")

  children = [
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_security_trail_enabled,
    control.config_enabled_all_regions
  ]

  tags = merge(local.soc_2_cc_2_common_tags, {
    soc_2_item_id = "2.1"
    soc_2_type    = "automated"
  })
}
