select
  -- Required Columns
  id as resource,
  case
    when notification_arns is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when notification_arns is not null then title || ' notifications enabled.'
    else title || ' notifications disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudformation_stack;