select
  -- Required Columns
  arn as resource,
  case
    when db_name = 'dev' then 'alarm'
    else 'ok'
  end as status,
  case
    when db_name = 'dev' then title || ' default database name used.'
    else title || ' default database name not used.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_redshift_cluster;