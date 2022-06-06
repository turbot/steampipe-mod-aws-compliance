select
  -- Required Columns
  arn as resource,
  case
    when restrictions -> 'GeoRestriction' ->> 'RestrictionType' = 'none' then 'alarm'
    else 'ok'
  end as status,
  case
    when restrictions -> 'GeoRestriction' ->> 'RestrictionType' = 'none' then title || ' Geo Restrictions disabled.'
    else title || ' Geo Restrictions disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution;