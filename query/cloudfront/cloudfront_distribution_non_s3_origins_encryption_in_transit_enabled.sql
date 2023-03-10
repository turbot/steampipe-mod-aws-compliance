with viewer_protocol_policy_value as (
  select
    distinct arn
  from
    aws_cloudfront_distribution,
      jsonb_array_elements(
    case jsonb_typeof(cache_behaviors -> 'Items')
        when 'array' then (cache_behaviors -> 'Items')
        else null end
    ) as cb
  where
    cb ->> 'ViewerProtocolPolicy' = 'allow-all'
),
origin_protocol_policy_value as (
  select
    distinct arn,
    o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' as origin_protocol_policy
  from
    aws_cloudfront_distribution,
    jsonb_array_elements(origins) as o
  where
    o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' = 'http-only'
    or o -> 'CustomOriginConfig' ->> 'OriginProtocolPolicy' = 'match-viewer'
    and o -> 'S3OriginConfig' is null
)
select
  -- Required Columns
  b.arn as resource,
  case
    when o.arn is not null and o.origin_protocol_policy = 'http-only' then 'alarm'
    when o.arn is not null and o.origin_protocol_policy = 'match-viewer' and ( v.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') ) then 'alarm'
    else 'ok'
  end as status,
  case
    when o.arn is not null and o.origin_protocol_policy = 'http-only' then title || ' origins traffic not encrypted in transit.'
    when o.arn is not null and o.origin_protocol_policy = 'match-viewer' and ( v.arn is not null or (default_cache_behavior ->> 'ViewerProtocolPolicy' = 'allow-all') ) then title || ' origins traffic not encrypted in transit.'
    else title || ' origins traffic encrypted in transit.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution as b
  left join origin_protocol_policy_value as o on b.arn = o.arn
  left join viewer_protocol_policy_value as v on b.arn = v.arn;