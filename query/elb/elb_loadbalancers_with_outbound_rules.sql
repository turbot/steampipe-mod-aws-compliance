with sg_name as (
  select
    arn,
    sg
	from
		aws_ec2_application_load_balancer,
		jsonb_array_elements_text(security_groups) as sg
    join aws_vpc_security_group_rule as sgr on sg.group_id = sgr.group_id
    where
    sgr.type = 'egress'
  union
  select
    arn,
		sg
	from
		aws_ec2_classic_load_balancer,
		jsonb_array_elements_text(security_groups) as sg
  union
  select
    arn,
    sg
  from
    aws_ec2_network_load_balancer,
    jsonb_array_elements_text(security_groups) as sg
), all_lb as (
   select
    *
    from
      aws_ec2_application_load_balancer
    union
    select
      *
    from
      aws_ec2_classic_load_balancer
    union
    select
      *
    from
      aws_ec2_network_load_balancer
)
select
	count(sgr.type)
from
  all_lb as l

	aws_vpc_security_group_rule as sgr on sg.group_name = sgr.group_name,
	sg_name
where
	sgr.type = 'egress'
	and sgr.group_id = sg_name.sg;