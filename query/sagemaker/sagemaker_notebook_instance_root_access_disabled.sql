select
  -- Required Columns
	title as resource,
	case
    when root_access = 'disabled'
      then 'ok'
    else 'alarm'
  end status,
  case
    when root_access = 'disabled'
      then 'Root access disabled for notebook instance ' || title
    else 'Root access enabled for notebook instance ' || title
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_notebook_instance;