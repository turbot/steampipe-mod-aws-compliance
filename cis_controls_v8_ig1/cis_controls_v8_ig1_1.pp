benchmark "cis_controls_v8_ig1_1" {
  title       = "1 Inventory and Control of Enterprise Assets"
  description = "Actively manage (inventory, track, and correct) all enterprise assets (end-user devices, including portable and mobile; network devices; non-computing/Internet of Things (IoT) devices; and servers) connected to the infrastructure physically, virtually, remotely, and those within cloud environments, to accurately know the totality of assets that need to be monitored and protected within the enterprise. This will also support identifying unauthorized and unmanaged assets to remove or remediate."
  children = [
    benchmark.cis_controls_v8_ig1_1_1,
    benchmark.cis_controls_v8_ig1_1_2
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_1_1" {
  title       = "1.1 Establish and Maintain Detailed Enterprise Asset Inventory"
  description = "Establish and maintain an accurate, detailed, and up-to-date inventory of all enterprise assets with the potential to store or process data, to include: end-user devices (including portable and mobile), network devices, non-computing/IoT devices, and servers. Ensure the inventory records the network address (if static), hardware address, machine name, enterprise asset owner, department for each asset, and whether the asset has been approved to connect to the network. For mobile end-user devices, MDM type tools can support this process, where appropriate. This inventory includes assets connected to the infrastructure physically, virtually, remotely, and those within cloud environments. Additionally, it includes assets that are regularly connected to the enterprise’s network infrastructure, even if they are not under control of the enterprise. Review and update the inventory of all enterprise assets bi-annually, or more frequently."
  children = [
    control.ec2_stopped_instance_30_days,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_eip_associated,
    control.vpc_network_acl_unused,
    control.vpc_security_group_associated_to_eni
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_1_2" {
  title       = "1.2 Address Unauthorized Assets"
  description = "Ensure that a process exists to address unauthorized assets on a weekly basis. The enterprise may choose to remove the asset from the network, deny the asset from connecting remotely to the network, or quarantine the asset."
  children = [
    control.guardduty_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}
