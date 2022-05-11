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
  -- Required Columns
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
  end reason,
  -- Additional Dimensions
  d.region,
  d.account_id
from
  aws_opensearch_domain as d left join opensearch_domain_with_public_subnet as p
  on d.arn = p.arn;