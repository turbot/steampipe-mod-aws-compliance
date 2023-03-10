with multi_region_trails as (
  select
    account_id,
    count(account_id) as num_multregion_trails
  from
    aws_cloudtrail_trail
  where
    is_multi_region_trail and region = home_region
    and is_logging
  group by
    account_id,
    is_multi_region_trail
), organization_trails as (
  select
    is_organization_trail,
    is_logging,
    is_multi_region_trail,
    account_id
  from
    aws_cloudtrail_trail
  where
    is_organization_trail
)
select
  -- Required Columns
  distinct a.arn as resource,
  case
    when coalesce(num_multregion_trails, 0) >= 1 then 'ok'
    when o.is_organization_trail and o.is_logging and o.is_multi_region_trail then 'ok'
    when o.is_organization_trail and o.is_multi_region_trail and o.is_logging is null then 'info'
    else 'alarm'
  end as status,
  case
    when coalesce(num_multregion_trails, 0) >= 1 then a.title || ' has ' || coalesce(num_multregion_trails, 0) || ' multi-region trail(s).'
    when o.is_organization_trail and o.is_logging and o.is_multi_region_trail then a.title || ' has multi-region trail(s).'
    when o.is_organization_trail and o.is_multi_region_trail and o.is_logging is null then a.title || ' has organization trail, check organization account for cloudtrail logging status.'
    else a.title || ' does not have multi-region trail(s).'
  end as reason,
  -- Additional Dimensions
  a.account_id
from
  aws_account as a
  left join multi_region_trails as b on a.account_id = b.account_id
  left join organization_trails as o on a.account_id = o.account_id