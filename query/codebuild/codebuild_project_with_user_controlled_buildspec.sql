select
  -- Required Columns
  arn as resource,
  case
    when split_part(source ->> 'Buildspec', '.', -1) = 'yml' then 'alarm'
    else 'ok'
  end as status,
  case
    when split_part(source ->> 'Buildspec', '.', -1) = 'yml' then title || ' uses a user controlled buildspec.'
    else title || ' does not uses a user controlled buildspec.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_codebuild_project;