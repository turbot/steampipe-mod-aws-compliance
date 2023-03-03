select
  -- Required Columns
  c.arn as resource,
  case
    when ((jsonb_array_length(instances) >= 2) and (d ->> 'Status' = 'passed') and (instance_status -> 'InstanceStatus' ->> 'Status' = 'ok')) then 'ok'
    else 'alarm'
  end as status,
    c.title || ' has ' || jsonb_array_length(instances) || ' healthy instance(s) connected.' as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
  aws_ec2_classic_load_balancer as c,
  jsonb_array_elements(instances) as i,
  aws_ec2_instance as ei,
  jsonb_array_elements(instance_status -> 'InstanceStatus' -> 'Details') as d
where
  i ->> 'InstanceId' = ei.instance_id;