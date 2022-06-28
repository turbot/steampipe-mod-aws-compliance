select
  -- Required Columns
  queue_arn as resource,
  case
    when redrive_policy is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when redrive_policy is not null then title || ' configured with dead-letter queue.'
    else title || ' not configured with dead-letter queue.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_sqs_queue;