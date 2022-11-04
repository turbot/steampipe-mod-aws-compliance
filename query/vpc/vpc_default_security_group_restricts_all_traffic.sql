select
  -- Required Columns
  arn resource,
  case
    when jsonb_array_length(ip_permissions) = 0 and jsonb_array_length(ip_permissions_egress) = 0 then 'ok'
    else 'alarm'
  end status,
  case
    when jsonb_array_length(ip_permissions) > 0 and jsonb_array_length(ip_permissions_egress) > 0
      then 'Default security group ' || group_id || ' has inbound and outbound rules.'
    when jsonb_array_length(ip_permissions) > 0 and jsonb_array_length(ip_permissions_egress) = 0
      then 'Default security group ' || group_id || ' has inbound rules.'
    when jsonb_array_length(ip_permissions) = 0 and jsonb_array_length(ip_permissions_egress) > 0
      then 'Default security group ' || group_id || ' has outbound rules.'
    else 'Default security group ' || group_id || ' has no inbound or outbound rules.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_vpc_security_group
where
  group_name = 'default';
