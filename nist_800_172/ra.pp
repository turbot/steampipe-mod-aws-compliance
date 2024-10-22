benchmark "nist_800_172_3_11" {
  title       = "3.11 Risk Assessment"
  description = "The RA control family relates to an organization's risk assessment policies and vulnerability scanning capabilities. Using an integrated risk management solution like CyberStrong can help streamline and automate your NIST 800 53 compliance efforts."
  children = [
    benchmark.nist_800_172_3_11_1_e,
    benchmark.nist_800_172_3_11_2_e
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_11_1_e" {
  title       = "3.11.1e Employ [Assignment: organization-defined sources of threat intelligence] as part of a risk assessment to guide and inform the development of organizational systems, security architectures, selection of security solutions, monitoring, threat hunting, and response and recovery activities "
  description = "The constant evolution and increased sophistication of adversaries, especially the APT, makes it more likely that adversaries can successfully compromise or breach organizational systems. Accordingly, threat intelligence can be integrated into each step of the risk management process throughout the system development life cycle. This risk management process includes defining system security requirements, developing system and security architectures, selecting security solutions, monitoring (including threat hunting), and remediation efforts."
  children = [
    control.guardduty_enabled
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_11_2_e" {
  title       = "3.11.2e Conduct cyber threat hunting activities [Selection (one or more): [Assignment: organizationdefined frequency]; [Assignment: organization-defined event]] to search for indicators of compromise in [Assignment: organization-defined systems] and detect, track, and disrupt threats that evade existing controls"
  description = "Threat hunting is an active means of defense that contrasts with traditional protection measures, such as firewalls, intrusion detection and prevention systems, quarantining malicious code in sandboxes, and Security Information and Event Management (SIEM) technologies and systems. Cyber threat hunting involves proactively searching organizational systems, networks, and infrastructure for advanced threats. The objective is to track and disrupt cyber adversaries as early as possible in the attack sequence and to measurably improve the speed and accuracy of organizational responses. Indicators of compromise are forensic artifacts from intrusions that are identified on organizational systems at the host or network level and can include unusual network traffic, unusual file changes, and the presence of malicious code."
  children = [
    control.guardduty_enabled
  ]

  tags = local.nist_800_172_common_tags
}
