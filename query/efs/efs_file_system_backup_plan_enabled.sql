select
  -- Required Columns
  file_system_arn as resource,
  case
    when automatic_backups = 'enabled' then 'ok'
    else 'alarm'
  end as status,
  case
    when automatic_backups = 'enabled' then title || ' backup plans enabled.'
    else title || ' backup plans not enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_efs_file_system;

