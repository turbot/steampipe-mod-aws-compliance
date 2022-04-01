select
  -- Required Columns
  arn as resource,
  case
    when viewer_certificate ->> 'SSLSupportMethod' = 'sni-only' then 'ok'
    else 'alarm'
  end as status,
  case
    when viewer_certificate ->> 'SSLSupportMethod' = 'sni-only' then title || ' SNI enabled.'
    else title || ' SNI disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution;