select
  -- Required Columns
  arn as resource,
  case
    when last_changed_date is null then 'alarm'
    when date(current_date) - date(last_changed_date) <= 90 then 'ok'
    else 'alarm'
  end as status,
  case
    when last_changed_date is null then title || ' never rotated.'
    else
      title || ' last rotated ' || extract(day from current_timestamp - last_changed_date) || ' day(s) ago.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_secretsmanager_secret;