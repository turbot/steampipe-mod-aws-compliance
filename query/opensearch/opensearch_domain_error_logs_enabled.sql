select
  -- Required Columns
  arn as resource,
  case
    when log_publishing_options -> 'ES_APPLICATION_LOGS' ->> 'Enabled' = 'true' then 'alarm'
    else 'ok'
  end status,
  case
    when log_publishing_options -> 'ES_APPLICATION_LOGS' ->> 'Enabled' = 'true' then title || ' error logging enabled.'
    else title || ' error logging disabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_opensearch_domain;
