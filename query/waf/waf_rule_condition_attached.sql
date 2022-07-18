select
  -- Required Columns
  akas as resource,
  case
    when predicates is null or jsonb_array_length(predicates) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when predicates is null or jsonb_array_length(predicates) = 0 then title || ' no attached conditions.'
    else title || ' attached conditions.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_waf_rule;