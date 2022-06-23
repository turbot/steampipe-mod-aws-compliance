with function_logging_cloudtrails as (
  select
    distinct replace(replace(v::text,'"',''),'/','') as lambda_arn,
    d ->> 'Type' as type
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(event_selectors) e,
    jsonb_array_elements(e -> 'DataResources') as d,
    jsonb_array_elements(d -> 'Values') v
  where
    d ->> 'Type' = 'AWS::Lambda::Function'
    and replace(replace(v::text,'"',''),'/','') <> 'arn:aws:lambda'
), function_logging_region as (
    select
      region as cloudtrail_region,
      replace(replace(v::text,'"',''),'/','') as lambda_arn
    from
      aws_cloudtrail_trail,
      jsonb_array_elements(event_selectors) e,
      jsonb_array_elements(e -> 'DataResources') as d,
      jsonb_array_elements(d -> 'Values') v
    where
      d ->> 'Type' = 'AWS::Lambda::Function'
      and replace(replace(v::text,'"',''),'/','') = 'arn:aws:lambda'
    group by
      region,
      lambda_arn
),
function_logging_region_advance_es as (
  select
    region as cloudtrail_region
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(advanced_event_selectors) a,
    jsonb_array_elements(a -> 'FieldSelectors') as f,
    jsonb_array_elements_text(f -> 'Equals') e
  where
    e = 'AWS::Lambda::Function'
    and f ->> 'Field' != 'eventCategory'
  group by
    region
)
select
   -- Required Columns
  distinct l.arn as resource,
  case
    when (l.arn = c.lambda_arn)
      or (r.lambda_arn = 'arn:aws:lambda' and r.cloudtrail_region = l.region )
      or a.cloudtrail_region =  l.region then 'ok'
    else 'alarm'
  end as status,
  case
    when (l.arn = c.lambda_arn)
      or (r.lambda_arn = 'arn:aws:s3' and r.cloudtrail_region = l.region )
      or a.cloudtrail_region =  l.region then l.name || ' logging enabled.'
    else l.name || ' logging not enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_lambda_function as l
  left join function_logging_cloudtrails as c on l.arn = c.lambda_arn
  left join function_logging_region as r on r.cloudtrail_region = l.region
  left join function_logging_region_advance_es as a on a.cloudtrail_region = l.region;