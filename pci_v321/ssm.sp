locals {
  pci_v321_ssm_common_tags = merge(local.pci_v321_common_tags, {
    service = "ssm"
  })
}

benchmark "pci_v321_ssm" {
  title         = "SSM"
  documentation = file("./pci_v321/docs/pci_v321_ssm.md")
  children = [
    control.pci_v321_ssm_3
  ]
  tags = local.pci_v321_ssm_common_tags
}

control "pci_v321_ssm_3" {
  title         = "3 EC2 instances should be managed by AWS Systems Manager"
  description   = "This control checks whether the EC2 instances in your account are managed by Systems Manager."
  severity      = "medium"
  sql           = query.ec2_instance_ssm_managed.sql
  documentation = file("./pci_v321/docs/pci_v321_ssm_1.md")

  tags = merge(local.pci_v321_ssm_common_tags, {
    pci_item_id      = "ssm_1"
    pci_requirements = "2.4,6.2"
  })
}