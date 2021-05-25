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
  distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
  case
    when multi_trail.count > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when multi_trail.count > 0 then multi_trail.count || ' multi-region trail(s) configured.'
    else 'No multi-region trail configured.'
  end as reason,
  a.account_id
from
  aws_cloudtrail_trail as a,
  multi_trail;