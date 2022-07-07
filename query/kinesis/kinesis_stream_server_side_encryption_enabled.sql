select
  -- Required Columns
  stream_arn as resource,
  case
    when encryption_type = 'KMS' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption_type = 'KMS' then title || ' server side encryption enabled.'
    else title || ' server side encryption disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_kinesis_stream;