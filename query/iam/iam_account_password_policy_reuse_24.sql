select
  -- Required Columns
  'arn:' || partition || ':::' || account_id as resource,
  case
    when password_reuse_prevention >= 24 then 'ok'
    else 'alarm'
  end as status,
  'Password reuse prevention set to ' || password_reuse_prevention as reason,
  -- Additional Dimensions
  account_id
from
  aws_iam_account_password_policy