select
  -- Required Columns
  arn as resource,
  case
    when advanced_security_options ->> 'InternalUserDatabaseEnabled' = 'true' then 'ok'
    else 'alarm'
  end as status,
  case
    when advanced_security_options ->> 'InternalUserDatabaseEnabled' = 'true' then title || ' internal user database enabled.'
    else title || ' internal user database disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_elasticsearch_domain;