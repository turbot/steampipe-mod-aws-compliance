locals {
  audit_manager_pci_v321_common_tags = merge(local.aws_compliance_common_tags, {
    audit_manager_pci_v321 = "true"
    type  = "Benchmark"
  })
}

benchmark "audit_manager_pci_v321" {
  title       = "AWS Audit Manager PCI DSS V3.2.1"
  description = "The Payment Card Industry Data Security Standard (PCI DSS) v3.2.1 is an information security standard for entities that store, process, and/or transmit cardholder data."
  children = [
    benchmark.audit_manager_pci_v321_requirement_1,
    benchmark.audit_manager_pci_v321_requirement_2,
    benchmark.audit_manager_pci_v321_requirement_3,
    benchmark.audit_manager_pci_v321_requirement_4,
    benchmark.audit_manager_pci_v321_requirement_5,
    benchmark.audit_manager_pci_v321_requirement_6,
  ]
  tags = local.audit_manager_pci_v321_common_tags
}