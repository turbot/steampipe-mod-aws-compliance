select
  -- Required Columns
  c.arn as resource,
  case
    when i.vpc_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when i.vpc_id is null then c.title || ' not in VPC.'
    else c.title || ' in VPC.'
  end as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
  aws_ec2_instance as i,
  aws_ecs_container_instance as c
where
  c.ec2_instance_id = i.instance_id;