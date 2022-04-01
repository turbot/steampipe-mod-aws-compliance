with associated_sg as (
  select
    sg ->> 'GroupId' as secgrp_id
  from
    aws_ec2_network_interface,
    jsonb_array_elements(groups) as sg
    group by sg ->> 'GroupId'
  union
    select
    sg ->> 'GroupId' as secgrp_id
  from
    aws_ec2_instance,
    jsonb_array_elements(security_groups) as sg
    group by sg ->> 'GroupId'

)
select
  -- Required Columns
  distinct s.arn as resource,
  case
    when a.secgrp_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.secgrp_id is not null then s.title || ' is in use.'
    else s.title || ' not in use.'
  end as reason,
  -- Additional Dimensions
  s.region,
  s.account_id
from
  aws_vpc_security_group as s
  left join associated_sg as a on s.group_id = a.secgrp_id;