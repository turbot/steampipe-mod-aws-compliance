select
  -- Required Columns
  name as resource,
  case
    when owner_type = 'Self' and account_ids :: jsonb ? 'all' then 'alarm'
    else 'ok'
  end as status,
  case
    when owner_type = 'Self' and account_ids :: jsonb ? 'all' then title || ' publicly accessible.'
    else title || ' not publicly accessible.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ssm_document;