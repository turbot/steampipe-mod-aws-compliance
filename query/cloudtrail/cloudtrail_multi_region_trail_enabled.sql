with multi_region_trails as (
  select
    count(account_id),
    string_agg(account_id, ',') as account_id
  from
    aws_cloudtrail_trail
  where
    is_multi_region_trail
    and is_logging
  group by
    is_multi_region_trail
)
select
  -- Required Columns
  a.arn as resource,
  case
    when b.count < 1 then 'alarm'
    else 'ok'
  end as status,
  a.title || ' has ' || coalesce(b.count, 0) || ' multi-region trail(s).' as reason,
  -- Additional Dimensions
  a.account_id
from
  aws_account as a
left join multi_region_trails as b on a.account_id = split_part(b.account_id, ',', 1);