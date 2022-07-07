select
  -- Required Columns
  arn as resource,
  case
    when enabled_cloudwatch_logs_exports is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when enabled_cloudwatch_logs_exports is not null then title || ' integrated with CloudWatch logs.'
    else title || ' not integrated with CloudWatch logs.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_instance;