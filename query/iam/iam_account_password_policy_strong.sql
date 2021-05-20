select
  -- Required Columns
  'arn:' || a.partition || ':::' || a.account_id as resource,
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
    when minimum_password_length is null then 'No password policy set.'
    when
      minimum_password_length >= 14
      and password_reuse_prevention >= 5
      and require_lowercase_characters = 'true'
      and require_uppercase_characters = 'true'
      and require_numbers = 'true'
      and max_password_age <= 90
    then 'Strong password policies configured.'
    else 'Strong password policies not configured.'
  end reason,
  -- Additional Dimensions
  a.account_id
from
  aws_account as a
  left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
