select
  -- Required Columns
  name as resource,
  case
    when account_ids @> '["all"]' then 'alarm'
    else 'ok'
  end as status,
  case
    when account_ids @> '["all"]' then title || ' publicly accesible.'
    else title || ' not publicly accesible.'
  end as reason,
  -- Additional Dimentions
  region,
  account_id
from
  aws_ssm_document
where
  owner = 'self';