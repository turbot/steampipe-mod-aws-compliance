benchmark "nist_800_53_rev_5_si" {
  title       = "System and Information integrity (SI)"
  description = "The SI control family correlates to controls that protect system and information integrity. These include flaw remediation, malicious code protection, information system monitoring, security alerts, software and firmware integrity, and spam protection."
  children = [
    benchmark.nist_800_53_rev_5_si_1,
    benchmark.nist_800_53_rev_5_si_2,
    benchmark.nist_800_53_rev_5_si_3,
    benchmark.nist_800_53_rev_5_si_4,
    benchmark.nist_800_53_rev_5_si_5,
    benchmark.nist_800_53_rev_5_si_7,
    benchmark.nist_800_53_rev_5_si_10,
    benchmark.nist_800_53_rev_5_si_12,
    benchmark.nist_800_53_rev_5_si_13,
    benchmark.nist_800_53_rev_5_si_19
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_1" {
  title       = "Policy And Procedures (SI-1)"
  description = "a. Develop, document, and disseminate to [Assignment: organization-defined personnel or roles]: 1. [Selection (one or more): Organization-level; Mission/business process-level; System-level] system and information integrity policy that: a). Addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and b). Is consistent with applicable laws, executive orders, directives, regulations, policies, standards, and guidelines; and 2. Procedures to facilitate the implementation of the system and information integrity policy and the associated system and information integrity controls; b. Designate an [Assignment: organization-defined official] to manage the development, documentation, and dissemination of the system and information integrity policy and procedures; and c. Review and update the current system and information integrity: 1. Policy [Assignment: organization-defined frequency] and following [Assignment: organization-defined events]; and 2. Procedures [Assignment: organization-defined frequency] and following [Assignment: organization-defined events]."
  children = [
    benchmark.nist_800_53_rev_5_si_1_1_c,
    benchmark.nist_800_53_rev_5_si_1_a_2,
    benchmark.nist_800_53_rev_5_si_1_c_2
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_1_a_2" {
  title       = "SI-1(a)(2)"
  description = "a. Develop, document, and disseminate to [Assignment: organization-defined personnel or roles]: 2. Procedures to facilitate the implementation of the system and information integrity policy and the associated system and information integrity controls;."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudtrail_trail_validation_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_1_c_2" {
  title       = "SI-1(c)(2)"
  description = "c. Review and update the current system and information integrity: 2. Procedures [Assignment: organization-defined frequency] and following [Assignment: organization-defined events]."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudtrail_trail_validation_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_1_1_c" {
  title       = "SI-1(1)(c)"
  description = "Audit the use of the manual override capability."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_2" {
  title       = "Flaw Remediation (SI-2)"
  description = "The organization: a.Identifies, reports, and corrects information system flaws; b.Tests software and firmware updates related to flaw remediation for effectiveness and potential side effects before installation; c.Installs security-relevant software and firmware updates within [Assignment: organization-defined time period] of the release of the updates; and d.Incorporates flaw remediation into the organizational configuration management process."
  children = [
    benchmark.nist_800_53_rev_5_si_2_2,
    benchmark.nist_800_53_rev_5_si_2_5,
    benchmark.nist_800_53_rev_5_si_2_a,
    benchmark.nist_800_53_rev_5_si_2_c,
    benchmark.nist_800_53_rev_5_si_2_d
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_2_5" {
  title       = "SI-2(5) Automatic Software And Firmware Updated"
  description = "Install [Assignment: organization-defined security-relevant software and firmware updates] automatically to [Assignment: organization-defined system components]."
  children = [
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_2_2" {
  title       = "SI-2(2) Automated Flaw Remediation Status"
  description = "Determine if system components have applicable security-relevant software and firmware updates installed using [Assignment: organization-defined automated mechanisms] [Assignment: organization-defined frequency]."
  children = [
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_2_a" {
  title       = "SI-2(a)"
  description = "Identify, report, and correct system flaws."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudwatch_alarm_action_enabled,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_2_c" {
  title       = "SI-2(c)"
  description = "Install security-relevant software and firmware updates within [Assignment: organization-defined time period] of the release of the updates."
  children = [
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_2_d" {
  title       = "SI-2(d)"
  description = "Incorporate flaw remediation into the organizational configuration management process."
  children = [
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_3" {
  title       = "Malicious Code Protection (SI-3)"
  description = "a. Implement [Selection (one or more): signature based; non-signature based] malicious code protection mechanisms at system entry and exit points to detect and eradicate malicious code; b. Automatically update malicious code protection mechanisms as new releases are available in accordance with organizational configuration management policy and procedures; c. Configure malicious code protection mechanisms to: 1. Perform periodic scans of the system [Assignment: organization-defined frequency] and real-time scans of files from external sources at [Selection (one or more): endpoint; network entry and exit points] as the files are downloaded, opened, or executed in accordance with organizational policy; and 2. [Selection (one or more): block malicious code; quarantine malicious code; take [Assignment: organization-defined action]]; and send alert to [Assignment: organization-defined personnel or roles] in response to malicious code detection; and d. Address the receipt of false positives during malicious code detection and eradication and the resulting potential impact on the availability of the system."
  children = [
    benchmark.nist_800_53_rev_5_si_3_8,
    benchmark.nist_800_53_rev_5_si_3_c_2
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_3_c_2" {
  title       = "SI-3(c)(2)"
  description = "c. Configure malicious code protection mechanisms to: 2. [Selection (one or more): block malicious code; quarantine malicious code; take [Assignment: organization-defined action]]; and send alert to [Assignment: organization-defined personnel or roles] in response to malicious code detection."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_3_8" {
  title       = "SI-3(8) Detect Unauthorized Commands"
  description = "a. Detect the following unauthorized operating system commands through the kernel application programming interface on [Assignment: organization-defined system hardware components]: [Assignment: organization-defined unauthorized operating system commands]; and b. [Selection (one or more): issue a warning; audit the command execution; prevent the execution of the command]."
  children = [
    benchmark.nist_800_53_rev_5_si_3_8_a,
    benchmark.nist_800_53_rev_5_si_3_8_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_3_8_a" {
  title       = "SI-3(8)(a)"
  description = "Detect the following unauthorized operating system commands through the kernel application programming interface on [Assignment: organization-defined system hardware components]: [Assignment: organization-defined unauthorized operating system commands]."
  children = [
    control.guardduty_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_3_8_b" {
  title       = "SI-3(8)(b)"
  description = "[Selection (one or more): issue a warning; audit the command execution; prevent the execution of the command]."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_4" {
  title       = "System Monitoring (SI-4)"
  description = "The organization: a.Monitors the information system to detect: 1. Attacks and indicators of potential attacks in accordance with [Assignment: organization-defined monitoring objectives]; and 2.Unauthorized local, network, and remote connections; b. Identifies unauthorized use of the information system through [Assignment: organization-defined techniques and methods]; c. Deploys monitoring devices: 1. Strategically within the information system to collect organization-determined essential information; and 2. At ad hoc locations within the system to track specific types of transactions of interest to the organization; d. Protects information obtained from intrusion-monitoring tools from unauthorized access, modification, and deletion; e. Heightens the level of information system monitoring activity whenever there is an indication of increased risk to organizational operations and assets, individuals, other organizations, or the Nation based on law enforcement information, intelligence information, or other credible sources of information; f. Obtains legal opinion with regard to information system monitoring activities in accordance with applicable federal laws, Executive Orders, directives, policies, or regulations; and g. Provides [Assignment: organization-defined information system monitoring information] to [Assignment: organization-defined personnel or roles] [Selection (one or more): as needed; [Assignment: organization-defined frequency]]."
  children = [
    benchmark.nist_800_53_rev_5_si_4_1,
    benchmark.nist_800_53_rev_5_si_4_2,
    benchmark.nist_800_53_rev_5_si_4_3,
    benchmark.nist_800_53_rev_5_si_4_4,
    benchmark.nist_800_53_rev_5_si_4_10,
    benchmark.nist_800_53_rev_5_si_4_12,
    benchmark.nist_800_53_rev_5_si_4_13,
    benchmark.nist_800_53_rev_5_si_4_14,
    benchmark.nist_800_53_rev_5_si_4_17,
    benchmark.nist_800_53_rev_5_si_4_20,
    benchmark.nist_800_53_rev_5_si_4_23,
    benchmark.nist_800_53_rev_5_si_4_25,
    benchmark.nist_800_53_rev_5_si_4_a,
    benchmark.nist_800_53_rev_5_si_4_b,
    benchmark.nist_800_53_rev_5_si_4_c,
    benchmark.nist_800_53_rev_5_si_4_d
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_4_a" {
  title       = "SI-4(a)"
  description = "Monitor the system to detect: 1. Attacks and indicators of potential attacks in accordance with the following monitoring objectives: [Assignment: organization-defined monitoring objectives]; and 2. Unauthorized local, network, and remote connections."
  children = [
    benchmark.nist_800_53_rev_5_si_4_a_1,
    benchmark.nist_800_53_rev_5_si_4_a_2,
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_a_1" {
  title       = "SI-4(a)(1)"
  description = "a. Monitor the system to detect: 1. Attacks and indicators of potential attacks in accordance with the following monitoring objectives: [Assignment: organization-defined monitoring objectives]; and 2. Unauthorized local, network, and remote connections."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_a_2" {
  title       = "SI-4(a)(2)"
  description = "a. Monitor the system to detect: 2. Unauthorized local, network, and remote connections."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_b" {
  title       = "SI-4(b)"
  description = "Identify unauthorized use of the system through the following techniques and methods: [Assignment: organization-defined techniques and methods]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_c" {
  title       = "SI-4(c)"
  description = "c. Invoke internal monitoring capabilities or deploy monitoring devices: 1. Strategically within the system to collect organization-determined essential information; and 2. At ad hoc locations within the system to track specific types of transactions of interest to the organization."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_d" {
  title       = "SI-4(d)"
  description = "Analyze detected events and anomalies."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_si_4_1" {
  title       = "SI-4(1) System-Wide Intrusion Detection System"
  description = "Connect and configure individual intrusion detection tools into a system-wide intrusion detection system."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_2" {
  title       = "SI-4(2) Automated Tools For Real-Time Analysis"
  description = "Implement the following additional monitoring of privileged users: [Assignment: organization-defined additional monitoring]. Employ automated tools and mechanisms to support near real-time analysis of events."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_4_3" {
  title       = "SI-4(3) Automated Tools And Mechanism Integration"
  description = "Employ automated tools and mechanisms to integrate intrusion detection tools and mechanisms into access control and flow control mechanisms."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_4" {
  title       = "SI-4(4) Inbound and Outbound Communications Traffic"
  description = "The information system monitors inbound and outbound communications traffic continuously for unusual or unauthorized activities or conditions."
  children = [
    benchmark.nist_800_53_rev_5_si_4_4_a,
    benchmark.nist_800_53_rev_5_si_4_4_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_4_4_a" {
  title       = "SI-4(4)(a)"
  description = "Determine criteria for unusual or unauthorized activities or conditions for inbound and outbound communications traffic."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_4_b" {
  title       = "SI-4(4)(b)"
  description = "Monitor inbound and outbound communications traffic [Assignment: organization-defined frequency] for [Assignment: organization-defined unusual or unauthorized activities or conditions]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_10" {
  title       = "SI-4(10) Visibility Of Encrypted Communications"
  description = "Make provisions so that [Assignment: organization-defined encrypted communications traffic] is visible to [Assignment: organization-defined system monitoring tools and mechanisms]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_12" {
  title       = "SI-4(12) Automated Organization-Generated Alerts"
  description = "Alert [Assignment: organization-defined personnel or roles] using [Assignment: organization-defined automated mechanisms] when the following indications of inappropriate or unusual activities with security or privacy implications occur: [Assignment: organization-defined activities that trigger alerts]."
  children = [
    control.cloudwatch_alarm_action_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudWatch"
  })
}

benchmark "nist_800_53_rev_5_si_4_13" {
  title       = "SI-4(13) Analyze Traffic And Event Patterns"
  description = "a. Analyze communications traffic and event patterns for the system; b. Develop profiles representing common traffic and event patterns; and c. Use the traffic and event profiles in tuning system-monitoring devices."
  children = [
    benchmark.nist_800_53_rev_5_si_4_13_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_4_13_a" {
  title       = "SI-4(13)(a)"
  description = "Analyze communications traffic and event patterns for the system."
  children = [
    control.guardduty_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_4_14" {
  title       = "SI-4(14) Wireless Intrusion Detection"
  description = "Employ a wireless intrusion detection system to identify rogue wireless devices and to detect attack attempts and potential compromises or breaches to the system."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_17" {
  title       = "SI-4(17) Integrated Situational Awareness"
  description = "Correlate information from monitoring physical, cyber, and supply chain activities to achieve integrated, organization-wide situational awareness."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_4_20" {
  title       = "SI-4(20) Privileged Users"
  description = "Implement the following additional monitoring of privileged users: [Assignment: organization-defined additional monitoring]."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_4_23" {
  title       = "SI-4(23) Host-Based Devices"
  description = "Implement the following host-based monitoring mechanisms at [Assignment: organization-defined system components]: [Assignment: organization-defined host-based monitoring mechanisms]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_si_4_25" {
  title       = "SI-4(25) Optimize Network Traffic Analysis"
  description = "Provide visibility into network traffic at external and key internal system interfaces to optimize the effectiveness of monitoring devices."
  children = [
    control.guardduty_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_5" {
  title       = "Secuity Alerts, Advisories, And Directives (SI-5)"
  description = "a. Receive system security alerts, advisories, and directives from [Assignment: organization-defined external organizations] on an ongoing basis; b. Generate internal security alerts, advisories, and directives as deemed necessary; c. Disseminate security alerts, advisories, and directives to: [Selection (one or more): [Assignment: organization-defined personnel or roles]; [Assignment: organization-defined elements within the organization]; [Assignment: organization-defined external organizations]]; and d. Implement security directives in accordance with established time frames, or notify the issuing organization of the degree of noncompliance."
  children = [
    benchmark.nist_800_53_rev_5_si_5_1,
    benchmark.nist_800_53_rev_5_si_5_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_5_1" {
  title       = "SI-5(1) Automated Alerts And Advisories"
  description = "Broadcast security alert and advisory information throughout the organization using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_5_b" {
  title       = "SI-5(b)"
  description = "Generate internal security alerts, advisories, and directives as deemed necessary."
  children = [
    control.cloudwatch_alarm_action_enabled,
    control.guardduty_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_7" {
  title       = "Software, Firmware, and Information Integrity (SI-7)"
  description = "a. Employ integrity verification tools to detect unauthorized changes to the following software, firmware, and information: [Assignment: organization-defined software, firmware, and information]; and b. Take the following actions when unauthorized changes to the software, firmware, and information are detected: [Assignment: organization-defined actions]."
  children = [
    benchmark.nist_800_53_rev_5_si_7_1,
    benchmark.nist_800_53_rev_5_si_7_3,
    benchmark.nist_800_53_rev_5_si_7_7,
    benchmark.nist_800_53_rev_5_si_7_8,
    benchmark.nist_800_53_rev_5_si_7_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_7_1" {
  title       = "SI-7(1) Integrity Checks"
  description = "Perform an integrity check of [Assignment: organization-defined software, firmware, and information] [Selection (one or more): at startup; at [Assignment: organization-defined transitional states or security-relevant events]; [Assignment: organization-defined frequency]]."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_si_7_3" {
  title       = "SI-7(3) Centrally Managed Integrity Tools"
  description = "Employ centrally managed integrity verification tools."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_si_7_7" {
  title       = "SI-7(7) Integration Of Detection And Response"
  description = "Incorporate the detection of the following unauthorized changes into the organizational incident response capability: [Assignment: organization-defined security-relevant changes to the system]."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_si_7_8" {
  title       = "SI-7(8) Auditing Capability For Significant Events"
  description = "Upon detection of a potential integrity violation, provide the capability to audit the event and initiate the following actions: [Selection (one or more): generate an audit record; alert current user; alert [Assignment: organization-defined personnel or roles]; [Assignment: organization-defined other actions]]."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.wafv2_web_acl_logging_enabled,
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_7_a" {
  title       = "SI-7(a)"
  description = "Employ integrity verification tools to detect unauthorized changes to the following software, firmware, and information: [Assignment: organization-defined software, firmware, and information]."
  children = [
    control.cloudtrail_trail_validation_enabled
  ]
  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudTrail"
  })
}

benchmark "nist_800_53_rev_5_si_10" {
  title       = "Information Input Validation (SI-10)"
  description = "Check the validity of the following information inputs: [Assignment: organization-defined information inputs to the system]."
  children = [
    benchmark.nist_800_53_rev_5_si_10_1
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_10_1" {
  title       = "SI-10(1) Manual Override Capability"
  description = "a. Provide a manual override capability for input validation of the following information inputs: [Assignment: organization-defined inputs defined in the base control (SI-10)]; b. Restrict the use of the manual override capability to only [Assignment: organization-defined authorized individuals]; and c. Audit the use of the manual override capability."
  children = [
    benchmark.nist_800_53_rev_5_si_10_1_c
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_10_1_c" {
  title       = "SI-10(1)(c)"
  description = "Audit the use of the manual override capability."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_12" {
  title       = "Information Management and Retention (SI-12)"
  description = "Manage and retain information within the system and information output from the system in accordance with applicable laws, executive orders, directives, regulations, policies, standards, guidelines and operational requirements."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudWatch"
  })
}

benchmark "nist_800_53_rev_5_si_13" {
  title       = "Predictable Failure Prevention (SI-13)"
  description = "a. Determine mean time to failure (MTTF) for the following system components in specific environments of operation: [Assignment: organization-defined system components]; and b. Provide substitute system components and a means to exchange active and standby components in accordance with the following criteria: Provide [Selection: real-time; near real-time] [Assignment: organization-defined failover capability] for the system.[Assignment: organization-defined MTTF substitution criteria]."
  children = [
    benchmark.nist_800_53_rev_5_si_13_5
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_13_5" {
  title       = "SI-13(5) Failover Capability"
  description = "Provide [Selection: real-time; near real-time] [Assignment: organization-defined failover capability] for the system."
  children = [
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}


benchmark "nist_800_53_rev_5_si_19" {
  title       = "De-Identification (SI-19)"
  description = "a. Remove the following elements of personally identifiable information from datasets: [Assignment: organization-defined elements of personally identifiable information]; and b. Evaluate [Assignment: organization-defined frequency] for effectiveness of de-identification."
  children = [
    benchmark.nist_800_53_rev_5_si_19_4
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_si_19_4" {
  title       = "SI-19(4) Removal, Masking, Encryption, Hashing, Or Replacement Of Direct Identifiers"
  description = "Remove, mask, encrypt, hash, or replace direct identifiers in a dataset."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_encrypted_with_kms,
    control.ebs_attached_volume_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.es_domain_encryption_at_rest_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk
  ]

  tags = local.nist_800_53_rev_5_common_tags
}
