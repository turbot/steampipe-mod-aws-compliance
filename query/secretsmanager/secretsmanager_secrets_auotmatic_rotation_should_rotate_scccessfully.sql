select
  -- Required Columns
  arn as resource,
  case
    when primary_region is not null and region != primary_region then 'skip'
    when rotation_rules is null then 'alarm' -- Rotation not enabled
    when last_rotated_date is null
      and (date(current_date) - date(created_date)) <= (rotation_rules -> 'AutomaticallyAfterDays')::integer then 'ok' -- Scheduled but not rotated
    when last_rotated_date is null
      and (date(current_date) - date(created_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then 'alarm' -- Not rotated as per schedule
    when last_rotated_date is not null
     and (date(current_date) - date(last_rotated_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then 'alarm' -- The case where the secret with last_rotated_date and the diff from current minus last rotated date is exceeding from the rotation rule set days
  end as status,
  case
    when primary_region is not null and region != primary_region then title || ' is a replica.'
    when rotation_rules is null then title || ' rotation not enabled.'
    when last_rotated_date is null
      and (date(current_date) - date(created_date)) <= (rotation_rules -> 'AutomaticallyAfterDays')::integer then title || ' scheduled but not rotated.'
    when rotation_rules is not null and last_rotated_date is null
     and (date(current_date) - date(created_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then title || ' not rotated as per schedule.'
    when last_rotated_date is not null
      and (date(current_date) - date(last_rotated_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then title || ' not rotated as per schedule.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_secretsmanager_secret;
