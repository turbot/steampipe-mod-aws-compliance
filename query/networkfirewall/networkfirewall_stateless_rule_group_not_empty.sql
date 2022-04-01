select
  -- Required Columns
  arn as resource,
  case
    when type = 'STATEFUL' then 'skip'
    when jsonb_array_length(rules_source -> 'StatelessRulesAndCustomActions' -> 'StatelessRules') > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when type = 'STATEFUL' then title || ' is a stateful rule group.'
    else title || ' has ' || jsonb_array_length(rules_source -> 'StatelessRulesAndCustomActions' -> 'StatelessRules') || ' rule(s).'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_networkfirewall_rule_group;
