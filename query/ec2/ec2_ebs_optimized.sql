select
  -- Required Columns
  arn as resource,
  case
    when ebs_optimized then 'ok'
    else 'alarm'
  end as status,
  case
    when ebs_optimized then title || ' ebs optimization enabled.'
    else title || '  ebs optimization disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_instance;