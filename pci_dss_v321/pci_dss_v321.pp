locals {
  pci_dss_v321_common_tags = merge(local.aws_compliance_common_tags, {
    pci_dss_v321 = "true"
    type         = "Benchmark"
  })
}

benchmark "pci_dss_v321" {
  title         = "AWS PCI DSS v3.2.1"
  description   = "The Payment Card Industry Data Security Standard (PCI DSS) v3.2.1 is an information security standard for entities that store, process, and/or transmit cardholder data."
  documentation = file("./pci_dss_v321/docs/pci_dss_v321_overview.md")
  children = [
    benchmark.pci_dss_v321_requirement_1,
    benchmark.pci_dss_v321_requirement_2,
    benchmark.pci_dss_v321_requirement_3,
    benchmark.pci_dss_v321_requirement_4,
    benchmark.pci_dss_v321_requirement_5,
    benchmark.pci_dss_v321_requirement_6,
    benchmark.pci_dss_v321_requirement_7,
    benchmark.pci_dss_v321_requirement_8,
    benchmark.pci_dss_v321_requirement_10,
    benchmark.pci_dss_v321_requirement_11
  ]
  tags = local.pci_dss_v321_common_tags
}
