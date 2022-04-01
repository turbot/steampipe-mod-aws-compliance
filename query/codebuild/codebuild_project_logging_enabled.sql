select
  -- Required Columns
  arn as resource,
  case
    when logs_config -> 'CloudWatchLogs' ->> 'Status' = 'ENABLED' or logs_config -> 'S3Logs' ->> 'Status' = 'ENABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when logs_config -> 'CloudWatchLogs' ->> 'Status' = 'ENABLED' or logs_config -> 'S3Logs' ->> 'Status' = 'ENABLED' then title || ' logging enabled.'
    else title || ' logging disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_codebuild_project;