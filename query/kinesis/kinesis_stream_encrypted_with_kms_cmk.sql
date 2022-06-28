select
  -- Required Columns
  stream_arn as resource,
	case
    when encryption_type = 'KMS' and key_id <> 'alias/aws/kinesis' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption_type = 'KMS' and key_id <> 'alias/aws/kinesis' then title || ' encrypted with CMK.'
    else title || ' not encrypted with CMK.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_kinesis_stream;