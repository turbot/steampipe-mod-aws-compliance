select
  -- Required Columns
  arn as resource,
	case
    when transfer_lock then 'ok'
    else 'alarm'
  end as status,
  case
    when transfer_lock then title || ' transfer lock enabled.'
    else title || ' transfer lock disabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_route53_domain;