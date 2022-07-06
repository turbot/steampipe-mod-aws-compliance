with sg_with_outbound as (
  select
    arn,
    sg
  from
    aws_ec2_classic_load_balancer,
    jsonb_array_elements_text(security_groups) as sg
    left join aws_vpc_security_group_rule as sgr on sg = sgr.group_id
  where
    sgr.type = 'egress'
  group by
    sg, arn
), classic_lb_without_outbound as (
  select
    distinct arn
  from
    aws_ec2_classic_load_balancer,
    jsonb_array_elements_text(security_groups) as s
  where
    s not in ( select sg from sg_with_outbound)
)
select
  distinct c.arn as resource,
  case
    when c.security_groups is null then 'alarm'
    when o.arn is not null then 'alarm'
    else 'ok'
  end as status,
  case
    when c.security_groups is null then c.title || ' does not have security group attached.'
    when o.arn is not null then c.title || ' all attached security groups does not have outbound rule(s).'
    else c.title || ' all attached security groups have outbound rule(s).'
  end as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
  aws_ec2_classic_load_balancer as c
  left join classic_lb_without_outbound as o on c.arn = o.arn