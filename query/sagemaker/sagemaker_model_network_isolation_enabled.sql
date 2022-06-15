select
  -- Required Columns
	arn as resource,
	case
    when enable_network_isolation then 'ok'
    else 'alarm'
  end as status,
  case
    when enable_network_isolation then title || ' network isolation enabled.'
    else title || ' network isolation disabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_model;