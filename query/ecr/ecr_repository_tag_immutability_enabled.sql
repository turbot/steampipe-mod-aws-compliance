select
  -- Required Columns
  arn as resource,
  case
    when image_tag_mutability = 'IMMUTABLE' then 'ok'
    else 'alarm'
  end as status,
  case
    when image_tag_mutability = 'IMMUTABLE' then title || ' tag immutability enabled.'
    else title || ' tag immutability disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecr_repository;