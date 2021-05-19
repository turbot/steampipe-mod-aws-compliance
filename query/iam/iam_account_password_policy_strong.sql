select
  -- Required Columns
  'arn:' || partition || ':::' || account_id as resource,
  case
    when
      minimum_password_length >= 14
      and password_reuse_prevention >= 5
      and require_lowercase_characters = 'true'
      and require_uppercase_characters = 'true'
      and require_numbers = 'true'
      and max_password_age <= 90
    then 'ok'
    else 'alarm'
  end status,
  case
    when
      minimum_password_length >= 14
      and password_reuse_prevention >= 5
      and require_lowercase_characters = 'true'
      and require_uppercase_characters = 'true'
      and require_numbers = 'true'
      and max_password_age <= 90
    then 'Strong password policies configured for IAM users.'
    else 'Strong password policies not configured for IAM users.'
  end reason,
  -- Additional Dimensions
  account_id
from
  aws_iam_account_password_policy;
