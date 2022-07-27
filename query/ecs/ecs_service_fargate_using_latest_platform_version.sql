select
  -- Required Columns
    arn as resource,
  case
    when launch_type <> 'FARGATE' then 'skip'
    when platform_version = 'LATEST' then 'ok'
    else 'alarm'
  end as status,
  case
    when launch_type <> 'FARGATE' then title || ' is ' || launch_type || ' service.'
    when platform_version = 'LATEST' then title || ' running on the latest fargate platform version.'
    else title || ' not running on the latest fargate platform version.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_service;