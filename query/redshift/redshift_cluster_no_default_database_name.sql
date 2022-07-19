select
  -- Required Columns
  arn as resource,
  case
    when db_name = 'dev' then 'alarm'
    else 'ok'
  end as status,
  case
    when db_name = 'dev' then title || ' using default database name.'
    else title || ' not using default database name.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_redshift_cluster;