select
  -- Required Columns
  title as resource,
	case
    when query_logging_configs is not null 
      then 'ok'
    else 'alarm'
  end status,
  case 
    when query_logging_configs is not null 
      then title || ' disabled query logging to cloudwatch'
    else title || ' disabled query logging to cloudwatch'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_route53_zone;