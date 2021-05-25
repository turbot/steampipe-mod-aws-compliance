with multi_trail as (
  select
    count(name) as count
  from
    aws_cloudtrail_trail
  where
    is_multi_region_trail
    and is_logging
)
select
  -- Required Columns
  distinct 'arn:' || partition || ':::' || account_id as resource,
  case
    when multi_trail.count = 0 then 'alarm'
    else 'ok'
  end as status,
  multi_trail.count || ' multi-region trail(s) configured.' as reason,
  -- Additional Dimensions
  account_id
from
  aws_account,
  multi_trail;