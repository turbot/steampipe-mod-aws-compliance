select
  -- Required Columns
  arn as resource,
  case
    when auto_minor_version_upgrade then 'ok'
    else 'alarm'
  end as status,
  case
    when auto_minor_version_upgrade then title || ' automatic minor version upgrades configured.'
    else title || ' automatic minor version upgrades not configured.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_instance;