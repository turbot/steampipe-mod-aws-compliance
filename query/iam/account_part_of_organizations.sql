select
  -- Required Columns
  arn as resource,
  case
    when organization_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when organization_id is not null then title || ' is part of organization(s).'
    else title || ' is not part of organization.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_account;