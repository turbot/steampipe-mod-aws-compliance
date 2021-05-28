select
  -- Required Columns
  arn as resource,
  case
    when runtime in ('nodejs14.x', 'nodejs12.x', 'nodejs10.x', 'python3.8', 'python3.7', 'python3.6', 'ruby2.5', 'ruby2.7', 'java11', 'java8', 'go1.x', 'dotnetcore2.1', 'dotnetcore3.1') then 'ok'
    else 'alarm'
  end as status,
  case
    when runtime in ('nodejs14.x', 'nodejs12.x', 'nodejs10.x', 'python3.8', 'python3.7', 'python3.6', 'ruby2.5', 'ruby2.7', 'java11', 'java8', 'go1.x', 'dotnetcore2.1', 'dotnetcore3.1') then title || ' configured with latest runtimes.'
    else title || ' not configured with latest runtimes.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_lambda_function;