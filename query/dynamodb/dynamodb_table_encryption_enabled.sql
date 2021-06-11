select
  -- Required Columns
  table_arn as resource,
  case
    when sse_description is null then 'alarm'
    else 'ok'
  end as status,
  case
    when sse_description is null then title || ' not encrypted.'
    else title || ' encrypted.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_dynamodb_table;