with origin_protocols as (
  select
    distinct arn,
    o -> 'CustomOriginConfig' ->> 'OriginSslProtocols' as origin_ssl_policy
  from
    aws_cloudfront_distribution,
    jsonb_array_elements(origins) as o
  where
    o -> 'CustomOriginConfig' -> 'OriginSslProtocols' -> 'Items' @> '["TLSv1.2%", "TLSv1.1%"]'
)
select
  -- Required Columns
  b.arn as resource,
  case
    when o.arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when o.arn is not null then title || ' use secure cipher.'
    else title || ' does not use secure cipher.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution as b
  left join origin_protocols as o on b.arn = o.arn;