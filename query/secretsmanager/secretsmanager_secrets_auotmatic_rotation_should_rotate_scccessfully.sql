select
  -- Required Columns
  arn as resource,
  case
    when rotation_rules is null then 'alarm' -- Rotation not enabled
    when last_rotated_date is null
    and (date(current_date) - date(created_date)) <= (rotation_rules -> 'AutomaticallyAfterDays')::integer then 'ok' -- Scheduled but not rotated
    when rotation_rules is not null and last_rotated_date is null
    and (date(current_date) - date(created_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then 'alarm' -- Not rotated as per schedule
  end as status,
  case
    when rotation_rules is null then  title || ' rotation not enabled.'
    when last_rotated_date is null
    and (date(current_date) - date(created_date)) <= (rotation_rules -> 'AutomaticallyAfterDays')::integer
    then title || ' scheduled but not rotated.'
    when rotation_rules is not null and last_rotated_date is null
    and (date(current_date) - date(created_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer
    then title || ' not rotated as per schedule.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_secretsmanager_secret;
