select
  -- Required Columns
  firewall_arn as resource,
  case
    when firewall_policy_change_protection then 'ok'
    else 'alarm'
  end as status,
  case
    when firewall_policy_change_protection then title || ' policy change protection enabled.'
    else title || ' policy change protection disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_networkfirewall_firewall;