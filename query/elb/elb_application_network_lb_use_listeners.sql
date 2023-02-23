with elb_listeners as (
  select
    load_balancer_arn,
    count(*) as listeners_num
  from
    aws_ec2_load_balancer_listener
  group by
  load_balancer_arn
),
load_balancers as (
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
  distinct l.arn as resource,
  case
    when p.load_balancer_arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when p.load_balancer_arn is not null then l.title || ' uses listeners.'
    else l.title || ' does not uses listeners.'
  end as reason,
  -- Additional Dimensions
  l.region,
  l.account_id
from
  load_balancers as l
  left join elb_listeners as p on l.arn = p.load_balancer_arn;