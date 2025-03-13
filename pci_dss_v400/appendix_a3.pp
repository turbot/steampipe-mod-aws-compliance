locals {
  pci_dss_v400_appendix_a3_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "3"
  })
}

benchmark "pci_dss_v400_appendix_a3" {
  title = "Appendix A3: Designated Entities Supplemental Validation (DESV) (19)"

  children = [
    benchmark.pci_dss_v400_appendix_a3_3,
  ]

  tags = local.pci_dss_v400_appendix_a3_common_tags
}

benchmark "pci_dss_v400_appendix_a3_3" {
  title = "A3.3: PCI DSS scope is documented and validated."

  children = [
    benchmark.pci_dss_v400_appendix_a3_3_1,
  ]

  tags = merge(local.pci_dss_v400_appendix_a3_common_tags, {
    pci_dss_v400_item_id = "A3.3"
  })
}

benchmark "pci_dss_v400_appendix_a3_3_1" {
  title       = "A3.3.1: PCI DSS is incorporated into business-as-usual (BAU) activities."
  description = "Failures of critical security control systems are detected, alerted, and addressed promptly, including but not limited to failure of: Network security controls IDS/IPS FIM Anti-malware solutions Physical access controls Logical access controls Audit logging mechanisms Segmentation controls (if used) Automated audit log review mechanisms. This bullet is a best practice until its effective date; refer to Applicability Notes below for details. Automated code review tools (if used). This bullet is a best practice until its effective date; refer to Applicability Notes below for details. PCI DSS Reference: Requirements 1-12 Applicability Notes The bullets above (for automated log review mechanisms and automated code review tools (if used)) are best practices until 31 March 2025, after which they will be required as part of Requirement A3.3.1 and must be fully considered during a PCI DSS assessment."

  children = [
    control.log_metric_filter_config_configuration,
    control.log_metric_filter_iam_policy,
    control.log_metric_filter_console_login_mfa,
    
  ]

  tags = merge(local.pci_dss_v400_appendix_a3_common_tags, {
    pci_dss_v400_item_id = "A3.3.1"
  })
}

