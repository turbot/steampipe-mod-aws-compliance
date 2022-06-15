select
  -- Required Columns
	arn as resource,
	case
    when output_data_config ->> 'KmsKeyId' is null or output_data_config ->> 'KmsKeyId' = '' then 'alarm'
    else 'ok'
  end as status,
  case
    when output_data_config ->> 'KmsKeyId' is null or output_data_config ->> 'KmsKeyId' = '' then title || ' volume and output data encryption disabled.'
    else title || ' volume and output data encryption enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_sagemaker_training_job;