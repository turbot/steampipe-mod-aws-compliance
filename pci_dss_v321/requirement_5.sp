locals {
  pci_dss_v321_requirement_5_common_tags = merge(local.pci_dss_v321_common_tags, {
    control_set = "5"
  })
}

benchmark "pci_dss_v321_requirement_5" {
  title       = "Requirement 5: Protect all systems against malware and regularly update anti-virus software or programs"
  description = "Malicious software, commonly referred to as “malware”—including viruses, worms, and Trojans—enters the network during many businessapproved activities including employee e-mail and use of the Internet, mobile computers, and storage devices, resulting in the exploitation of system vulnerabilities. Anti-virus software must be used on all systems commonly affected by malware to protect systems from current and evolving malicious software threats"

  children = [
    benchmark.pci_dss_v321_requirement_5_1,
    benchmark.pci_dss_v321_requirement_5_2
  ]

  tags = local.pci_dss_v321_requirement_5_common_tags
}

benchmark "pci_dss_v321_requirement_5_1" {
  title       = "5.1 For a sample of system components including all operating system types commonly affected by malicious software, verify that anti-virus software is deployed if applicable anti-virus technology exists"
  description = "There is a constant stream of attacks using widely published exploits, often called `zero day` (an attack that exploits a previously unknown vulnerability), against otherwise secured systems. Without an anti-virus solution that is updated regularly, these new forms of malicious software can attack systems, disable a network, or lead to compromise of data."

  children = [
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = merge(local.pci_dss_v321_requirement_5_common_tags, {
    pci_dss_v321_item_id = "5.1"
  })
}

benchmark "pci_dss_v321_requirement_5_2" {
  title       = "5.2 Ensure that all anti-virus mechanisms are maintained"
  description = "Anti-virus mechanisms should be maintained as follows: are kept current, perform periodic scans and generate audit logs which are retained per PCI DSS Requirement 10.7. Even the best anti-virus solutions are limited in effectiveness if they are not maintained and kept current with the latest security updates, signature files, or malware protections. Audit logs provide the ability to monitor virus and malware activity and anti-malware reactions. Thus, it is imperative that anti-malware solutions be configured to generate audit logs and that these logs be managed in accordance with Requirement 10."

  children = [
    benchmark.pci_dss_v321_requirement_5_2_c
  ]

  tags = merge(local.pci_dss_v321_requirement_5_common_tags, {
    pci_dss_v321_item_id = "5.2"
  })
}

benchmark "pci_dss_v321_requirement_5_2_c" {
  title       = "5.2.c Examine a sample of system components, including all operating system types commonly affected by malicious software, to verify that the anti-virus software and definitions are current and periodic scans are performed"
  description = "Even the best anti-virus solutions are limited in effectiveness if they are not maintained and kept current with the latest security updates, signature files, or malware protections. Audit logs provide the ability to monitor virus and malware activity and anti-malware reactions. Thus, it is imperative that anti-malware solutions be configured to generate audit logs and that these logs be managed in accordance with Requirement 10."

  children = [
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = merge(local.pci_dss_v321_requirement_5_common_tags, {
    pci_dss_v321_item_id = "5.2.c"
  })
}
