select
  -- Required Columns
  'arn' || ':' || 'aws' || ':::' || account_id as resource,
  case
    when block_public_acls
      and block_public_policy
      and ignore_public_acls
      and restrict_public_buckets
      then 'ok'
    else 'alarm'
  end as status,
  case
    when block_public_acls
      and block_public_policy
      and ignore_public_acls
      and restrict_public_buckets
      then 'Account level public access blocks enabled.'
    else 'Account level public access blocks not enabled.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  aws_s3_account_settings;