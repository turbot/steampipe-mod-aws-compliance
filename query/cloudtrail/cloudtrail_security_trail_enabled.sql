with trails_enabled as (
  select
    arn,
    is_logging
  from
    aws_cloudtrail_trail
  where
    home_region = region
)
select
  -- Required Columns
  a.arn as resource,
  case
    when (a.is_logging is null and not b.is_logging) or not a.is_logging then 'alarm'
    when not a.include_global_service_events then 'alarm'
    when not a.is_multi_region_trail then 'alarm'
    when not a.log_file_validation_enabled then 'alarm'
    when a.kms_key_id is null then 'alarm'
    when not (a.event_selectors @> '[{"ReadWriteType":"All"}]') then 'alarm'
    when not (a.event_selectors @> '[{"IncludeManagementEvents":true}]') then 'alarm'
    when not (a.event_selectors @> '[{"ExcludeManagementEventSources":[]}]') then 'alarm'
    else 'ok'
  end as status,
  case
    when (a.is_logging is null and not b.is_logging) or not a.is_logging then title || ' disabled.'
    when not a.include_global_service_events then a.title || ' not records global service events.'
    when not a.is_multi_region_trail then a.title || ' not a muti-region trail.'
    when not a.log_file_validation_enabled then a.title || ' log file validation disabled.'
    when a.kms_key_id is null then a.title || ' not encrypted with a KMS key.'
    when not (a.event_selectors @> '[{"ReadWriteType":"All"}]') then a.title || ' not records events for both reads and writes.'
    when not (a.event_selectors @> '[{"IncludeManagementEvents":true}]') then a.title || ' not records management events.'
    when not (a.event_selectors @> '[{"ExcludeManagementEventSources":[]}]') then a.title || ' not records all management events.'
    else a.title || ' meets all security best practices.'
  end as reason,
  -- Additional Dimensions
  a.region,
  a.account_id
from
  aws_cloudtrail_trail as a
left join trails_enabled as b on a.arn = b.arn;