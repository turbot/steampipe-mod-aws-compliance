select
  -- Required Columns
	arn as resource,
	case
    when vpc_config is not null then 'ok'
    else 'alarm'
  end status,
  case
    when vpc_config is not null then title || ' VPC settings configured.'
    else title || ' VPC settings not configured.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_training_job;