with task_definitions_logging_enabled as (
  select
    distinct task_definition_arn as arn
  from
    aws_ecs_task_definition,
    jsonb_array_elements(container_definitions) as c
  where
    c ->> 'LogConfiguration' is not null
)
select
  -- Required Columns
  a.task_definition_arn as resource,
  case
    when b.arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.arn is not null then a.title || ' logging enabled.'
    else a.title || ' logging disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_task_definition as a
  left join task_definitions_logging_enabled as b on a.task_definition_arn = b.arn;