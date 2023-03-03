select
  -- Required Columns
  firewall_arn as resource,
  case
    when sm is not null and (power(2, 32 - masklen(cidr_block:: cidr)) <= 15) then 'ok'
    else 'alarm'
  end as status,
  case
    when sm is not null and (power(2, 32 - masklen(cidr_block:: cidr)) <= 15) then f.title || ' resides in dedicated subnet.'
    else f.title || ' does not reside in dedicated subnet.'
  end as reason,
  -- Additional Dimensions
  f.region,
  f.account_id
from
  aws_networkfirewall_firewall as f,
  jsonb_array_elements(subnet_mappings) as sm
  left join aws_vpc_subnet as s on sm ->> 'SubnetId' = s.subnet_id;