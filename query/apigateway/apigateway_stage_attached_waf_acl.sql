select
  -- Required Columns
  title as resource,
	case
    when web_acl_arn is not null 
      then 'ok'
    else 'alarm'
  end status,
  case 
    when web_acl_arn is not null 
      then title || ' attached WAF ACL'
    else title || ' no attached WAF ACL'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_api_gateway_stage;