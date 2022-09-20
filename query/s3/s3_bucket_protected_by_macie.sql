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
    when l.bucket_name is not null then 'ok'
    else 'alarm'
  end status,
  case
    when l.bucket_name is not null then b.title || ' is protected by Amazon Macie.'
    else b.title || ' is not protected by Amazon Macie.'
  end reason,
  -- Additional Dimensions
  b.region,
  b.account_id
from
  aws_s3_bucket as b
  left join bucket_list as l on b.name = l.bucket_name;