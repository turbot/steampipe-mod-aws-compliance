select
  -- Required Columns
  arn as resource,
  case 
    when (firewall_policy -> 'StatefulRuleGroupReferences' is null or jsonb_array_length(firewall_policy -> 'StatefulRuleGroupReferences') = 0)
      and (firewall_policy -> 'StatelessRuleGroupReferences' is null or jsonb_array_length(firewall_policy -> 'StatelessRuleGroupReferences') = 0) then 'alarm'
    else 'ok'
  end as status,
  case 
    when (firewall_policy -> 'StatefulRuleGroupReferences' is null or jsonb_array_length(firewall_policy -> 'StatefulRuleGroupReferences') = 0)
      and (firewall_policy -> 'StatelessRuleGroupReferences' is null or jsonb_array_length(firewall_policy -> 'StatelessRuleGroupReferences') = 0) then title || ' has no associated rule groups'
    else title || ' has associated rule groups'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_networkfirewall_firewall_policy;