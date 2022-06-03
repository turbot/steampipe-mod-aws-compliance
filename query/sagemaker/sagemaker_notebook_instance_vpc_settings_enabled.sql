select
  -- Required Columns
	title as resource,
	case
    when subnet_id is not null
      then 'ok'
    else 'alarm'
  end status,
  case
    when subnet_id is not null
      then 'VPC settings configured for notebook instance ' || title
    else 'VPC settings not configured for notebook instance ' || title
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_notebook_instance;