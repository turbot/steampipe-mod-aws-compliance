 with classic_lb_with_instance as (
  select
    c.arn,
    i.instance_state
  from
    aws_ec2_classic_load_balancer as c,
    jsonb_array_elements(instances) as e
    left join aws_ec2_instance as i on i.instance_id = e ->> 'InstanceId'
  
)
select
  -- Required Columns
  a.arn as resource,
  case
    when b.load_balancer_arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.load_balancer_arn is null then a.title || ' uses certificates provided by ACM.'
    else a.title || ' has ' || b.count || ' listeners which do not use certificates provided by ACM.'
  end as reason,
  -- Additional Dimensions
  a.region,
  a.account_id
from
  aws_ec2_classic_load_balancer as c
  left join classic_lb_with_healthy_instance as b on c.arn = b.arn;