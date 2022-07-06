with all_lb_details as (
	select
		arn,
		scheme,
		title,
		region,
		account_id
	from
		aws_ec2_application_load_balancer
	union
	select
		arn,
		scheme,
		title,
		region,
		account_id
	from
		aws_ec2_network_load_balancer
	union
	select
		arn,
		scheme,
		title,
		region,
		account_id
	from
	aws_ec2_classic_load_balancer
)
select
	-- Required Columns
	arn as resource,
	case
		when scheme = 'internet-facing' then 'alarm'
		else 'ok'
	end as status,
	case
		when scheme = 'internet-facing' then title || ' publicly accessible.'
    else title|| ' not publicly accessible.'
	end as reason,
	-- Additional Dimensions
	region,
	account_id
from
	all_lb_details;