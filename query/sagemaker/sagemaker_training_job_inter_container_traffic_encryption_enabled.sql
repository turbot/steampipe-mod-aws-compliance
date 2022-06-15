select
  -- Required Columns
	arn as resource,
	case
    when enable_inter_container_traffic_encryption then 'ok'
    else 'alarm'
  end as status,
  case
    when enable_inter_container_traffic_encryption then title || ' inter-container traffic encryption enabled.'
    else title || ' inter-container traffic encryption disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_training_job;