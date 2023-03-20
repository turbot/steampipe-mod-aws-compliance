with public_launch_templates as (
  select
    i.tags ->> 'aws:ec2launchtemplate:id' as public_launch_template_id
  from
    aws_ec2_instance as i,
    jsonb_array_elements(launch_template_data -> 'NetworkInterfaces') as nic
  where
    (nic -> 'AssociatePublicIpAddress')::bool
), launch_templates_associated_instance as (
    select
      distinct tags ->> 'aws:ec2launchtemplate:id' as launch_template_id
    from
      aws_ec2_instance
)
select
  -- Required Columns
  t.launch_template_id as resource,
  case
    when i.launch_template_id is null then 'skip'
    when t.launch_template_id in ( select public_launch_template_id from public_launch_templates ) then 'alarm'
    else 'ok'
  end as status,
  case
    when i.launch_template_id is null then t.title || ' does not launch any instance.'
    when t.launch_template_id in ( select public_launch_template_id from public_launch_templates ) then t.title || ' publicly accessible.'
    else t.title || ' not publicly accessible.'
  end as reason,
  -- Additional Dimensions
  t.region,
  t.account_id
from
  aws_ec2_launch_template as t
  left join launch_templates_associated_instance as i on i.launch_template_id = t.launch_template_id;