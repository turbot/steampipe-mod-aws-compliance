select
  -- Required Columns
  arn as resource,
  case
    when iam_database_authentication_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when iam_database_authentication_enabled then title || ' IAM authentication configured.'
    else title || ' IAM authentication not configured.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_rds_db_instance;