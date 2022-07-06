select
  -- Required Columns
  autoscaling_group_arn as resource,
  case
    when suspended_processes is null then 'ok'
    else 'alarm'
  end as status,
  case
    when suspended_processes is null then title || ' has no suspended process.'
    else title || ' has suspended process.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_autoscaling_group;