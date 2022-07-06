select
  -- Required Columns
  arn as resource,
  case
    when cognito_options ->> 'Enabled' = 'true' then 'ok'
    else 'alarm'
  end as status,
  case
    when cognito_options ->> 'Enabled' = 'true' then title || ' Amazon Cognito authentication for Kibana enabled.'
    else title || ' Amazon Cognito authentication for Kibana disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_elasticsearch_domain;