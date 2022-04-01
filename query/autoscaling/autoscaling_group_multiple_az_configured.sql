select
  -- Required Columns
  autoscaling_group_arn as resource,
  case
    when jsonb_array_length(availability_zones) > 1 then 'ok'
    else 'alarm'
  end as status,
  title || ' has ' || jsonb_array_length(availability_zones) || ' availability zone(s).' as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_autoscaling_group;
