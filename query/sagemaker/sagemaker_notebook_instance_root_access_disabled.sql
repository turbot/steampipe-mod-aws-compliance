select
  -- Required Columns
	arn as resource,
	case
    when root_access = 'Disabled' then 'ok'
    else 'alarm'
  end status,
  case
    when root_access = 'Disabled' then title || ' root access disabled.'
    else title || ' root access enabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_notebook_instance;