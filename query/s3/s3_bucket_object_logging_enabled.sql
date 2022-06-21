with object_logging_cloudtrails as (
  select
    d ->> 'Type' as type,
    replace(replace(v::text,'"',''),'/','') as bucket_arn
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(event_selectors) e,
    jsonb_array_elements(e -> 'DataResources') as d,
     jsonb_array_elements(d -> 'Values') v
  where
    d ->> 'Type' = 'AWS::S3::Object'
), object_logging_region as (
    select
      region as  cloudtrail_region,
      replace(replace(v::text,'"',''),'/','') as bucket_arn
    from
      aws_cloudtrail_trail,
      jsonb_array_elements(event_selectors) e,
      jsonb_array_elements(e -> 'DataResources') as d,
      jsonb_array_elements(d -> 'Values') v
    where
      d ->> 'Type' = 'AWS::S3::Object'
      and replace(replace(v::text,'"',''),'/','') = 'arn:aws:s3'
    group by
      region,
      bucket_arn
),
object_logging_region_advance_es as (
  select
    region as  cloudtrail_region
  from
    aws_cloudtrail_trail,
    jsonb_array_elements(advanced_event_selectors) a,
    jsonb_array_elements(a -> 'FieldSelectors') as f,
    jsonb_array_elements_text(f -> 'Equals') e
  where
    e = 'AWS::S3::Object'
    and f ->> 'Field' != 'eventCategory'
  group by
    region
)
select
  -- Required Columns
  distinct s.arn as resource,
  case
    when (s.arn = c.bucket_arn)
      or (r.bucket_arn = 'arn:aws:s3' and r. cloudtrail_region = s.region )
      or a. cloudtrail_region =  s.region then 'ok'
    else 'alarm'
  end as status,
  case
    when (s.arn = c.bucket_arn)
      or (r.bucket_arn = 'arn:aws:s3' and r. cloudtrail_region = s.region )
      or a. cloudtrail_region =  s.region then s.name || ' object logging enabled.'
    else s.name || ' object logging not enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_s3_bucket as s
  left join object_logging_cloudtrails as c on s.arn = c.bucket_arn
  left join object_logging_region as r on r. cloudtrail_region = s.region
  left join object_logging_region_advance_es as a on a. cloudtrail_region = s.region;