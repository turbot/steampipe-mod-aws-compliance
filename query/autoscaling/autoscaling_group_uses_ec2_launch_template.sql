select
  -- Required Columns
  autoscaling_group_arn as resource,
  case
    when launch_template_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when launch_template_id is not null then title || 'created from an EC2 launch template.'
    else title || 'not created from an EC2 launch template.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_autoscaling_group;