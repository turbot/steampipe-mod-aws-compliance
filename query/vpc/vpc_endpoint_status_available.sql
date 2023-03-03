select
  -- Required Columns
  vpc_endpoint_id as resource,
  case
    when state = 'available' then 'ok'
    else 'alarm'
  end as status,
    title || ' is in ' || state || ' state.' as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_vpc_endpoint;