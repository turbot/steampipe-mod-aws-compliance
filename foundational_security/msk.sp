locals {
  foundational_security_msk_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/MSK"
  })
}

benchmark "foundational_security_msk" {
  title         = "MSK"
  documentation = file("./foundational_security/docs/foundational_security_mks.md")
  children = [
    control.foundational_security_msk_1
  ]

  tags = merge(local.foundational_security_msk_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_msk_1" {
  title         = "1 MSK clusters should be encrypted in transit among broker nodes"
  description   = "This controls checks if an Amazon MSK cluster is encrypted in transit with HTTPS (TLS) among the broker nodes of the cluster. The control fails if plain text communication is enabled for a cluster broker node connection."
  severity      = "medium"
  query         = query.msk_cluster_encryption_in_transit_with_tls_enabled
  documentation = file("./foundational_security/docs/foundational_security_msk_1.md")

  tags = merge(local.foundational_security_msk_common_tags, {
    foundational_security_item_id  = "msk_1"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

