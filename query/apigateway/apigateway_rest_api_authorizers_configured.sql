select
  -- Required Columns
  p.name as resource,
	case
    when a.provider_arns is not null 
      then 'ok'
    else 'alarm'
  end status,
  case 
    when a.provider_arns is not null 
      then 'Configured authorizers for ' || p.name
    else 'Not configured authorizers for ' || p.name
  end reason,
  -- Additional Dimensions
  p.region,
  p.account_id
from
  aws_api_gateway_rest_api as p 
  full outer join aws_api_gateway_authorizer as a on p.api_id = a.rest_api_id;