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