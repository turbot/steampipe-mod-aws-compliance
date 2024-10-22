benchmark "nist_800_172_3_14" {
  title       = "3.14 System and Information integrity"
  description = "The SI control family correlates to controls that protect system and information integrity. These include flaw remediation, malicious code protection, information system monitoring, security alerts, software and firmware integrity, and spam protection."
  children = [
    benchmark.nist_800_172_3_14_1_e,
    benchmark.nist_800_172_3_14_2_e,
    benchmark.nist_800_172_3_14_6_e,
    benchmark.nist_800_172_3_14_7_e
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_14_1_e" {
  title       = "3.14.1e Verify the integrity of [Assignment: organization-defined security critical or essential software] using root of trust mechanisms or cryptographic signatures"
  description = "Verifying the integrity of the organization’s security-critical or essential software is an important capability since corrupted software is the primary attack vector used by adversaries to undermine or disrupt the proper functioning of organizational systems. There are many ways to verify software integrity throughout the system development life cycle. Root of trust mechanisms (e.g., secure boot, trusted platform modules, Unified Extensible Firmware Interface [UEFI]), verify that only trusted code is executed during boot processes. This capability helps system components protect the integrity of boot firmware in organizational systems by verifying the integrity and authenticity of updates to the firmware prior to applying changes to the system component and preventing unauthorized processes from modifying the boot firmware. The employment of cryptographic signatures ensures the integrity and authenticity of critical and essential software that stores, processes, or transmits, CUI. Cryptographic signatures include digital signatures and the computation and application of signed hashes using asymmetric cryptography, protecting the confidentiality of the key used to generate the hash, and using the public key to verify the hash information. Hardware roots of trust are considered to be more secure. "
  children = [
    control.cloudtrail_trail_validation_enabled
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_14_2_e" {
  title       = "3.14.2e Monitor organizational systems and system components on an ongoing basis for anomalous or suspicious behavior"
  description = "Monitoring is used to identify unusual, suspicious, or unauthorized activities or conditions related to organizational systems and system components. Such activities or conditions can include unusual internal systems communications traffic, unauthorized exporting of information,signaling to external systems, large file transfers, long-time persistent connections, attempts to access information from unexpected locations, unusual protocols and ports in use, and attempted communications with suspected malicious external addresses. The correlation of physical, time, or geolocation audit record information to the audit records from systems may assist organizations in identifying examples of anomalous behavior. For example, the correlation of an individual’s identity for logical access to certain systems with the additional information that the individual was not present at the facility when the logical access occurred is indicative of anomalous behavior."
  children = [
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_alarm_action_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.guardduty_enabled,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_14_6_e" {
  title       = "3.14.6e Use threat indicator information and effective mitigations obtained from [Assignment: organization-defined external organizations] to guide and inform intrusion detection and threat hunting"
  description = "Threat information related to specific threat events (e.g., TTPs, targets) that organizations have experienced, threat mitigations that organizations have found to be effective against certain types of threats, and threat intelligence (i.e., indications and warnings about threats that can occur) are sourced from and shared with trusted organizations. This threat information can be used by organizational Security Operations Centers (SOC) and incorporated into monitoring capabilities. Threat information sharing includes threat indicators, signatures, and adversary TTPs from organizations participating in threat-sharing consortia, government-commercial cooperatives, and government-government cooperatives (e.g., CERTCC, CISA/US-CERT, FIRST, ISAO, DIB CS Program). Unclassified indicators, based on classified information but which can be readily incorporated into organizational intrusion detection systems, are available to qualified nonfederal organizations from government sources."
  children = [
    control.guardduty_enabled
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_14_7_e" {
  title       = "3.14.7e Verify the correctness of [Assignment: organization-defined security critical or essential software, firmware, and hardware components] using [Assignment: organization-defined verification methods or techniques]."
  description = "Verification methods have varying degrees of rigor in determining the correctness of software, firmware, and hardware components. For example, formal verification involves proving that a software program satisfies some formal property or set of properties. The nature of formal verification is generally time-consuming and not employed for commercial operating systems and applications. Therefore, it would likely only be applied to some very limited uses, such as verifying cryptographic protocols. However, in cases where software, firmware, or hardware components exist with formal verification of the component’s security properties, such components provide greater assurance and trustworthiness and are preferred over similar components that have not been formally verified."
  children = [
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.ec2_instance_ssm_managed,
    control.ecs_service_fargate_using_latest_platform_version,
    control.ecr_repository_image_scan_on_push_enabled
  ]

  tags = local.nist_800_172_common_tags
}