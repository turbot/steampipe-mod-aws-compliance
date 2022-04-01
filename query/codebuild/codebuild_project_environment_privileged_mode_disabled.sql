select
  -- Required Columns
  arn as resource,
  case
    when environment ->> 'PrivilegedMode' = 'true' then 'alarm'
    else 'ok'
  end as status,
  case
    when environment ->> 'PrivilegedMode' = 'true' then title || ' environment privileged mode enabled.'
    else title || ' environment privileged mode disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_codebuild_project;