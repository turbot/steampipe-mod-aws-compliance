with definitions_with_secret_environment_variable as (
  select
    distinct task_definition_arn as arn
  from
    aws_ecs_task_definition,
    jsonb_array_elements(container_definitions) as c,
    jsonb_array_elements( c -> 'Environment') as e,
        jsonb_array_elements(
    case jsonb_typeof(c -> 'Secrets')
        when 'array' then (c -> 'Secrets')
        else null end
    ) as s
  where
    e ->> 'Name' like any (array ['AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY','ECS_ENGINE_AUTH_DATA'])
    or s ->> 'Name' like any (array ['AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY','ECS_ENGINE_AUTH_DATA'])
)
select
  -- Required Columns
  d.task_definition_arn as resource,
  case
    when e.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when e.arn is null then d.title || ' container environment variables does not have secrets.'
    else d.title || ' container environment variables have secrets.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_task_definition as d
  left join definitions_with_secret_environment_variable as e on d.task_definition_arn = e.arn;