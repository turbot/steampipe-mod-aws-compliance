with sg_with_outbound as (
  select
    arn,
    sg
  from
    aws_ec2_application_load_balancer,
    jsonb_array_elements_text(security_groups) as sg
    left join aws_vpc_security_group_rule as sgr on sg = sgr.group_id
  where
    sgr.type = 'egress'
  group by
    sg, arn
), application_lb_without_outbound as (
  select
    distinct arn
  from
    aws_ec2_application_load_balancer,
    jsonb_array_elements_text(security_groups) as s
  where
    s not in ( select sg from sg_with_outbound)
)
select
  distinct a.arn as resource,
  case
    when a.security_groups is null then 'alarm'
    when o.arn is not null then 'alarm'
    else 'ok'
  end as status,
  case
    when a.security_groups is null then a.title || ' does not have security group attached.'
    when o.arn is not null then a.title || ' all attached security groups does not have outbound rule(s).'
    else a.title || ' all attached security groups have outbound rule(s).'
  end as reason,
  -- Additional Dimensions
  a.region,
  a.account_id
from
  aws_ec2_application_load_balancer as a
  left join application_lb_without_outbound as o on a.arn = o.arn