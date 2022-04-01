select
  -- Required Columns
  arn as resource,
  case
    when master_username = 'awsuser' then 'alarm'
    else 'ok'
  end status,
  case
    when master_username = 'awsuser' then title || ' using default master user name.'
    else title || ' not using default master user name.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_redshift_cluster;
