with load_balancers as (
  select 
    n.arn,
    n.title,
    n.region,
    n.account_id
  from
    aws_ec2_network_load_balancer as n
  union
  select 
    a.arn,
    a.title,
    a.region,
    a.account_id
  from
    aws_ec2_application_load_balancer as a
)
select
  -- Required Columns
  distinct lb.arn as resource,
  case
    when l.load_balancer_arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when l.load_balancer_arn is not null then lb.title || ' uses listener.'
    else lb.title || ' does not uses listener.'
  end as reason,
  -- Additional Dimensions
  lb.region,
  lb.account_id
from
  load_balancers as lb
  left join aws_ec2_load_balancer_listener as l on lb.arn = l.load_balancer_arn;