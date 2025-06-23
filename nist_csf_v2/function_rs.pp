benchmark "nist_csf_v2_rs" {
  title       = "Respond (RS)"
  description = "Actions regarding a detected cybersecurity incident are taken."
  children = [
    benchmark.nist_csf_v2_rs_ma,
    benchmark.nist_csf_v2_rs_an,
    benchmark.nist_csf_v2_rs_co,
    benchmark.nist_csf_v2_rs_mi
  ]
}

benchmark "nist_csf_v2_rs_ma" {
  title       = "Incident Management (RS.MA)"
  description = "Responses to detected cybersecurity incidents are managed."
  children = [
    benchmark.nist_csf_v2_rs_ma_01,
    benchmark.nist_csf_v2_rs_ma_02,
    benchmark.nist_csf_v2_rs_ma_03,
    benchmark.nist_csf_v2_rs_ma_04,
    benchmark.nist_csf_v2_rs_ma_05
  ]
}

benchmark "nist_csf_v2_rs_an" {
  title       = "Incident Analysis (RS.AN)"
  description = "Investigations are conducted to ensure effective response and support forensics and recovery activities."
  children = [
    benchmark.nist_csf_v2_rs_an_03,
    benchmark.nist_csf_v2_rs_an_06,
    benchmark.nist_csf_v2_rs_an_07,
    benchmark.nist_csf_v2_rs_an_08
  ]
}

benchmark "nist_csf_v2_rs_co" {
  title       = "Incident Response Reporting and Communication (RS.CO)"
  description = "Response activities are coordinated with internal and external stakeholders as required by laws, regulations, or policies."
  children = [
    benchmark.nist_csf_v2_rs_co_02,
    benchmark.nist_csf_v2_rs_co_03
  ]
}

benchmark "nist_csf_v2_rs_mi" {
  title       = "Incident Mitigation (RS.MI)"
  description = "Activities are performed to prevent expansion of an event and mitigate its effects."
  children = [
    benchmark.nist_csf_v2_rs_mi_01,
    benchmark.nist_csf_v2_rs_mi_02
  ]
}

benchmark "nist_csf_v2_rs_ma_01" {
  title       = "The incident response plan is executed in coordination with relevant third parties once an incident is declared (RS.MA-01)"
  description = "The incident response plan is executed in coordination with relevant third parties once an incident is declared, ensuring effective and collaborative incident management."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.cloudtrail_trail_enabled,
    control.iam_group_user_role_no_inline_policies,
    control.sns_topic_notification_delivery_status_enabled
  ]
}

benchmark "nist_csf_v2_rs_ma_02" {
  title       = "Incident reports are triaged and validated (RS.MA-02)"
  description = "Incident reports are triaged and validated to ensure appropriate response and escalation."
  children = [
    control.securityhub_enabled,
    control.guardduty_finding_archived,
    control.cloudwatch_alarm_action_enabled,
    control.cloudtrail_trail_enabled
  ]
}

benchmark "nist_csf_v2_rs_ma_03" {
  title       = "Incidents are categorized and prioritized (RS.MA-03)"
  description = "Incidents are categorized and prioritized to ensure effective and timely response."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.guardduty_no_high_severity_findings,
    control.cloudwatch_alarm_action_enabled
  ]
}

benchmark "nist_csf_v2_rs_ma_04" {
  title       = "Incidents are escalated or elevated as needed (RS.MA-04)"
  description = "Incidents are escalated or elevated as needed to ensure timely and effective response, including notification, alerting, and support access."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.guardduty_no_high_severity_findings,
    control.guardduty_finding_archived,
    control.cloudwatch_alarm_action_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.cloudformation_stack_notifications_enabled,
    control.iam_support_role,
    control.iam_security_audit_role
  ]
}

benchmark "nist_csf_v2_rs_ma_05" {
  title       = "The criteria for initiating incident recovery are applied (RS.MA-05)"
  description = "The criteria for initiating incident recovery are applied, ensuring that recovery actions are triggered appropriately based on defined thresholds, alerts, and backup integrity."
  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_plan_region_configured,
    control.backup_recovery_point_encryption_enabled,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.backup_report_plan_configured,
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.sns_topic_notification_delivery_status_enabled
  ]
}

benchmark "nist_csf_v2_rs_an_03" {
  title       = "Analysis is performed to establish what has taken place during an incident and the root cause of the incident (RS.AN-03)"
  description = "Analysis is performed to establish what has taken place during an incident and the root cause of the incident, leveraging forensic evidence, log retention, and centralized findings."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.log_metric_filter_cloudtrail_configuration,
    control.guardduty_finding_archived,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled
  ]
}

benchmark "nist_csf_v2_rs_an_06" {
  title       = "Actions performed during an investigation are recorded, and the records' integrity and provenance are preserved (RS.AN-06)"
  description = "Actions performed during an investigation are recorded, and the records' integrity and provenance are preserved through comprehensive logging, retention, and validation controls."
  children = [
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.log_metric_filter_cloudtrail_configuration,
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived
  ]
}

benchmark "nist_csf_v2_rs_an_07" {
  title       = "Incident data and metadata are collected, and their integrity and provenance are preserved (RS.AN-07)"
  description = "Incident data and metadata are collected, and their integrity and provenance are preserved through comprehensive logging, retention, and validation controls."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.cloudwatch_log_group_retention_period_365,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.log_metric_filter_cloudtrail_configuration,
    control.guardduty_finding_archived
  ]
}

benchmark "nist_csf_v2_rs_an_08" {
  title       = "An incident's magnitude is estimated and validated (RS.AN-08)"
  description = "An incident's magnitude is estimated and validated using centralized findings, severity filters, alerting, and log validation controls."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.guardduty_no_high_severity_findings,
    control.guardduty_finding_archived,
    control.cloudwatch_alarm_action_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.sns_topic_notification_delivery_status_enabled
  ]
}

benchmark "nist_csf_v2_rs_co_02" {
  title       = "Internal and external stakeholders are notified of incidents (RS.CO-02)"
  description = "Internal and external stakeholders are notified of incidents through automated notifications, alarms, and event triggers, ensuring timely and secure communication."
  children = [
    control.sns_topic_notification_delivery_status_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.s3_bucket_event_notifications_enabled,
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.sns_topic_policy_prohibit_public_access
  ]
}

benchmark "nist_csf_v2_rs_co_03" {
  title       = "Information is shared with designated internal and external stakeholders (RS.CO-03)"
  description = "Information is shared with designated internal and external stakeholders through secure, automated, and auditable notifications, alarms, and event triggers."
  children = [
    control.sns_topic_notification_delivery_status_enabled,
    control.cloudwatch_alarm_action_enabled,
    control.s3_bucket_event_notifications_enabled,
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.sns_topic_policy_prohibit_public_access
  ]
}

benchmark "nist_csf_v2_rs_mi_01" {
  title       = "Incidents are contained (RS.MI-01)"
  description = "Incidents are contained through detection, alerting, and automated or manual actions to block, restrict, or isolate threats and prevent incident expansion."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.cloudwatch_alarm_action_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.s3_bucket_event_notifications_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]
}

benchmark "nist_csf_v2_rs_mi_02" {
  title       = "Incidents are eradicated (RS.MI-02)"
  description = "Incidents are eradicated through detection, alerting, and automated or manual actions to remove, remediate, or eliminate threats and prevent recurrence."
  children = [
    control.securityhub_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.cloudwatch_alarm_action_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.sns_topic_notification_delivery_status_enabled,
    control.s3_bucket_event_notifications_enabled,
    control.networkfirewall_firewall_logging_enabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]
}
