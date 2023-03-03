select
  -- Required Columns
  firewall_arn as resource,
  case
    when subnet_change_protection then 'ok'
    else 'alarm'
  end as status,
  case
    when subnet_change_protection then title || ' subnet change protection enabled.'
    else title || ' subnet change protection disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_networkfirewall_firewall;
