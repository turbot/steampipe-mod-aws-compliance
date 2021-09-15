with lambda_function_selectors as
(
  select
    name as trail_name,
    is_multi_region_trail,
    lambda_selector
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(event_selectors) as event_selector,
    jsonb_array_elements(event_selector -> 'DataResources') as data_resource,
    jsonb_array_elements_text(data_resource -> 'Values') as lambda_selector
  where
    is_multi_region_trail
    and data_resource ->> 'Type' = 'AWS::Lambda::Function'
)
select
  -- Required columns
  b.arn as resource,
  case
    when count(lambda_selector) > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when count(lambda_selector) > 0 then b.name || ' data events logging enabled.'
    else b.name || ' data events logging disabled.'
  end as reason,
  -- Additional columns
  region,
  account_id
from
  aws_lambda_function as b
  left join
    lambda_function_selectors
    on lambda_selector like (b.arn || '%')
    or lambda_selector = 'arn:aws:lambda'
group by
  b.account_id, b.region, b.arn, b.name;