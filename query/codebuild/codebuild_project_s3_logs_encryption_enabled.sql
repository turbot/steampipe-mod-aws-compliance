select
  -- Required Columns
  arn as resource,
  case
    when not (logs_config -> 'S3Logs' ->> 'EncryptionDisabled')::bool then 'ok'
    else 'alarm'
  end as status,
  case
    when not (logs_config -> 'S3Logs' ->> 'EncryptionDisabled')::bool then title || ' S3Logs encryption enabled.'
    else title || ' S3Logs encryption disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_codebuild_project;