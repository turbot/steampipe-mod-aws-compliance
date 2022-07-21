with app_lb_desync_mitigation_mode as (
  select
    arn,
    l ->> 'Key',
    l ->> 'Value' as v
  from
    aws_ec2_application_load_balancer,
    jsonb_array_elements(load_balancer_attributes) as l
  where
    l ->> 'Key' = 'routing.http.desync_mitigation_mode'
)
select
  -- Required Columns
  a.arn as resource,
  case
    when m.v = any ( ARRAY ['defensive', 'strictest'] ) then 'ok'
    else 'alarm'
  end as status,
    title || ' has ' || m.v || ' desync mitigation mode.' as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_application_load_balancer as a
  left join app_lb_desync_mitigation_mode as m on a.arn = m.arn;