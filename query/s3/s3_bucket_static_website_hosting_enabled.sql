select
  -- Required Columns
  arn as resource,
  case
    when website_configuration -> 'IndexDocument' ->> 'Suffix' is not null then 'alarm'
    else 'ok'
  end status,
  case
    when website_configuration -> 'IndexDocument' ->> 'Suffix' is not null then name || ' static website hosting enabled.'
    else name || ' static website hosting disabled.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_s3_bucket;