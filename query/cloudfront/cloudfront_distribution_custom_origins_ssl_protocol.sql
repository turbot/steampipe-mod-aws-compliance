select
  -- Required Columns
  arn as resource,
  case
    when o -> 'CustomOriginConfig' ->> 'OriginSslProtocols' like 'TLSv1.2%' or o -> 'CustomOriginConfig' ->> 'OriginSslProtocols' like 'TLSv1.1%' then 'ok' else 'alarm'
  end as status,
  case
    when o -> 'CustomOriginConfig' ->> 'OriginSslProtocols' like 'TLSv1.2%' or o -> 'CustomOriginConfig' ->> 'OriginSslProtocols' like 'TLSv1.1%' then title || ' use secure ciphers.' else title || ' does not use secure ciphers.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution,
  jsonb_array_elements(origins) as o;