select
  -- Required Columns
  arn as resource,
  case
    when vpc_config is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when vpc_config is not null then title || ' in VPC.'
    else title || ' not in VPC.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_sagemaker_model;