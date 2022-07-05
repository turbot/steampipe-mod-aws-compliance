with sg_name as (
  select
    arn,
    sg,
    count(*) as num
	from
		aws_ec2_application_load_balancer,
		jsonb_array_elements_text(security_groups) as sg
    left join aws_vpc_security_group_rule as sgr on sg = sgr.group_id
  where
    sgr.type = 'egress'
  group by
    sg, arn
  union
  select
    arn,
    sg,
    count(*) as num
	from
		aws_ec2_classic_load_balancer,
		jsonb_array_elements_text(security_groups) as sg
    left join aws_vpc_security_group_rule as sgr on sg = sgr.group_id
  where
    sgr.type = 'egress'
  group by
    sg, arn
), all_lb as (
  select
    arn,
    title,
    security_groups,
    region,
    account_id
  from
    aws_ec2_application_load_balancer
  union
  select
    arn,
    title,
    security_groups,
    region,
    account_id
  from
    aws_ec2_classic_load_balancer
)
select
	distinct l.arn as resource,
  case
    when l.security_groups is null then 'alarm'
    when s.num = 0 then 'alarm'
    else 'ok'
  end as status,
   case
    when l.security_groups is null then l.title || ' does not have security group attached.'
    when s.num = 0 then l.title || ' does not have outbound rule.'
    else l.title || ' have outbound rule(s).'
  end as reason,
  -- Additional Dimensions
  l.region,
  l.account_id
from
  all_lb as l
  left join sg_name as s on l.arn = s.arn