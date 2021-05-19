select
  -- Required Columns
  'arn:' || partition || ':::' || account_id as resource,
  case
    when minimum_password_length >= 14 then 'ok'
    else 'alarm'
  end as status,
  'Minimum password length set to ' || minimum_password_length as reason,
  -- Additional Dimensions
  account_id
from
  aws_iam_account_password_policy