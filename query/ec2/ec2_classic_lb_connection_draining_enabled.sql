select
  -- Required Columns
  arn as resource,
  case
    when connection_draining_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when connection_draining_enabled then 'Classic Load balancer ' || name || ' connection draining is enabled.'
    else 'Classic Load balancer ' || name || ' connection draining is disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_classic_load_balancer;