with encrypted_fs as (
  select
    fs.arn as arn,
    key_manager
  from
    aws_efs_file_system as fs
    left join aws_kms_key as k on fs.kms_key_id = k.arn
  where
    enabled
)
select
  -- Required Columns
  f.arn as resource,
  case
    when not encrypted then 'alarm'
    when encrypted and e.key_manager = 'CUSTOMER' then 'ok'
    else 'alarm'
  end as status,
  case
    when not encrypted then title || ' not encrypted.'
    when encrypted and e.key_manager = 'CUSTOMER' then title || ' encrypted with CMK.'
    else title || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_efs_file_system as f
  left join encrypted_fs as e on f.arn = e.arn;
