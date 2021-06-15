select
  -- Required Columns
  arn as resource,
  case
    when kms_key_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when kms_key_id is null then title || ' KMS key not configured.'
    else title || ' KMS key configured.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_sagemaker_endpoint_configuration;