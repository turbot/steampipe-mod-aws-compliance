with associated_sg as (
  select
    distinct (sg ->> 'GroupName') as sg_name
  from
    aws_ec2_network_interface,
    jsonb_array_elements(groups) as sg
  where
    (sg ->> 'GroupName') like 'launch-wizard%'
)
select
  -- Required Columns
  arn as resource,
  case
    when a.sg_name is null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.sg_name is null then title || ' not in use.'
    else title || ' in use.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_vpc_security_group as s
  left join associated_sg as a on a.sg_name = s.group_name
where
  group_name like 'launch-wizard%'
