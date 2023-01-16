select
  -- Required Columns
  arn as resource,
  case
    when rules is null or jsonb_array_length(rules) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when rules is null or jsonb_array_length(rules) = 0 then title || ' has no attached rules.'
    else title || ' has attached rules.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_wafv2_web_acl;