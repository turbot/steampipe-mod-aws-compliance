with unencrypted_volumes as (
  select
    distinct cluster_arn
  from
   aws_ecs_container_instance as i,
   aws_ec2_instance as e,
   jsonb_array_elements(block_device_mappings) as b,
   aws_ebs_volume as v
  where
    i.ec2_instance_id = e.instance_id
    and b -> 'Ebs' ->> 'VolumeId' = v.volume_id
    and not v.encrypted
)
select
  -- Required Columns
  c.cluster_arn as resource,
  case
    when c.registered_container_instances_count = 0 then 'skip'
    when v.cluster_arn is not null then 'alarm'
    else 'ok'
  end as status,
  case
    when c.registered_container_instances_count = 0 then title || ' has no container instance registered.'
    when v.cluster_arn is not null then c.title || ' encryption at rest disabled.'
    else c.title || ' encryption at rest enabled.'
  end as reason,
  -- Additional Dimensions
  c.region,
  c.account_id
from
 aws_ecs_cluster as c
  left join unencrypted_volumes as v on v.cluster_arn = c.cluster_arn;