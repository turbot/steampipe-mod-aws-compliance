select
  -- Required Columns
  arn as resource,
  case
    when (domain_endpoint_options ->> 'EnforceHTTPS' = 'false') or (domain_endpoint_options ->> 'EnforceHTTPS' = 'true' and domain_endpoint_options ->> 'TLSSecurityPolicy' not in ('tlsPolicies')) then 'alarm'
    else 'ok'
  end status,
  case
    when (domain_endpoint_options ->> 'EnforceHTTPS' = 'false') or (domain_endpoint_options ->> 'EnforceHTTPS' = 'true' and domain_endpoint_options ->> 'TLSSecurityPolicy' not in ('tlsPolicies')) then title || ' not using HTTPS.'
    else title || ' using HTTPS.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_opensearch_domain;