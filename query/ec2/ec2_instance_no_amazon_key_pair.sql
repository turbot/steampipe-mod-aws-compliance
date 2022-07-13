select
  -- Required Columns
  arn as resource,
  case
    when instance_state <> 'running' then 'skip'
    when key_name is null then 'ok'
    else 'alarm'
  end as status,
  case
     when instance_state <> 'running' then title || ' is in ' || instance_state || ' state.'
    when key_name is null then title || ' not launched using amazon key pairs.'
    else title || ' launched using amazon key pairs.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_instance;
