select
  -- Required Columns
	title as resource,
	case
    when enable_inter_container_traffic_encryption
      then 'ok'
    else 'alarm'
  end status,
  case
    when enable_inter_container_traffic_encryption
      then title || ' enabled encryption of inter-container traffic'
    else title || ' disabled encryption of inter-container traffic'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_training_job;