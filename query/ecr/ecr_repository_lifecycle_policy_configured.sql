select
  -- Required Columns
  arn as resource,
  case
    when lifecycle_policy -> 'rules' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when lifecycle_policy -> 'rules' is not null then title || ' lifecycle policy configured.'
    else title || ' lifecycle policy not configured.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecr_repository;