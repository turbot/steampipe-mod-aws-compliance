select
  -- Required Columns
  autoscaling_group_arn as resource,
  case
    when health_check_type != 'ELB' then 'alarm'
    else 'ok'
  end status,
    case
    when load_balancer_names is not null and health_check_type = 'ELB' then title || ' using ELB health checks.'
    when load_balancer_names is not null and health_check_type = 'EC2'  then title || ' using EC2 health checks.'
    else title || ' not associated with a load balancer.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_autoscaling_group;
