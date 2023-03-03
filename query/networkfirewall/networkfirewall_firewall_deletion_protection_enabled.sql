select
  -- Required Columns
  firewall_arn as resource,
  case
    when delete_protection then 'ok'
    else 'alarm'
  end as status,
  case
    when delete_protection then title || ' deletion protection enabled.'
    else title || ' deletion protection disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_networkfirewall_firewall;
