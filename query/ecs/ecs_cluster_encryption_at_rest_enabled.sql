select
  -- Required Columns
  c.cluster_arn as resource,
  case
    when v.encrypted then 'ok'
    else 'alarm'
  end as status,
  case
    when v.encrypted then c.title || ' encryption at rest enabled.' else c.title || ' encryption at rest disabled.'
  end as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
  aws_ecs_cluster as c,
  aws_ecs_container_instance as i,
  aws_ec2_instance as e,
  jsonb_array_elements(block_device_mappings) as b,
  aws_ebs_volume as v
where
  c.cluster_arn = i.cluster_arn
  and i.ec2_instance_id = e.instance_id
  and b -> 'Ebs' ->> 'VolumeId' = v.volume_id;
