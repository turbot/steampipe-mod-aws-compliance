select
  -- Required Columns
  title as resource,
	case
    when cognito_options ->> 'Enabled' = 'true'
      then 'ok'
    else 'alarm'
  end status,
  case 
    when cognito_options ->> 'Enabled' = 'true'
      then title || ' enabled Amazon Cognito authentication for Kibana'
    else title || ' disabled Amazon Cognito authentication for Kibana'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_elasticsearch_domain;