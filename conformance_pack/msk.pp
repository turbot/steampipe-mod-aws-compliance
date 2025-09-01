locals {
  conformance_pack_msk_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/MSK"
  })
}

control "msk_cluster_encryption_in_transit_with_tls_enabled" {
  title       = "MSK clusters should be encrypted in transit among broker nodes"
  description = "This controls checks if an Amazon MSK cluster is encrypted in transit with HTTPS (TLS) among the broker nodes of the cluster. The control fails if plain text communication is enabled for a cluster broker node connection."
  query       = query.msk_cluster_encryption_in_transit_with_tls_enabled

  tags = merge(local.conformance_pack_msk_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "mskconnect_connector_encryption_in_transit_with_tls_enabled" {
  title         = "MSK Connect connectors should be encrypted in transit"
  description   = "This control checks whether an Amazon MSK Connect connector is encrypted in transit. This control fails if the connector isn't encrypted in transit."
  query         = query.mskconnect_connector_encryption_in_transit_with_tls_enabled

  tags = local.conformance_pack_msk_common_tags
}

control "msk_cluster_not_publicly_accessible" {
  title         = "MSK clusters should have public access disabled"
  description   = "This control checks whether public access is disabled for an Amazon MSK cluster. The control fails if public access is enabled for the MSK cluster."
  query         = query.msk_cluster_not_publicly_accessible

  tags = local.conformance_pack_msk_common_tags
}

control "mskconnect_connector_logging_enabled" {
  title         = "MSK connectors should have logging enabled"
  description   = "This control checks whether logging is enabled for an Amazon MSK connector. The control fails if logging is disabled for the MSK connector."
  query         = query.mskconnect_connector_logging_enabled

  tags = local.conformance_pack_msk_common_tags
}

control "msk_cluster_unauthenticated_access_disabled" {
  title         = "MSK clusters should disable unauthenticated access"
  description   = "This control checks whether unauthenticated access is enabled for an Amazon MSK cluster. The control fails if unauthenticated access is enabled for the MSK cluster."
  query         = query.msk_cluster_unauthenticated_access_disabled

  tags = local.conformance_pack_msk_common_tags
}

query "msk_cluster_encryption_in_transit_with_tls_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when provisioned -> 'EncryptionInfo' -> 'EncryptionInTransit' ->> 'ClientBroker' = 'TLS' then 'ok'
        else 'alarm'
      end as status,
      case
        when provisioned -> 'EncryptionInfo' -> 'EncryptionInTransit' ->> 'ClientBroker' = 'TLS' then title || ' encryption in transit enabled with TLS.'
        else title || ' encryption in transit enabled with plaintext.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_msk_cluster;
  EOQ
}

query "msk_cluster_not_publicly_accessible" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when provisioned -> 'BrokerNodeGroupInfo' -> 'ConnectivityInfo' -> 'PublicAccess' ->> 'Type' = 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when provisioned -> 'BrokerNodeGroupInfo' -> 'ConnectivityInfo' -> 'PublicAccess' ->> 'Type' = 'DISABLED' then title || ' restricts public access.'
        else title || ' allows public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_msk_cluster;
  EOQ
}

query "msk_cluster_unauthenticated_access_disabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not (provisioned -> 'ClientAuthentication' -> 'Unauthenticated' -> 'Enabled')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when not (provisioned -> 'ClientAuthentication' -> 'Unauthenticated' -> 'Enabled')::bool then title || ' unauthenticated access disabled.'
        else title || ' unauthenticated access enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_msk_cluster;
  EOQ
}

query "mskconnect_connector_encryption_in_transit_with_tls_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when kafka_cluster_encryption_in_transit ->> 'EncryptionType' = 'TLS' then 'ok'
        else 'alarm'
      end as status,
      case
        when kafka_cluster_encryption_in_transit ->> 'EncryptionType' = 'TLS' then title || ' encryption in transit enabled.'
        else title || ' encryption in transit enabled with plaintext.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_mskconnect_connector;
  EOQ
}

query "mskconnect_connector_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when log_delivery is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when log_delivery is not null  then title || ' logging enabled.'
        else title || ' logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_mskconnect_connector;
  EOQ
}