with lifecycle_rules_enabled as (
  select
    arn
  from
    aws_s3_bucket,
    jsonb_array_elements(lifecycle_rules) as r
  where
    r ->> 'Status' = 'Enabled'
)
select
  -- Required Columns
  b.arn as resource,
  case
    when not versioning_enabled then 'alarm'
    when versioning_enabled and r.arn is not null then 'ok'
    else 'alarm'
  end status,
  case
    when not versioning_enabled then name || ' versioning diabled.'
    when versioning_enabled and r.arn is not null then ' lifecycle policy configured.'
    else name || '  lifecycle policy not configured.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_s3_bucket as b
  left join lifecycle_rules_enabled as r on r.arn = b.arn;