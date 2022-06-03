select
  -- Required Columns
	title as resource,
	case
    when vpc_config is not null
      then 'ok'
    else 'alarm'
  end status,
  case
    when vpc_config is not null
      then 'VPC configured for training job ' || title
    else 'VPC not configured for training job ' || title
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_training_job;