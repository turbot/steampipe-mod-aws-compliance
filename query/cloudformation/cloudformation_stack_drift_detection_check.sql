select
  -- Required Columns
  id as resource,
  case
    when stack_drift_status = 'IN_SYNC' then 'ok'
    when stack_drift_status = 'DRIFTED' then 'alarm'
    else 'skip'
  end as status,
  case
    when stack_drift_status = 'IN_SYNC' then title || ' drift status is'|| stack_drift_status || '.'
    when stack_drift_status = 'DRIFTED' then title || ' drift status is'|| stack_drift_status || '.'
    else title || ' drift status is'|| stack_drift_status || '.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudformation_stack;