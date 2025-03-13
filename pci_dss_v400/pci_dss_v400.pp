locals {
  pci_dss_v400_common_tags = merge(local.aws_compliance_common_tags, {
    pci_dss_v400 = "true"
    type         = "Benchmark"
  })
}

benchmark "pci_dss_v400" {
  title         = "PCI DSS v4.0.0"
  description   = "The Payment Card Industry Data Security Standard (PCI DSS) was developed to encourage and enhance payment card account data security and facilitate the broad adoption of consistent data security measures globally. PCI DSS provides a baseline of technical and operational requirements designed to protect account data."
  documentation = file("./pci_dss_v400/docs/pci_dss_v400_overview.md")
  children = [
    benchmark.pci_dss_v400_appendix_a1,
    benchmark.pci_dss_v400_appendix_a3,
  ]
  tags = local.pci_dss_v400_common_tags
}
