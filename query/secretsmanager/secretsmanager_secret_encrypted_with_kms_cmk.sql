with encryption_keys as (
  select
    distinct s.arn,
    k.aliases as alias
  from
    aws_secretsmanager_secret as s
    left join aws_kms_key as k on k.arn = s.kms_key_id
  where
    k.aliases is not null
)
select
  -- Required Columns
  s.arn as resource,
  case
    when kms_key_id is null
      or kms_key_id = 'alias/aws/secretsmanager'
      or k.alias @> '[{"AliasName":"alias/aws/secretsmanager"}]'then 'ok'
    else 'alarm'
  end as status,
  case
    when kms_key_id is null
      or kms_key_id = 'alias/aws/secretsmanager'
      or k.alias @> '[{"AliasName":"alias/aws/secretsmanager"}]' then title || ' encrypted with CMK.'
    else title || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_secretsmanager_secret as s
  left join encryption_keys as k on s.arn = k.arn;