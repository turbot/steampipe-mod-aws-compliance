locals {
  foundational_security_msk_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/MSK"
  })
}

benchmark "foundational_security_msk" {
  title         = "MSK"
  documentation = file("./foundational_security/docs/foundational_security_msk.md")
  children = [
    control.foundational_security_msk_1,
    control.foundational_security_msk_3,
    control.foundational_security_msk_4,
    control.foundational_security_msk_5,
    control.foundational_security_msk_6
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

control "foundational_security_msk_3" {
  title         = "3 MSK Connect connectors should be encrypted in transit"
  description   = "This control checks whether an Amazon MSK Connect connector is encrypted in transit. This control fails if the connector isn't encrypted in transit."
  severity      = "medium"
  query         = query.mskconnect_connector_encryption_in_transit_with_tls_enabled
  documentation = file("./foundational_security/docs/foundational_security_msk_3.md")

  tags = merge(local.foundational_security_msk_common_tags, {
    foundational_security_item_id  = "msk_3"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_msk_4" {
  title         = "4 MSK clusters should have public access disabled"
  description   = "This control checks whether public access is disabled for an Amazon MSK cluster. The control fails if public access is enabled for the MSK cluster."
  severity      = "medium"
  query         = query.msk_cluster_not_publicly_accessible
  documentation = file("./foundational_security/docs/foundational_security_msk_4.md")

  tags = merge(local.foundational_security_msk_common_tags, {
    foundational_security_item_id  = "msk_4"
    foundational_security_category = "resource_not_publicly_accessible"
  })
}

control "foundational_security_msk_5" {
  title         = "5 MSK connectors should have logging enabled"
  description   = "This control checks whether logging is enabled for an Amazon MSK connector. The control fails if logging is disabled for the MSK connector."
  severity      = "medium"
  query         = query.mskconnect_connector_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_msk_5.md")

  tags = merge(local.foundational_security_msk_common_tags, {
    foundational_security_item_id  = "msk_5"
    foundational_security_category = "logging"
  })
}

control "foundational_security_msk_6" {
  title         = "6 MSK clusters should disable unauthenticated access"
  description   = "This control checks whether unauthenticated access is enabled for an Amazon MSK cluster. The control fails if unauthenticated access is enabled for the MSK cluster."
  severity      = "medium"
  query         = query.msk_cluster_unauthenticated_access_disabled
  documentation = file("./foundational_security/docs/foundational_security_msk_6.md")

  tags = merge(local.foundational_security_msk_common_tags, {
    foundational_security_item_id  = "msk_6"
    foundational_security_category = "passwordless_authentication"
  })
}
