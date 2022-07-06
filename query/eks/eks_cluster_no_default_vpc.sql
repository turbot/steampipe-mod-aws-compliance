with default_vpc_cluster as (
  select
    distinct c.arn
  from
    aws_eks_cluster as c
    left join aws_vpc as v on v.vpc_id = c.resources_vpc_config ->> 'VpcId'
  where
    v.is_default
)
select
  -- Required Columns
  c.arn as resource,
  case
    when v.arn is not null then 'alarm'
    else 'ok'
  end as status,
  case
    when v.arn is not null then title || ' uses default VPC.'
    else title || ' does not use default VPC.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_eks_cluster as c
  left join default_vpc_cluster as v on v.arn = c.arn