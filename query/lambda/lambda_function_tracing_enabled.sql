select
  -- Required Columns
  arn as resource,
  case
    when tracing_config ->> 'Mode' = 'PassThrough' then 'alarm'
    else 'ok'
  end status,
  case
    when tracing_config ->> 'Mode' = 'PassThrough' then title || ' has tracing disabled.'
    else title || ' has tracing enabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_lambda_function;