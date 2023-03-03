select
  -- Required Columns
  c.arn as resource,
  case
    when s.vpc_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when s.vpc_id is not null then c.title || ' in VPC.'
    else c.title || ' not in VPC.'
  end as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
  aws_elasticache_cluster as c
  left join aws_elasticache_subnet_group as s on c.cache_subnet_group_name = s.cache_subnet_group_name;