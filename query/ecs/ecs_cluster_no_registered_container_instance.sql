select
  -- Required Columns
  cluster_arn as resource,
  case
    when registered_container_instances_count = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when registered_container_instances_count = 0 then title || ' has no container instance registered.'
    else title || ' has ' || registered_container_instances_count || ' container instance(s) registered.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_cluster;