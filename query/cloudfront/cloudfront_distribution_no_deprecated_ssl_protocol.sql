with origin_ssl_protocols as (
  select
    distinct arn,
    o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' as origin_protocol_policy
  from
    aws_cloudfront_distribution,
    jsonb_array_elements(origins) as o
  where
    o -> 'CustomOriginConfig' -> 'OriginSslProtocols' -> 'Items' @> '["SSLv3"]'
)
select
  -- Required Columns
  b.arn as resource,
  case
    when o.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when o.arn is null then title || ' does not have deprecated SSL protocols.'
    else title || ' have deprecated SSL protocols.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution as b
  left join origin_ssl_protocols as o on b.arn = o.arn;