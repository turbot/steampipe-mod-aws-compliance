select
  -- Required Columns
  autoscaling_group_arn as resource,
  case
    when load_balancer_names is null and target_group_arns is null then 'alarm'
    when health_check_type != 'ELB' then 'alarm'
    else 'ok'
  end as status,
  case
    when load_balancer_names is null and target_group_arns is null then title || ' not associated with ELBs.'
    when health_check_type != 'ELB' then title || ' not using ELB health check type.'
    else title || ' using ELB health check type.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_autoscaling_group;