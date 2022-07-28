-- original query is tested against the cloud-trail, issue with this is, when there are no data available or event_selectors does not fetch the default manahement event data, the entire query returns ZERO results, that indicates, the control does not check as it intended to do e.g. cis_v140_3_1 is intended to check, "3.1 Ensure CloudTrail is enabled in all regions"

with trail_details as (
  select
    name as trail_name,
    arn,
    is_multi_region_trail,
    is_logging,
    event_selectors,
    e ->> 'ReadWriteType' as read_write_type,
    account_id,
    region
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(event_selectors) as e
)
select
  -- Required Columns
  arn as resource,
  case
    when not trail_details.is_multi_region_trail then 'alarm'
    when not trail_details.is_logging then 'alarm'
    when read_write_type <> 'All' then 'alarm'
    else 'ok'
  end as status,
  trail_details.trail_name ||
    case when trail_details.is_multi_region_trail then ' is ' else ' is not ' end || 'multi-region,' ||
    case when trail_details.is_logging then ' logging enabled' else ' logging disabled' end ||
    ' for ' || read_write_type || ' events.'
  as reason,
  -- Additional Dimensions
  region,
  account_id
from
  trail_details;

-- if we check against the region list as CIS "3.1 Ensure CloudTrail is enabled in all regions" is checking CloudTrail in each regions against some trail properties validation such as
-- ensuring that a multi-regions trail exists will ensure that unexpected activity occurring in otherwise unused regions is detected
-- ensuring that a multi-regions trail exists will ensure that Global Service Logging is enabled for a trail by default to capture recording of events generated on AWS global services
-- for a multi-regions trail, ensuring that management events configured for all type of Read/Writes ensures recording of management operations that are performed on all resources in an AWS account

-- KNOWN OBSERVATION,
-- The attribute 'event_selectors' > which is fetched from https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_GetEventSelectors.html, is expected to render value when the default 'Management events' check box is selected, however it does not render the data till the time, we select 'Data events' with required 'Data event type'.
-- Further observation is, once you select first time the 'Data events' and turn it off, the 'event_selectors' value gets populated from 'Management events' as expected.
-- Reference
-- AWS reference interpretation https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cis-controls.html#securityhub-cis-controls-2.1
-- https://docs.aws.amazon.com/config/latest/developerguide/multi-region-cloudtrail-enabled.html


 with trail_details as (
  select
    distinct region
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(event_selectors) as e
  where is_logging and e ->> 'ReadWriteType' = 'All' and is_multi_region_trail
)
select
  -- Required Columns
  r.name as resource,
  case
    when r.opt_in_status = 'not-opted-in' then 'skip'
    when d.region is null then 'alarm'
    else 'ok'
  end as status,
    case
    when r.opt_in_status = 'not-opted-in' then r.region ||  ' region not-opted-in.'
    when d.region is null then 'cloudtrail disabled.'
    else 'cloudtrail enabled ' || r.name || '.'
  end as reason,
  -- Additional Dimensions
  r.name,
  r.account_id
from
  aws_region as r
left join trail_details as d on d.region = r.name;

-- Sample query to all related columns

select event_selectors, advanced_event_selectors, name, is_multi_region_trail, home_region, region from aws_cloudtrail_trail

