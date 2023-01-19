with rule_group_count as (
  select
    count(*) as rule_group_count
  from
    aws_wafv2_web_acl,
    jsonb_array_elements(rules) as r
  where
    r -> 'Statement' -> 'RuleGroupReferenceStatement' ->> 'ARN' is not null
  group by
    arn
)
select
  -- Required Columns
  arn as resource,
  case
    when rules is null or jsonb_array_length(rules) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when rules is null or jsonb_array_length(rules) = 0 then title || ' has no attached rules.'
    else title || ' has ' || (select rule_group_count from rule_group_count ) || ' rule group(s) and ' || (jsonb_array_length(rules) - (select rule_group_count from rule_group_count )) || ' rule(s) attached.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_wafv2_web_acl;