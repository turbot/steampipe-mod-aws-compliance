select
  -- Required Columns
  arn as resource,
  case
    when state = 'in-use' then 'ok'
    else 'alarm'
  end as status,
  case
    when state = 'in-use' then title || ' attached to EC2 instance.'
    else title || ' not attached to EC2 instance.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ebs_volume;