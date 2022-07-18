select
  -- Required Columns
  arn as resource,
  case
    when activated_rules is null or jsonb_array_length(activated_rules) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when activated_rules is null or jsonb_array_length(activated_rules) = 0 then title || ' no attached rules.'
    else title || ' attached rules.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_waf_rule_group;