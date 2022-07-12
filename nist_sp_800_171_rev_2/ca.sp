benchmark "nist_sp_800_171_rev_2_3_12" {
  title       = "3.12 Assessment, Authorization, And Monitoring"
  description = "The Security Assessment and Authorization control family includes controls that supplement the execution of security assessments, authorizations, continuous monitoring, plan of actions and milestones, and system interconnections."
  children = [
    benchmark.nist_sp_800_171_rev_2_3_12_4
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_12_4" {
  title       = "3.12.4"
  description = "Develop, document, and periodically update system security plans that describe system boundaries, system environments of operation, how security requirements are implemented, and the relationships with or connections to other systems."
  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

