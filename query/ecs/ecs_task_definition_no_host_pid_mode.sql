select
  -- Required Columns
  task_definition_arn as resource,
  case
    when pid_mode = 'host' then 'alarm'
    else 'ok'
  end as status,
  case
    when pid_mode = 'host' then title || ' shares the host process namespace.'
    else title || ' does not share the host process namespace.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_task_definition;