locals {
  soc_2_cc_4_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc4"
  })
}

benchmark "soc_2_cc_4" {
  title       = "CC4 Monitoring Activities"
  description = "The criteria relevant to how the entity (i) conducts ongoing and/or separate evaluations, and (ii) evaluates and communicates deficiencies."

  children = [
    benchmark.soc_2_cc_4_2
  ]

  tags = local.soc_2_cc_4_common_tags
}

benchmark "soc_2_cc_4_2" {
  title         = "CC4.2 COSO Principle 17: The entity evaluates and communicates internal control deficiencies in a timely manner to those parties responsible for taking corrective action, including senior management and the board of directors, as appropriate"
  documentation = file("./soc_2/docs/cc_4_2.md")

  children = [
    control.cloudwatch_alarm_action_enabled_check,
    control.guardduty_enabled,
    control.guardduty_finding_archived
  ]

  tags = merge(local.soc_2_cc_4_common_tags, {
    service       = "AWS/GuardDuty"
    soc_2_item_id = "4.2"
    soc_2_type    = "automated"
  })
}
