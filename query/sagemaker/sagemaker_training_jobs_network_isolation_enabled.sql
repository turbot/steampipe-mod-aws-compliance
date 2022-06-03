select
  -- Required Columns
	title as resource,
	case
    when enable_network_isolation
      then 'ok'
    else 'alarm'
  end status,
  case
    when enable_network_isolation
      then 'Network isolation enabled for training job ' || title
    else 'Network isolation disabled for training job ' || title
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_training_job;