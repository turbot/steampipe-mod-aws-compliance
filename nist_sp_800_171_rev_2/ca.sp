benchmark "nist_sp_800_171_rev_2_3_12" {
  title       = "3.12 Assessment, Authorization, And Monitoring"
  description = "The Security Assessment and Authorization control family includes controls that supplement the execution of security assessments, authorizations, continuous monitoring, plan of actions and milestones, and system interconnections."
  children = [
    benchmark.nist_sp_800_171_rev_2_3_12_4
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_12_4" {
  title       = "3.12.4 Develop, document, and periodically update system security plans that describe system boundaries, system environments of operation, how security requirements are implemented, and the relationships with or connections to other systems"
  description = "System security plans relate security requirements to a set of security controls. System security plans also describe, at a high level, how the security controls meet those security requirements, but do not provide detailed, technical descriptions of the design or implementation of the controls. System security plans contain sufficient information to enable a design and implementation that is unambiguously compliant with the intent of the plans and subsequent determinations of risk if the plan is implemented as intended. Security plans need not be single documents; the plans can be a collection of various documents including documents that already exist. Effective security plans make extensive use of references to policies, procedures, and additional documents (e.g., design and implementation specifications) where more detailed information can be obtained. This reduces the documentation requirements associated with security programs and maintains security-related information in other established management/operational areas related to enterprise architecture, system development life cycle, systems engineering, and acquisition. Federal agencies may consider the submitted system security plans and plans of action as critical inputs to an overall risk management decision to process, store, or transmit CUI on a system hosted by a nonfederal organization and whether it is advisable to pursue an agreement or contract with the nonfederal organization."
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

