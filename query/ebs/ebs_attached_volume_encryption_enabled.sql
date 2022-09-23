select
  -- Required Columns
  arn as resource,
  case
    when state != 'in-use' then 'info'
    when encrypted then 'ok'
    else 'alarm'
  end as status,
  case
    when state != 'in-use' then volume_id || ' not attached.'
    when encrypted then volume_id || ' encrypted.'
    else volume_id || ' not encrypted.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ebs_volume;