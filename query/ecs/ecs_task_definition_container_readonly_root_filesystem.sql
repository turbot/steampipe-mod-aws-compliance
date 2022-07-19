with privileged_container_definition as (
  select
    distinct task_definition_arn as arn
  from
    aws_ecs_task_definition,
    jsonb_array_elements(container_definitions) as c
  where
    c ->> 'ReadonlyRootFilesystem' = 'true'
)
select
  -- Required Columns
  d.task_definition_arn as resource,
  case
    when c.arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when c.arn is not null then d.title || ' containers limited to read-only access to root filesystems.'
    else d.title || ' containers not limited to read-only access to root filesystems.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_task_definition as d
  left join privileged_container_definition as c on d.task_definition_arn = c.arn;