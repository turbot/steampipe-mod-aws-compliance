select
  -- Required Columns
  arn as resource,
  case
    when connection_draining_enabled = 'true' then 'ok'
    else 'alarm'
  end status,
  case
    when connection_draining_enabled = 'true' then 'Classic Load balancer ' || name || ' connection draining is enabled.'
    else 'Classic Load balancer ' || name || ' connection draining is disabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  osborn.aws_ec2_classic_load_balancer