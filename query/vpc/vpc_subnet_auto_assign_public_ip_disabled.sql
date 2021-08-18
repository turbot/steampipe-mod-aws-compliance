select
  -- Required Columns
  subnet_id as resource,
  case
    when map_public_ip_on_launch = 'false' then 'ok'
    else 'alarm'
  end status,
  case
    when map_public_ip_on_launch = 'false' then title || ' SUBNET AUTO ASSIGN PUBLIC IP DISABLED.'
    else title || ' SUBNET AUTO ASSIGN PUBLIC IP ENABLED.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_vpc_subnet