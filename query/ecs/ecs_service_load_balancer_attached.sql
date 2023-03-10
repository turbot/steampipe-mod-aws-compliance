select
  -- Required Columns
  arn as resource,
  case
    when jsonb_array_length(load_balancers) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when jsonb_array_length(load_balancers) = 0 then title || ' has no load balancer attached.'
    else title || ' has ' || jsonb_array_length(load_balancers) || ' load balancer(s) attached.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_service;