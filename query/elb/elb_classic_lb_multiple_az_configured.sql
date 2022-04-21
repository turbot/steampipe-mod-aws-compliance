select
  -- Required Columns
  arn as resource,
  case
    when jsonb_array_length(availability_zones) < 2 then 'alarm'
    else 'ok'
  end as status,
  title || ' has ' || jsonb_array_length(availability_zones) || ' availability zone(s).' as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_classic_load_balancer;
