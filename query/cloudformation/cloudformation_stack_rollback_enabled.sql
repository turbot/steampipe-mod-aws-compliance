select
  -- Required Columns
  id as resource,
  case
    when not disable_rollback then 'ok'
    else 'alarm'
  end as status,
  case
    when not disable_rollback then title || ' rollback enabled.'
    else title || ' rollback disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudformation_stack;