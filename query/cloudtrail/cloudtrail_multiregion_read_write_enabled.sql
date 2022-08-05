with event_selectors_trail_details as (
  select
    distinct account_id
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(event_selectors) as e
  where
    (is_logging and is_multi_region_trail and e ->> 'ReadWriteType' = 'All')
),
advanced_event_selectors_trail_details as (
  select
    distinct account_id
  from
    aws_cloudtrail_trail,
    jsonb_array_elements_text(advanced_event_selectors) as a
  where
  -- when readOnly = true, then it is readOnly, when readOnly = false then it is writeOnly, if advanced_event_selectors is not null then it is both ReadWriteType
    (is_logging and is_multi_region_trail and advanced_event_selectors is not null and (not a like '%readOnly%'))
)
select
  -- Required Columns
  a.title as resource,
  case
    when d.account_id is null and ad.account_id is null then 'alarm'
    else 'ok'
  end as status,
    case
    when d.account_id is null and ad.account_id is null then 'cloudtrail disabled.'
    else 'cloudtrail enabled.'
  end as reason,
  -- Additional Dimensions
  a.account_id
from
  aws_account as a
  left join event_selectors_trail_details as d on d.account_id = a.account_id
  left join advanced_event_selectors_trail_details as ad on ad.account_id = a.account_id;