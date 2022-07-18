select
  -- Required Columns
  arn as resource,
  case
    when rules is null or jsonb_array_length(rules) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when rules is null or jsonb_array_length(rules) = 0 then title || ' no attached rules.'
    else title || ' attached rules.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_waf_web_acl;