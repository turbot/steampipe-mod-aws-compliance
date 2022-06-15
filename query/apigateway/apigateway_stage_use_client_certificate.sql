select
  -- Required Columns
  title as resource,
	case
    when client_certificate_id is not null 
      then 'ok'
    else 'alarm'
  end status,
  case 
    when client_certificate_id is not null 
      then 'client certificate for ' || title || ' enabled'
    else 'client certificate for ' || title || ' disabled'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_api_gateway_stage;