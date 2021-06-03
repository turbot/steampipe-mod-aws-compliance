select
  -- Required Columns
  arn as resource,
  case
    when storage_encrypted then 'ok'
    else 'alarm'
  end as status,
  case
    when storage_encrypted then title || ' encryption enabled.'
    else title || ' encryption disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_instance;