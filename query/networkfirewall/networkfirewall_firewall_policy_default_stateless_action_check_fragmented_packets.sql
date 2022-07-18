select
  -- Required Columns
  arn as resource,
  case
    when (not (firewall_policy -> 'StatelessFragmentDefaultActions') ? 'aws:drop'
        and not (firewall_policy -> 'StatelessFragmentDefaultActions') ? 'aws:forward_to_sfe') then 'alarm'
    else 'ok'
  end as status,
  case
    when (not (firewall_policy -> 'StatelessFragmentDefaultActions') ? 'aws:drop'
        and not (firewall_policy -> 'StatelessFragmentDefaultActions') ? 'aws:forward_to_sfe') then title || ' stateless action neither drop nor forward for fragmented packets'
    else title || ' stateless action either drop or forward for fragmented packets'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_networkfirewall_firewall_policy;