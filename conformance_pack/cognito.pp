locals {
  conformance_pack_cognito_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Cognito"
  })
}

control "cognito_identity_pools_restrict_unauthenticated_identities" {
  title       = "Cognito identity pools should not allow unauthenticated identities"
  description = "This control checks whether an Amazon Cognito identity pool is configured to allow unauthenticated identities. The control fails if guest access is activated (the AllowUnauthenticatedIdentities parameter is set to true) for the identity pool."
  query       = query.cognito_identity_pools_restrict_unauthenticated_identities

  tags = local.conformance_pack_cognito_common_tags
}

query "cognito_identity_pools_restrict_unauthenticated_identities" {
  sql = <<-EOQ
    select
      identity_pool_id as resource,
      case
        when not allow_unauthenticated_identities then 'ok'
        else 'alarm'
      end as status,
      case
        when not allow_unauthenticated_identities then title || ' restrict unauthenticated identities.'
        else title || ' allow unauthenticated identities.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cognito_identity_pool;
  EOQ
}
