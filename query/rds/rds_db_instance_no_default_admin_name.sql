select
  -- Required Columns
  arn as resource,
  case
    when master_user_name in ('admin','postgres') then 'alarm'
    else 'ok'
  end status,
  case
    when master_user_name in ('admin','postgres') then title || ' using default master user name.'
    else title || ' not using default master user name.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_instance;
