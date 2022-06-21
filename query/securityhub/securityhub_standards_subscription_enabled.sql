select
  -- Required Columns
  standards_arn as resource,
  case
    when standards_status = 'READY' then 'ok'
    else 'alarm'
  end as status,
  case
    when standards_status = 'READY' then ' Security Hub is enabled with standards ' || standards_subscription_arn || '.'
    else 'Security Hub is not enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_securityhub_standards_subscription;