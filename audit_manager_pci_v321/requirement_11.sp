locals {
  audit_manager_pci_v321_requirement_11_common_tags = merge(local.audit_manager_pci_v321_common_tags, {
    control_set = "11"
  })
}

benchmark "audit_manager_pci_v321_requirement_11" {
  title       = "Requirement 11: Regularly test security systems and processes"
  description = "Vulnerabilities are being discovered continually by malicious individuals and researchers, and being introduced by new software. System components, processes, and custom software should be tested frequently to ensure security controls continue to reflect a changing environment."

  children = [
    benchmark.audit_manager_pci_v321_requirement_11_4,
    benchmark.audit_manager_pci_v321_requirement_11_5
  ]

  tags = local.audit_manager_pci_v321_requirement_11_common_tags
}

benchmark "audit_manager_pci_v321_requirement_11_4" {
  title       = "11.4 Use intrusion-detection and/or intrusion-prevention techniques to detect and/or prevent intrusions into the network. Monitor all traffic at the perimeter of the cardholder data environment as well as at critical points in the cardholder data environment, and alert personnel to suspected compromises. Keep all intrusion-detection and prevention engines, baselines, and signatures up to date"
  description = "Intrusion detection and/or intrusion prevention techniques (such as IDS/IPS) compare the traffic coming into the network with known “signatures” and/or behaviors of thousands of compromise types (hacker tools, Trojans, and other malware), and send alerts and/or stop the attempt as it happens. Without a proactive approach to unauthorized activity detection, attacks on (or misuse of) computer resources could go unnoticed in real time. Security alerts generated by these techniques should be monitored so that the attempted intrusions can be stopped."

  children = [
    benchmark.audit_manager_pci_v321_requirement_11_4_a,
    benchmark.audit_manager_pci_v321_requirement_11_4_b,
    benchmark.audit_manager_pci_v321_requirement_11_4_c,
    control.guardduty_enabled
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_11_common_tags, {
    audit_manager_pci_v321_item_id = "11.4"
  })
}

benchmark "audit_manager_pci_v321_requirement_11_4_a" {
  title       = "11.4.a Examine system configurations and network diagrams to verify that techniques (such as intrusion-detection systems and/or intrusion-prevention systems) are in place to monitor all traffic: • At the perimeter of the cardholder data environment • At critical points in the cardholder data environment"
  description = "Intrusion detection and/or intrusion prevention techniques (such as IDS/IPS) compare the traffic coming into the network with known “signatures” and/or behaviors of thousands of compromise types (hacker tools, Trojans, and other malware), and send alerts and/or stop the attempt as it happens. Without a proactive approach to unauthorized activity detection, attacks on (or misuse of) computer resources could go unnoticed in real time. Security alerts generated by these techniques should be monitored so that the attempted intrusions can be stopped."

  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_11_common_tags, {
    audit_manager_pci_v321_item_id = "11.4.a"
  })
}

benchmark "audit_manager_pci_v321_requirement_11_4_b" {
  title       = "11.4.b Examine system configurations and interview responsible personnel to confirm intrusion-detection and/or intrusion-prevention techniques alert personnel of suspected compromises"
  description = "Intrusion detection and/or intrusion prevention techniques (such as IDS/IPS) compare the traffic coming into the network with known “signatures” and/or behaviors of thousands of compromise types (hacker tools, Trojans, and other malware), and send alerts and/or stop the attempt as it happens. Without a proactive approach to unauthorized activity detection, attacks on (or misuse of) computer resources could go unnoticed in real time. Security alerts generated by these techniques should be monitored so that the attempted intrusions can be stopped."

  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_11_common_tags, {
    audit_manager_pci_v321_item_id = "11.4.b"
  })
}

benchmark "audit_manager_pci_v321_requirement_11_4_c" {
  title       = "11.4.c Examine IDS/IPS configurations and vendor documentation to verify intrusion-detection and/or intrusion- prevention techniques are configured, maintained, and updated per vendor instructions to ensure optimal protection"
  description = "Intrusion detection and/or intrusion prevention techniques (such as IDS/IPS) compare the traffic coming into the network with known “signatures” and/or behaviors of thousands of compromise types (hacker tools, Trojans, and other malware), and send alerts and/or stop the attempt as it happens. Without a proactive approach to unauthorized activity detection, attacks on (or misuse of) computer resources could go unnoticed in real time. Security alerts generated by these techniques should be monitored so that the attempted intrusions can be stopped."

  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_11_common_tags, {
    audit_manager_pci_v321_item_id = "11.4.c"
  })
}

benchmark "audit_manager_pci_v321_requirement_11_5" {
  title       = "11.5 Deploy a change-detection mechanism (for example, file-integrity monitoring tools) to alert personnel to unauthorized modification (including changes, additions, and deletions) of critical system files, configuration files, or content files; and configure the software to perform critical file comparisons at least weekly"
  description = "Change-detection solutions such as file-integrity monitoring (FIM) tools check for changes, additions, and deletions to critical files, and notify when such changes are detected. If not implemented properly and the output of the change-detection solution monitored, a malicious individual could add, remove, or alter configuration file contents, operating system programs, or application executables. Unauthorized changes, if undetected, could render existing security controls ineffective and/or result in cardholder data being stolen with no perceptible impact to normal processing."

  children = [
    benchmark.audit_manager_pci_v321_requirement_11_5_a,
    benchmark.audit_manager_pci_v321_requirement_11_5_b,
    control.config_enabled_all_regions
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_11_common_tags, {
    audit_manager_pci_v321_item_id = "11.5"
  })
}

benchmark "audit_manager_pci_v321_requirement_11_5_a" {
  title       = "11.5.a Verify the use of a change-detection mechanism by observing system settings and monitored files, as well as reviewing results from monitoring activities. Examples of files that should be monitored: • System executables • Application executables • Configuration and parameter files • Centrally stored, historical or archived, log and audit files • Additional critical files determined by entity (for example, through risk assessment or other means)"
  description = "Change-detection solutions such as file-integrity monitoring (FIM) tools check for changes, additions, and deletions to critical files, and notify when such changes are detected. If not implemented properly and the output of the change-detection solution monitored, a malicious individual could add, remove, or alter configuration file contents, operating system programs, or application executables. Unauthorized changes, if undetected, could render existing security controls ineffective and/or result in cardholder data being stolen with no perceptible impact to normal processing."

  children = [
    control.config_enabled_all_regions
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_11_common_tags, {
    audit_manager_pci_v321_item_id = "11.5.a"
  })
}

benchmark "audit_manager_pci_v321_requirement_11_5_b" {
  title       = "11.5.b Verify the mechanism is configured to alert personnel to unauthorized modification (including changes, additions, and deletions) of critical files, and to perform critical file comparisons at least weekly"

  children = [
    control.config_enabled_all_regions
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_11_common_tags, {
    audit_manager_pci_v321_item_id = "11.5.b"
  })
}
