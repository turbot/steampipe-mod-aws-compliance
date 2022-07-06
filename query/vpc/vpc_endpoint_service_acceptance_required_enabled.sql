select
  -- Required Columns
  service_id as resource,
  case
    when acceptance_required then 'ok'
    else 'alarm'
  end as status,
  case
    when acceptance_required then title || ' acceptance_required enabled.'
    else title || ' acceptance_required disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_vpc_endpoint_service;