select
  -- Required Columns
  id as resource,
  case
    when enable_termination_protection then 'ok'
    else 'alarm'
  end as status,
  case
    when enable_termination_protection then title || ' termination protection enabled.'
    else title || ' termination protection disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudformation_stack;
