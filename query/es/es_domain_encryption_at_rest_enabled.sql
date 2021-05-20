select
  -- Required Columns
  arn as resource,
  case
    when encryption_at_rest_options ->> 'Enabled' = 'false' then 'alarm'
    else 'ok'
  end status,
  case
    when encryption_at_rest_options ->> 'Enabled' = 'false' then 'Encryption at rest not enabled for ' || title || '.'
    else 'Encryption at rest enabled for ' || title || '.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_elasticsearch_domain;