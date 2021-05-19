select
  -- Required Columns
  'arn:' || partition || ':::' || account_id as resource,
  'info' as status,
  'This is a manual control, you must verify compliance manually.' as reason,
  -- Additional Dimensions
  account_id
from
  aws_account;