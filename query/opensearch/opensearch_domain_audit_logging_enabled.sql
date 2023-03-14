select
  -- Required Columns
  arn as resource,
  case
    when log_publishing_options -> 'AUDIT_LOGS' ->> 'Enabled' = 'true' then 'ok'
    else 'ok'
  end status,
  case
    when log_publishing_options -> 'AUDIT_LOGS' ->> 'Enabled' = 'true' then title || ' audit logging enabled.'
    else title || ' audit logging disabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_opensearch_domain;
