select
  -- Required Columns
  akas as resource,
  case
    when predicates is null or jsonb_array_length(predicates) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when predicates is null or jsonb_array_length(predicates) = 0 then title || ' has no attached conditions.'
    else title || ' has attached conditions.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_wafregional_rule;