with event_selectors_trail_details as (
  select
    distinct region
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(event_selectors) as e
  where 
    (is_logging and e ->> 'ReadWriteType' = 'All' and is_multi_region_trail)
),
advanced_event_selectors_trail_details as (
  select
    distinct region
  from
    aws_cloudtrail_trail,
    jsonb_array_elements_text(advanced_event_selectors) as a
  where 
    (is_logging and advanced_event_selectors is not null and (not a like '%readOnly%'))
)
select
  -- Required Columns
  r.name as resource,
  case
    when r.opt_in_status = 'not-opted-in' then 'skip'
    when d.region is null and ad.region is null then 'alarm'
    else 'ok'
  end as status,
    case
    when r.opt_in_status = 'not-opted-in' then r.region ||  ' region not-opted-in.'
    when d.region is null and ad.region is null then 'cloudtrail disabled.'
    else 'cloudtrail enabled ' || r.name || '.'
  end as reason,
  -- Additional Dimensions
  r.name,
  r.account_id
from
  aws_region as r
left join event_selectors_trail_details as d on d.region = r.name
left join advanced_event_selectors_trail_details as ad on ad.region = r.name
order by r.name;
