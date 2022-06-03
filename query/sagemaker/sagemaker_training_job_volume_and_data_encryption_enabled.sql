select
  -- Required Columns
	title as resource,
	case
    when output_data_config ->> 'KmsKeyId' is null or output_data_config ->> 'KmsKeyId' = ''
      then 'alarm'
    else 'ok'
  end status,
  case
    when output_data_config ->> 'KmsKeyId' is null or output_data_config ->> 'KmsKeyId' = ''
      then title || ' disabled encryption of volume and output data'
    else title || ' enabled encryption of volume and output data'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_training_job;