with event_selectors_list as (
  select
    akas,
    title,
    jsonb_pretty(e),
    region,
    account_id
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(event_selectors) e
  where
    e ->> 'DataResources' like '%AWS::Lambda::Function%'
  union
  select
    akas,
    title,
    jsonb_pretty(a),
    region,
    account_id
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(advanced_event_selectors) a
  where
    a ->> 'FieldSelectors' like '%AWS::Lambda::Function%'
) 
select
  -- Required Columns
  c.title as resource,
  case
    when e.akas is null then 'alarm'
    else 'ok'
  end as status,
  case
    when e.akas is null then c.title || ' disabled lambda function operations recording in ' || c.region
    else c.title || ' enabled lambda function operations recording ' || c.region
  end as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
  aws_cloudtrail_trail c 
  left join event_selectors_list e on c.akas = e.akas and c.region = e.region and c.account_id = e.account_id;