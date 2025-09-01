locals {
  foundational_security_emr_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/EMR"
  })
}

benchmark "foundational_security_emr" {
  title         = "EMR"
  documentation = file("./foundational_security/docs/foundational_security_emr.md")
  children = [
    control.foundational_security_emr_1,
    control.foundational_security_emr_2,
    control.foundational_security_emr_3,
    control.foundational_security_emr_4
  ]

  tags = merge(local.foundational_security_emr_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_emr_1" {
  title         = "1 Amazon EMR cluster primary nodes should not have public IP addresses"
  description   = "This control checks whether master nodes on Amazon EMR clusters have public IP addresses. The control fails if the master node has public IP addresses that are associated with any of its instances. Public IP addresses are designated in the PublicIp field of the NetworkInterfaces configuration for the instance. This control only checks Amazon EMR clusters that are in a RUNNING or WAITING state."
  severity      = "high"
  query         = query.emr_cluster_master_nodes_no_public_ip
  documentation = file("./foundational_security/docs/foundational_security_emr_1.md")

  tags = merge(local.foundational_security_emr_common_tags, {
    foundational_security_item_id  = "emr_1"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_emr_2" {
  title         = "2 Amazon EMR block public access setting should be enabled"
  description   = "This control checks whether your account is configured with Amazon EMR block public access. The control fails if the block public access setting isn't enabled or if any port other than port 22 is allowed."
  severity      = "critical"
  query         = query.emr_account_public_access_blocked
  documentation = file("./foundational_security/docs/foundational_security_emr_2.md")

  tags = merge(local.foundational_security_emr_common_tags, {
    foundational_security_item_id  = "emr_2"
    foundational_security_category = "resource_not_publicly_accessible"
  })
}

control "foundational_security_emr_3" {
  title         = "3 Amazon EMR security configurations should be encrypted at rest"
  description   = "This control checks whether an Amazon EMR security configuration has encryption at rest enabled. The control fails if the security configuration doesn't enable encryption at rest."
  severity      = "medium"
  query         = query.emr_security_configuration_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_emr_3.md")

  tags = merge(local.foundational_security_emr_common_tags, {
    foundational_security_item_id  = "emr_3"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_emr_4" {
  title         = "4 Amazon EMR security configurations should be encrypted in transit"
  description   = "This control checks whether an Amazon EMR security configuration has encryption in transit enabled. The control fails if the security configuration doesn't enable encryption in transit."
  severity      = "medium"
  query         = query.emr_security_configuration_encryption_in_transit_enabled
  documentation = file("./foundational_security/docs/foundational_security_emr_4.md")

  tags = merge(local.foundational_security_emr_common_tags, {
    foundational_security_item_id  = "emr_4"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}
