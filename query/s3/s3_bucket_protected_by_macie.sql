with bucket_list as (
  select
    trim(b::text, '"' ) as bucket_name
  from
    aws_macie2_classification_job,
    jsonb_array_elements(s3_job_definition -> 'BucketDefinitions') as d,
    jsonb_array_elements(d -> 'Buckets') as b
)
select
  -- Required Columns
  b.arn as resource,
  case
    when b.region = any(array['us-gov-east-1', 'us-gov-west-1']) then 'skip'
    when l.bucket_name is not null then 'ok'
    else 'alarm'
  end status,
  case
    when b.region = any(array['us-gov-east-1', 'us-gov-west-1']) then b.title || ' not protected by Macie as Macie is not supported in ' || b.region || '.'
    when l.bucket_name is not null then b.title || ' protected by Macie.'
    else b.title || ' not protected by Macie.'
  end reason,
  -- Additional Dimensions
  b.region,
  b.account_id
from
  aws_s3_bucket as b
  left join bucket_list as l on b.name = l.bucket_name;
