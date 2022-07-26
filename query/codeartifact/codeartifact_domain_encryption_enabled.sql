select
  -- Required Columns
  arn as resource,
  case
    when encryption_key is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption_key is not null then title || ' domain has encryption enabled.'
    else title || ' domain has encryption disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_codeartifact_domain;