select
  -- Required Columns
  arn as resource,
  case
    when rotation_rules is not null and rotation_lambda_arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when rotation_rules is not null and rotation_lambda_arn is not null then title || ' scheduled for rotation using Lambda function.'
    else title || ' automatic rotation disabled.'
  end as reason,
  -- Add Dimensions
  region,
  account_id
from
  aws_secretsmanager_secret;