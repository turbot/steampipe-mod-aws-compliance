select
  -- Required Columns
  cluster_arn as resource,
  case
    when s ->> 'Name' = 'containerInsights' and s ->> 'Value' = 'enabled' then 'ok'
    else 'alarm'
  end as status,
  case
    when s ->> 'Name' = 'containerInsights' and s ->> 'Value' = 'enabled' then title || ' Container Insights enabled.'
    else title || ' Container Insights disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_cluster as c,
  jsonb_array_elements(settings) as s;