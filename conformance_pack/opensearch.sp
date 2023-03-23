control "opensearch_domain_in_vpc" {
  title       = "Amazon OpenSearch domains should be in a VPC"
  description = "This control checks whether Amazon OpenSearch domains are in a VPC. It does not evaluate the VPC subnet routing configuration to determine public access."
  query       = query.opensearch_domain_in_vpc

  tags = merge(local.conformance_pack_lambda_common_tags, {
  })
}

control "opensearch_domain_encryption_at_rest_enabled" {
  title       = "OpenSearch domains should have encryption at rest enabled"
  description = "This control checks whether Amazon OpenSearch domains have encryption-at-rest configuration enabled. The check fails if encryption at rest is not enabled."
  query       = query.opensearch_domain_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_lambda_common_tags, {
  })
}

query "opensearch_domain_in_vpc" {
  sql = <<-EOQ
    with public_subnets as (
      select
        distinct a -> 'SubnetId' as SubnetId
      from
        aws_vpc_route_table as t,
        jsonb_array_elements(associations) as a,
        jsonb_array_elements(routes) as r
      where
        r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
        and  r ->>  'GatewayId' like 'igw-%'
    ), opensearch_domain_with_public_subnet as (
      select
        arn
      from
        aws_opensearch_domain ,
        jsonb_array_elements(vpc_options -> 'SubnetIds') as s
      where
        s in (select SubnetId from public_subnets)
    )
    select
      d.arn as resource,
      case
        when d.vpc_options ->> 'VPCId' is null then 'alarm'
        when d.vpc_options ->> 'VPCId' is not null and p.arn is not null then 'alarm'
        else 'ok'
      end status,
      case
        when vpc_options ->> 'VPCId' is null then title || ' not in VPC.'
        when d.vpc_options ->> 'VPCId' is not null and p.arn is not null then title || ' attached to public subnet.'
        else title || ' in VPC ' || (vpc_options ->> 'VPCId') || '.'
      end reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "d.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "d.")}
    from
      aws_opensearch_domain as d left join opensearch_domain_with_public_subnet as p
      on d.arn = p.arn;
  EOQ
}

query "opensearch_domain_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select

      arn as resource,
      case
        when encryption_at_rest_options ->> 'Enabled' = 'false' then 'alarm'
        else 'ok'
      end status,
      case
        when encryption_at_rest_options ->> 'Enabled' = 'false' then title || ' encryption at rest not enabled.'
        else title || ' encryption at rest enabled.'
      end reason

      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}

# Non-Config rule query

query "opensearch_domain_fine_grained_access_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when advanced_security_options is null or not (advanced_security_options -> 'Enabled')::boolean then 'alarm'
        else 'ok'
      end as status,
      case
        when advanced_security_options is null or not (advanced_security_options -> 'Enabled')::boolean then title || ' having fine-grained access control disabled.'
        else title || ' having fine-grained access control enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_opensearch_domain;
  EOQ
}
