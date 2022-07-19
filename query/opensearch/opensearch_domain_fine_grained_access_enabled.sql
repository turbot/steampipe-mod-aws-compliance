select
  -- Required Columns
  arn as resource,
  case
    when advanced_security_options is null or not (advanced_security_options -> 'Enabled')::boolean then 'alarm'
    else 'ok'
  end as status,
  case
    when advanced_security_options is null or not (advanced_security_options -> 'Enabled')::boolean then title || ' having fine-grained access control disabled.'
    else title || ' having fine-grained access control enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_opensearch_domain;