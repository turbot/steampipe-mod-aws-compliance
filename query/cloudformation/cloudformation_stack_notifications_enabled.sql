select
  -- Required Columns
  id as resource,
  case
    when jsonb_array_length(notification_arns) > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when jsonb_array_length(notification_arns) > 0 then title || ' notifications enabled.'
    else title || ' notifications disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudformation_stack;