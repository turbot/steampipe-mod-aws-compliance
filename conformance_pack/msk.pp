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

query "msk_cluster_restrict_public_access" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when provisioned -> 'BrokerNodeGroupInfo' -> 'ConnectivityInfo' -> 'PublicAccess' ->> 'Type' = 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when provisioned -> 'BrokerNodeGroupInfo' -> 'ConnectivityInfo' -> 'PublicAccess' ->> 'Type' = 'DISABLED' then title || ' restrict public access.'
        else title || ' allow public access.'
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