with launch_wizard_sg_attached_instance as (
  select
    distinct arn as arn
  from
    aws_ec2_instance,
    jsonb_array_elements(security_groups) as sg
  where
    sg ->> 'GroupName' like 'launch-wizard%'
)
select
  -- Required Columns
  i.arn as resource,
  case
    when sg.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when sg.arn is null then i.title || ' not associated with launch-wizard security group.'
    else i.title || ' associated with launch-wizard security group.'
  end as reason,
  -- Additional Dimensions
  i.region,
  i.account_id
from
  aws_ec2_instance as i
  left join launch_wizard_sg_attached_instance as sg on i.arn = sg.arn;