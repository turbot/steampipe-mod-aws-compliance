select
  -- Required Columns
  arn as resource,
  case
    when (domain_endpoint_options ->> 'EnforceHTTPS' = 'true' and domain_endpoint_options ->> 'TLSSecurityPolicy' = 'Policy-Min-TLS-1-2-2019-07') then 'ok'
    else 'alarm'
  end status,
  case
    when (domain_endpoint_options ->> 'EnforceHTTPS' = 'true' and domain_endpoint_options ->> 'TLSSecurityPolicy' = 'Policy-Min-TLS-1-2-2019-07') then title || ' has TLS security policy configured.'
    else title || ' does not have TLS security policy configured.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_opensearch_domain;