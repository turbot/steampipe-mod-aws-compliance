with unconnected_agent_instance as (
  select
    distinct cluster_arn
  from
    aws_ecs_container_instance
  where
    agent_connected = false and status = 'ACTIVE'
)
select
  -- Required Columns
  c.cluster_arn as resource,
  case
    when c.registered_container_instances_count = 0 then 'skip'
    when i.cluster_arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when c.registered_container_instances_count = 0 then title || ' has no container instance registered.'
    when i.cluster_arn is null then title || ' container instance has connected agent.'
    else title || ' container instance is either draining or has unconnected agents.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_cluster as c
  left join unconnected_agent_instance as i on c.cluster_arn = i.cluster_arn;