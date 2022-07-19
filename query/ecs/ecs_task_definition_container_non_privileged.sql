with privileged_container_definition as (
  select
    distinct task_definition_arn as arn
  from
    aws_ecs_task_definition,
    jsonb_array_elements(container_definitions) as c
  where
    c ->> 'Privileged' = 'true'
)
select
  -- Required Columns
  d.task_definition_arn as resource,
  case
    when c.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when c.arn is null then d.title || ' does not have elevated privileges.'
    else d.title || ' has elevated privileges.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_task_definition as d
  left join privileged_container_definition as c on d.task_definition_arn = c.arn;