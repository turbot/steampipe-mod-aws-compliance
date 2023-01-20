locals {
  foundational_security_emr_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/EMR"
  })
}

benchmark "foundational_security_emr" {
  title         = "EMR"
  documentation = file("./foundational_security/docs/foundational_security_emr.md")
  children = [
    control.foundational_security_emr_1
  ]

  tags = merge(local.foundational_security_emr_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_emr_1" {
  title         = "1 Amazon EMR cluster master nodes should not have public IP addresses"
  description   = "This control checks whether master nodes on Amazon EMR clusters have public IP addresses. The control fails if the master node has public IP addresses that are associated with any of its instances. Public IP addresses are designated in the PublicIp field of the NetworkInterfaces configuration for the instance. This control only checks Amazon EMR clusters that are in a RUNNING or WAITING state."
  severity      = "high"
  query         = query.emr_cluster_master_nodes_no_public_ip
  documentation = file("./foundational_security/docs/foundational_security_emr_1.md")

  tags = merge(local.foundational_security_emr_common_tags, {
    foundational_security_item_id  = "emr_1"
    foundational_security_category = "secure_network_configuration"
  })
}
