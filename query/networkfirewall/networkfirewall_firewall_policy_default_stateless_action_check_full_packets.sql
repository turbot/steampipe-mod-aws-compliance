select
  -- Required Columns
  arn as resource,
  case
    when (not (firewall_policy -> 'StatelessDefaultActions') ? 'aws:drop'
        and not (firewall_policy -> 'StatelessDefaultActions') ? 'aws:forward_to_sfe') then 'alarm'
    else 'ok'
  end as status,
  case
    when (not (firewall_policy -> 'StatelessDefaultActions') ? 'aws:drop'
        and not (firewall_policy -> 'StatelessDefaultActions') ? 'aws:forward_to_sfe') then title || ' stateless action is neither drop nor forward for full packets.'
    else title || ' stateless action is either drop or forward for full packets.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_networkfirewall_firewall_policy;