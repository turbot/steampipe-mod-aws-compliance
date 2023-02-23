select
  -- Required Columns
    arn as resource,
  case
    when agent_connected = false and status = 'ACTIVE' then 'alarm'
    else 'ok'
  end as status,
  case
    when agent_connected = false and status = 'ACTIVE' then title || ' is active and has unconnected agents.' else title || ' is either draining or has connected agents.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ecs_container_instance;