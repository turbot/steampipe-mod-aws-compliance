locals {
  soc_2_cc_7_common_tags = merge(local.soc_2_common_tags, {
    soc_2_section_id = "cc7"
  })
}

benchmark "cc_7" {
  title       = "CC7.0 - System Operations"
  description = "The criteria relevant to how an entity (i) manages the operation of system(s) and (ii) detects and mitigates processing deviations including logical and physical security deviations."

  children = [
    benchmark.cc_7_1,
    benchmark.cc_7_2,
    benchmark.cc_7_3,
    benchmark.cc_7_4,
    control.cc_7_5
  ]

  tags = local.soc_2_cc_7_common_tags
}

benchmark "cc_7_1" {
  title         = "CC7.1 To meet its objectives, the entity uses detection and monitoring procedures to identify (1) changes to configurations that result in the introduction of new vulnerabilities, and (2) susceptibilities to newly discovered vulnerabilities"
  documentation = file("./soc2/docs/cc_7_1.md")

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = merge(local.soc_2_cc_7_common_tags, {
    soc_2_item_id = "7.1"
    soc_2_type    = "automated"
  })
}

benchmark "cc_7_2" {
  title         = "CC7.2 The entity monitors system components and the operation of those components for anomalies that are indicative of malicious acts, natural disasters, and errors affecting the entity's ability to meet its objectives; anomalies are analyzed to determine whether they represent security events"
  documentation = file("./soc2/docs/cc_7_2.md")

  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.lambda_function_dead_letter_queue_configured
  ]

  tags = merge(local.soc_2_cc_7_common_tags, {
    soc_2_item_id = "7.2"
    soc_2_type    = "automated"
  })
}

benchmark "cc_7_3" {
  title         = "CC7.3 The entity evaluates security events to determine whether they could or have resulted in a failure of the entity to meet its objectives (security incidents) and, if so, takes actions to prevent or address such failures"
  documentation = file("./soc2/docs/cc_7_3.md")

  children = [
    control.log_group_encryption_at_rest_enabled,
    control.cloudtrail_trail_validation_enabled
  ]

  tags = merge(local.soc_2_cc_7_common_tags, {
    soc_2_item_id = "7.3"
    soc_2_type    = "automated"
  })
}

benchmark "cc_7_4" {
  title         = "CC7.4 The entity responds to identified security incidents by executing a defined incident response program to understand, contain, remediate, and communicate security incidents, as appropriate"
  documentation = file("./soc2/docs/cc_7_4.md")

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
  ]

  tags = merge(local.soc_2_cc_7_common_tags, {
    soc_2_item_id = "7.4"
    soc_2_type    = "automated"
  })
}

control "cc_7_5" {
  title         = "CC7.5 The entity identifies, develops, and implements activities to recover from identified security incidents"
  sql           = query.manual_control.sql
  documentation = file("./soc2/docs/cc_7_5.md")

  tags = merge(local.soc_2_cc_7_common_tags, {
    soc_2_item_id = "7.5"
    soc_2_type    = "manual"
  })
}