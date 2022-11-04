select
  -- Required Columns
  arn as resource,
  case
    when jsonb_array_length(groups) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when jsonb_array_length(groups) = 0 then title || ' not associated with any IAM group.'
    else title || ' associated with IAM group.'
  end as reason,
  -- Additional Dimensions
  account_id
from
  aws_iam_user;