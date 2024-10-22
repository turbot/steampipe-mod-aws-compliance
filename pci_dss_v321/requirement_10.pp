locals {
  pci_dss_v321_requirement_10_common_tags = merge(local.pci_dss_v321_common_tags, {
    control_set = "10"
  })
}

benchmark "pci_dss_v321_requirement_10" {
  title       = "Requirement 10: Track and monitor all access to network resources and cardholder data"
  description = "Logging mechanisms and the ability to track user activities are critical in preventing, detecting, or minimizing the impact of a data compromise. The presence of logs in all environments allows thorough tracking, alerting, and analysis when something does go wrong."

  children = [
    benchmark.pci_dss_v321_requirement_10_1,
    benchmark.pci_dss_v321_requirement_10_2,
    benchmark.pci_dss_v321_requirement_10_3,
    benchmark.pci_dss_v321_requirement_10_5,
    benchmark.pci_dss_v321_requirement_10_7,
    benchmark.pci_dss_v321_requirement_10_8
  ]

  tags = local.pci_dss_v321_requirement_10_common_tags
}

benchmark "pci_dss_v321_requirement_10_1" {
  title       = "10.1 Implement audit trails to link all access to system components to each individual user"
  description = "It is critical to have a process or system that links user access to system components accessed. This system generates audit logs and provides the ability to trace back suspicious activity to a specific user. This control verifies, through observation and interviewing the system administrator, that: audit trails are enabled and active for system components, access to system components is linked to individual users."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled_check,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.waf_web_acl_logging_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.1"
  })
}

benchmark "pci_dss_v321_requirement_10_2" {
  title       = "10.2 Through interviews of responsible personnel, observation of audit logs, and examination of audit log settings"
  description = "It is critical to have a process or system that links user access to system components accessed. This system generates audit logs and provides the ability to trace back suspicious activity to a specific user. This control verifies, through observation and interviewing the system administrator, that: audit trails are enabled and active for system components, access to system components is linked to individual users."

  children = [
    benchmark.pci_dss_v321_requirement_10_2_1,
    benchmark.pci_dss_v321_requirement_10_2_2,
    benchmark.pci_dss_v321_requirement_10_2_3,
    benchmark.pci_dss_v321_requirement_10_2_4,
    benchmark.pci_dss_v321_requirement_10_2_5,
    benchmark.pci_dss_v321_requirement_10_2_6,
    benchmark.pci_dss_v321_requirement_10_2_7,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch,
    control.redshift_cluster_audit_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2"
  })
}

benchmark "pci_dss_v321_requirement_10_2_1" {
  title       = "10.2.1 All individual user accesses to cardholder data"
  description = "Malicious individuals could obtain knowledge of a user account with access to systems in the CDE, or they could create a new, unauthorized account in order to access cardholder data. A record of all individual accesses to cardholder data can identify which accounts may have been compromised or misused. This control verifies all individual access to cardholder data is loggedVerify all individual access to cardholder data is logged."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2.1"
  })
}

benchmark "pci_dss_v321_requirement_10_2_2" {
  title       = "10.2.2 All actions taken by any individual with root or administrative privileges"
  description = "Accounts with increased privileges, such as the “administrator” or “root” account, have the potential to greatly impact the security or operational functionality of a system. Without a log of the activities performed, an organization is unable to trace any issues resulting from an administrative mistake or misuse of privilege back to the specific action and individual. This control verifies all actions taken by any individual with root or administrative privileges are logged."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2.2"
  })
}

benchmark "pci_dss_v321_requirement_10_2_3" {
  title       = "10.2.3 Access to all audit trails"
  description = "Malicious users often attempt to alter audit logs to hide their actions, and a record of access allows an organization to trace any inconsistencies or potential tampering of the logs to an individual account. Having access to logs identifying changes, additions, and deletions can help retrace steps made by unauthorized personnel. This control verifies access to all audit trails is logged."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2.3"
  })
}

benchmark "pci_dss_v321_requirement_10_2_4" {
  title       = "10.2.4 Invalid logical access attempts"
  description = "Malicious users often attempt to alter audit logs to hide their actions, and a record of access allows an organization to trace any inconsistencies or potential tampering of the logs to an individual account. Having access to logs identifying changes, additions, and deletions can help retrace steps made by unauthorized personnel. This control verifies access to all audit trails is logged."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2.4"
  })
}

benchmark "pci_dss_v321_requirement_10_2_5" {
  title       = "10.2.5 Use of and changes to identification and authentication mechanisms—including but not limited to creation of new accounts and elevation of privileges—and all changes, additions, or deletions to accounts with root or administrative privileges"
  description = "Without knowing who was logged on at the time of an incident, it is impossible to identify the accounts that may have been used. Additionally, malicious users may attempt to manipulate the authentication controls with the intent of bypassing them or impersonating a valid account."
  children = [
    benchmark.pci_dss_v321_requirement_10_2_5_a
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2.5"
  })
}

benchmark "pci_dss_v321_requirement_10_2_5_a" {
  title       = "10.2.5.a Verify use of identification and authentication mechanisms is logged"
  description = "Without knowing who was logged on at the time of an incident, it is impossible to identify the accounts that may have been used. Additionally, malicious users may attempt to manipulate the authentication controls with the intent of bypassing them or impersonating a valid account."
  children = [
    control.cloudtrail_trail_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2.5.a"
  })
}

benchmark "pci_dss_v321_requirement_10_2_6" {
  title       = "10.2.6 Initialization, stopping, or pausing of the audit logs"
  description = "Turning the audit logs off (or pausing them) prior to performing illicit activities is a common practice for malicious users wishing to avoid detection. Initialization of audit logs could indicate that the log function was disabled by a user to hide their actions. This control verifies the following are logged: initialization of audit logs, stopping or pausing of audit logs."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2.6"
  })
}

benchmark "pci_dss_v321_requirement_10_2_7" {
  title       = "10.2.7 Creation and deletion of system- level objects"
  description = "Malicious software, such as malware, often creates or replaces system level objects on the target system in order to control a particular function or operation on that system. By logging when system-level objects, such as database tables or stored procedures, are created or deleted, it will be easier to determine whether such modifications were authorized. This control verifies creation and deletion of system level objects are logged."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.2.7"
  })
}

benchmark "pci_dss_v321_requirement_10_3" {
  title       = "10.3 Record at least the following audit trail entries for all system components for each event"
  description = "By recording these details for the auditable events at 10.2, a potential compromise can be quickly identified, and with sufficient detail to know who, what, where, when, and how. Through interviews and observation of audit logs, for each auditable event (from 10.2), perform the following:"

  children = [
    benchmark.pci_dss_v321_requirement_10_3_1,
    benchmark.pci_dss_v321_requirement_10_3_2,
    benchmark.pci_dss_v321_requirement_10_3_3,
    benchmark.pci_dss_v321_requirement_10_3_4,
    benchmark.pci_dss_v321_requirement_10_3_5,
    benchmark.pci_dss_v321_requirement_10_3_6,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.3"
  })
}

benchmark "pci_dss_v321_requirement_10_3_1" {
  title       = "10.3.1 User identification"
  description = "By recording these details for the auditable events at 10.2, a potential compromise can be quickly identified, and with sufficient detail to know who, what, where, when, and how. This control verifies user identification is included in log entries."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.3.1"
  })
}

benchmark "pci_dss_v321_requirement_10_3_2" {
  title       = "10.3.2 Type of event"
  description = "By recording these details for the auditable events at 10.2, a potential compromise can be quickly identified, and with sufficient detail to know who, what, where, when, and how. This control verifies event is included in log entries."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.3.2"
  })
}

benchmark "pci_dss_v321_requirement_10_3_3" {
  title       = "10.3.3 Date and time"
  description = "By recording these details for the auditable events at 10.2, a potential compromise can be quickly identified, and with sufficient detail to know who, what, where, when, and how. This verifies date and time stamp is included in log entries."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.3.3"
  })
}

benchmark "pci_dss_v321_requirement_10_3_4" {
  title       = "10.3.4 Success or failure indication"
  description = "By recording these details for the auditable events at 10.2, a potential compromise can be quickly identified, and with sufficient detail to know who, what, where, when, and how. This control verifies success or failure indication is included in log entries."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.3.4"
  })
}

benchmark "pci_dss_v321_requirement_10_3_5" {
  title       = "10.3.5 Origination of event"
  description = "By recording these details for the auditable events at 10.2, a potential compromise can be quickly identified, and with sufficient detail to know who, what, where, when, and how. This control verifies origination of event is included in log entries."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.3.5"
  })
}

benchmark "pci_dss_v321_requirement_10_3_6" {
  title       = "10.3.6 Identity or name of affected data, system component, or resource"
  description = "By recording these details for the auditable events at 10.2, a potential compromise can be quickly identified, and with sufficient detail to know who, what, where, when, and how. This control verifies identity or name of affected data, system component, or resources is included in log entries."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.3.6"
  })
}

benchmark "pci_dss_v321_requirement_10_5" {
  title       = "10.5 Interview system administrators and examine system configurations and permissions to verify that audit trails are secured so that they cannot be altered"
  description = "Often a malicious individual who has entered the network will attempt to edit the audit logs in order to hide their activity. Without adequate protection of audit logs, their completeness, accuracy, and integrity cannot be guaranteed, and the audit logs can be rendered useless as an investigation tool after a compromise. This control checks secure audit trails so they cannot be altered."

  children = [
    benchmark.pci_dss_v321_requirement_10_5_2,
    benchmark.pci_dss_v321_requirement_10_5_3,
    benchmark.pci_dss_v321_requirement_10_5_4,
    benchmark.pci_dss_v321_requirement_10_5_5,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.5"
  })
}

benchmark "pci_dss_v321_requirement_10_5_2" {
  title       = "10.5.2 Current audit trail files are protected from unauthorized modifications via access control mechanisms, physical segregation, and/or network segregation"
  description = "Adequate protection of the audit logs includes strong access control (limit access to logs based on “need to know” only), and use of physical or network segregation to make the logs harder to find and modify. Promptly backing up the logs to a centralized log server or media that is difficult to alter keeps the logs protected even if the system generating the logs becomes compromised. Protect audit trail files from unauthorized modifications."

  children = [
    control.cloudtrail_trail_validation_enabled,
    control.config_enabled_all_regions,
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.5.2"
  })
}

benchmark "pci_dss_v321_requirement_10_5_3" {
  title       = "10.5.3 Current audit trail files are promptly backed up to a centralized log server or media that is difficult to alter"
  description = "Adequate protection of the audit logs includes strong access control (limit access to logs based on “need to know” only), and use of physical or network segregation to make the logs harder to find and modify. Promptly backing up the logs to a centralized log server or media that is difficult to alter keeps the logs protected even if the system generating the logs becomes compromised. Promptly back up audit trail files to a centralized log server or media that is difficult to alter."

  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.5.3"
  })
}

benchmark "pci_dss_v321_requirement_10_5_4" {
  title       = "10.5.4 Logs for external-facing technologies (for example, wireless, firewalls, DNS, mail) are written onto a secure, centralized, internal log server or media"
  description = "By writing logs from external-facing technologies such as wireless, firewalls, DNS, and mail servers, the risk of those logs being lost or altered is lowered, as they are more secure within the internal network. Logs may be written directly, or offloaded or copied from external systems, to the secure internal system or media."

  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.5.4"
  })
}

benchmark "pci_dss_v321_requirement_10_5_5" {
  title       = "10.5.5 Examine system settings, monitored files, and results from monitoring activities to verify the use of file-integrity monitoring or change-detection software on logs"
  description = "File-integrity monitoring or change-detection systems check for changes to critical files, and notify when such changes are noted. For file- integrity monitoring purposes, an entity usually monitors files that don't regularly change, but when changed indicate a possible compromise."

  children = [
    control.cloudtrail_trail_validation_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.5.5"
  })
}

benchmark "pci_dss_v321_requirement_10_7" {
  title       = "10.7 Retain audit trail history for at least one year, with a minimum of three months immediately available for analysis (for example, online, archived, or restorable from backup)"
  description = "Retaining logs for at least a year allows for the fact that it often takes a while to notice that a compromise has occurred or is occurring, and allows investigators sufficient log history to better determine the length of time of a potential breach and potential system(s) impacted. By having three months of logs immediately available, an entity can quickly identify and minimize impact of a data breach. Storing logs in off-line locations could prevent them from being readily available, resulting in longer time frames to restore log data, perform analysis, and identify impacted systems or data."

  children = [
    benchmark.pci_dss_v321_requirement_10_7_a,
    benchmark.pci_dss_v321_requirement_10_7_b,
    benchmark.pci_dss_v321_requirement_10_7_c,
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.7"
  })
}

benchmark "pci_dss_v321_requirement_10_7_a" {
  title       = "10.7.a Examine security policies and procedures to verify that they define audit log retention policies and procedures for retaining audit logs for at least one year, with a minimum of three months immediately available online"
  description = "Retaining logs for at least a year allows for the fact that it often takes a while to notice that a compromise has occurred or is occurring, and allows investigators sufficient log history to better determine the length of time of a potential breach and potential system(s) impacted. By having three months of logs immediately available, an entity can quickly identify and minimize impact of a data breach. Storing logs in off-line locations could prevent them from being readily available, resulting in longer time frames to restore log data, perform analysis, and identify impacted systems or data."

  children = [
    control.backup_plan_min_retention_35_days,
    control.backup_recovery_point_manual_deletion_disabled,
    control.backup_recovery_point_min_retention_35_days,
    control.s3_bucket_lifecycle_policy_enabled,
    control.s3_bucket_versioning_and_lifecycle_policy_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.7.a"
  })
}

benchmark "pci_dss_v321_requirement_10_7_b" {
  title       = "10.7.b Interview personnel and examine audit logs to verify that audit logs are retained for at least one year"
  description = "Retaining logs for at least a year allows for the fact that it often takes a while to notice that a compromise has occurred or is occurring, and allows investigators sufficient log history to better determine the length of time of a potential breach and potential system(s) impacted. By having three months of logs immediately available, an entity can quickly identify and minimize impact of a data breach. Storing logs in off-line locations could prevent them from being readily available, resulting in longer time frames to restore log data, perform analysis, and identify impacted systems or data."

  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.7.b"
  })
}

benchmark "pci_dss_v321_requirement_10_7_c" {
  title       = "10.7.c Interview personnel and observe processes to verify that at least the last three months' logs are immediately available for analysis"
  description = "Retaining logs for at least a year allows for the fact that it often takes a while to notice that a compromise has occurred or is occurring, and allows investigators sufficient log history to better determine the length of time of a potential breach and potential system(s) impacted. By having three months of logs immediately available, an entity can quickly identify and minimize impact of a data breach. Storing logs in off-line locations could prevent them from being readily available, resulting in longer time frames to restore log data, perform analysis, and identify impacted systems or data."

  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.7.c"
  })
}

benchmark "pci_dss_v321_requirement_10_8" {
  title       = "10.8 Additional requirement for service providers only to implement a process for the timely detection and reporting of failures of critical security control systems, including but not limited to failure of firewalls, IDS/IPS, FIM, anti-virus, physical access controls, logical access controls, audit logging mechanisms and segmentation controls"
  description = "Note: This requirement applies only when the entity being assessed is a service provider. Without formal processes to detect and alert when critical security controls fail, failures may go undetected for extended periods and provide attackers ample time to compromise systems and steal sensitive data from the cardholder data environment. The specific types of failures may vary depending on the function of the device and technology in use. Typical failures include a system ceasing to perform its security function or not functioning in its intended manner; for example, a firewall erasing all its rules or going offline."

  children = [
    benchmark.pci_dss_v321_requirement_10_8_1,
    benchmark.pci_dss_v321_requirement_10_8_b
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.8"
  })
}

benchmark "pci_dss_v321_requirement_10_8_1" {
  title       = "10.8.1 Additional requirement for service providers only: Respond to failures of any critical security controls in a timely manner"
  description = "Processes for responding to failures in security controls must include restoring security functions, identifying and documenting the duration (date and time start to end) of the security failure, identifying and documenting cause(s) of failure, including root cause, and documenting remediation required to address root cause, identifying and addressing any security issues that arose during the failure, performing a risk assessment to determine whether further actions are required as a result of the security failure, implementing controls to prevent cause of failure from reoccurring and resuming monitoring of security controls. Note: This requirement applies only when the entity being assessed is a service provider. If critical security control failures alerts are not quickly and effectively responded to, attackers may use this time to insert malicious software, gain control of a system, or steal data from the entity's environment. Documented evidence (e.g., records within a problem management system) should support that processes and procedures are in place to respond to security failures. In addition, personnel should be aware of their responsibilities in the event of a failure. Actions and responses to the failure should be captured in the documented evidence."

  children = [
    benchmark.pci_dss_v321_requirement_10_8_1_a
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.8.1"
  })
}

benchmark "pci_dss_v321_requirement_10_8_1_a" {
  title       = "10.8.1.a Examine documented policies and procedures and interview personnel to verify processes are defined and implemented to respond to a security control failure"
  description = "This include restoring security functions, identifying and documenting the duration (date and time start to end) of the security failure, identifying and documenting cause(s) of failure, including root cause, and documenting remediation required to address root cause, identifying and addressing any security issues that arose during the failure, performing a risk assessment to determine whether further actions are required as a result of the security failure, implementing controls to prevent cause of failure from reoccurring and resuming monitoring of security controls. Note: This requirement applies only when the entity being assessed is a service provider. If critical security control failures alerts are not quickly and effectively responded to, attackers may use this time to insert malicious software, gain control of a system, or steal data from the entity's environment. Documented evidence (e.g., records within a problem management system) should support that processes and procedures are in place to respond to security failures. In addition, personnel should be aware of their responsibilities in the event of a failure. Actions and responses to the failure should be captured in the documented evidence."

  children = [
    control.cloudwatch_alarm_action_enabled_check
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.8.1.a"
  })
}

benchmark "pci_dss_v321_requirement_10_8_b" {
  title       = "10.8.b Examine detection and alerting processes and interview personnel to verify that processes are implemented for all critical security controls"
  description = "The failure of a critical security control results in the generation of an alert.10.8.b Examine detection and alerting processes and interview personnel to verify that processes are implemented for all critical security controls, and that failure of a critical security control results in the generation of an alert. Note: This requirement applies only when the entity being assessed is a service provider. Without formal processes to detect and alert when critical security controls fail, failures may go undetected for extended periods and provide attackers ample time to compromise systems and steal sensitive data from the cardholder data environment. The specific types of failures may vary depending on the function of the device and technology in use. Typical failures include a system ceasing to perform its security function or not functioning in its intended manner; for example, a firewall erasing all its rules or going offline."

  children = [
    control.cloudtrail_trail_enabled,
    control.cloudwatch_alarm_action_enabled_check,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_audit_logging_enabled,
    control.opensearch_domain_logs_to_cloudwatch,
    control.redshift_cluster_audit_logging_enabled,
    control.sns_topic_notification_delivery_status_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_10_common_tags, {
    pci_dss_v321_item_id = "10.8.b"
  })
}
