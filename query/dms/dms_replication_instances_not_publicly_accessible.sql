select
  -- Required Columns
  arn as resource,
  case
    when publicly_accessible then 'alarm'
    else 'ok'
  end status,
  case
    when publicly_accessible then title || ' publicly accessible.'
    else title || ' not publicly accessible.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_dms_replication_instance;
