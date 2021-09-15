select
  -- Required Columns
  arn as resource,
  case
    when encrypted then 'ok'
    else 'alarm'
  end as status,
  case
    when encrypted then title || ' encrypted.'
    else title || ' not encrypted.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ebs_snapshot;