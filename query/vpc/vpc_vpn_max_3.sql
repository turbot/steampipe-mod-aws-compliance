with vpns_in_vpc as (
  select
    count(*) as c
  from
    aws_vpc_vpn_gateway as g,
    jsonb_array_elements(vpc_attachments) as va,
    aws_vpc as v
  where
    va ->> 'State' = 'attached'
    and va ->> 'VpcId' = v.vpc_id
)
select
  -- Required Columns
  v.arn as resource,
  case
    when c <= 3 then 'ok'
    else 'alarm'
  end as status,
  case
    when c <= 3 then v.title || ' has'
  end as reason,
  -- Additional Dimensions
  a.region,
  a.account_id
from
  vpns_in_vpc;
