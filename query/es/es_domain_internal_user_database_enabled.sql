select
  -- Required Columns
  title as resource,
	case
    when advanced_security_options ->> 'InternalUserDatabaseEnabled' = 'true'
      then 'ok'
    else 'alarm'
  end status,
  case 
    when advanced_security_options ->> 'InternalUserDatabaseEnabled' = 'true'
      then title || ' enabled internal user database'
    else title || ' disabled internal user database'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_elasticsearch_domain;