locals {
  pci_dss_v40_common_tags = merge(local.aws_compliance_common_tags, {
    pci_dss_v40 = "true"
    type         = "Benchmark"
  })
}

benchmark "pci_dss_v40" {
  title       = "AWS PCI DSS v4.0"
  description = "The Payment Card Industry Data Security Standard (PCI DSS) was developed to encourage and enhance payment card account data security and facilitate the broad adoption of consistent data security measures globally. PCI DSS provides a baseline of technical and operational requirements designed to protect account data."
  documentation = file("./pci_dss_v40/docs/pci_dss_v40_overview.md")
  children = [
    benchmark.pci_dss_v40_appendix_a1,
    benchmark.pci_dss_v40_appendix_a3,
    benchmark.pci_dss_v40_requirement_1,
    benchmark.pci_dss_v40_requirement_2,
    benchmark.pci_dss_v40_requirement_3,
    benchmark.pci_dss_v40_requirement_4,
    benchmark.pci_dss_v40_requirement_6,
    benchmark.pci_dss_v40_requirement_7,
    benchmark.pci_dss_v40_requirement_8,
    benchmark.pci_dss_v40_requirement_10,
    benchmark.pci_dss_v40_requirement_11,
    benchmark.pci_dss_v40_requirement_12
  ]
  tags = local.pci_dss_v40_common_tags
}
