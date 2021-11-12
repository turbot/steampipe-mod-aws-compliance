locals {
  control_tower_disallow_internet_connection_common_tags = merge(local.control_tower_common_tags, {
    control_set = "disallow_internet_connection"
  })
}

benchmark "control_tower_disallow_internet_connection" {
  title         = "Disallow Internet Connection"
  description   = "This benchmark checks if VPC security group restrict ingress from RDP and SSH."
  children = [
    benchmark.control_tower_disallow_internet_connection_2_0_1,
    benchmark.control_tower_disallow_internet_connection_2_0_2
  ]
  tags          = local.control_tower_disallow_internet_connection_common_tags
}

benchmark "control_tower_disallow_internet_connection_2_0_1" {
  title         = "2.0.1 - Disallow internet connection through RDP"
  description   = "Disallow internet connection through RDP - Checks whether security groups that are in use disallow unrestricted incoming TCP traffic to the specified"
  children = [
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = merge(local.control_tower_disallow_internet_connection_common_tags, {
    control_tower_item_id  = "2.0.1"
  })
}

benchmark "control_tower_disallow_internet_connection_2_0_2" {
  title         = "2.0.2 - Disallow internet connection through SSH"
  description   = "Disallow internet connection through SSH - Checks whether security groups that are in use disallow unrestricted incoming SSH traffic."
  children = [
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = merge(local.control_tower_disallow_internet_connection_common_tags, {
    control_tower_item_id  = "2.0.2"
  })
}