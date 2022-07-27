with app_lb_desync_mitigation_mode as (
  select
    arn,
    a ->> 'Key',
    a ->> 'Value' as v
  from
    aws_ec2_classic_load_balancer,
    jsonb_array_elements(additional_attributes) as a
  where
    a ->> 'Key' = 'elb.http.desyncmitigationmode'
)
select
  -- Required Columns
  c.arn as resource,
  case
    when m.v = any ( ARRAY ['defensive', 'strictest'] ) then 'ok'
    else 'alarm'
  end as status,
    title || ' has ' || m.v || ' desync mitigation mode.' as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_classic_load_balancer as c
  left join app_lb_desync_mitigation_mode as m on c.arn = m.arn;