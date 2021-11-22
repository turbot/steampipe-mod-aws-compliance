-- pgFormatter-ignore
with global_recorders as (
  select
    count(*) as global_config_recorders
  from
    aws_config_configuration_recorder
  where
    recording_group -> 'IncludeGlobalResourceTypes' = 'true'
 )
select
  -- Required columns
  'arn:aws::' || a.region || ':' || a.account_id as resource,
  case
    when
      g.global_config_recorders >= 1
      and recording_group -> 'AllSupported' = 'true'
      and status ->> 'Recording' = 'true'
      and status ->> 'LastStatus' = 'SUCCESS'
    then 'ok'
    else 'alarm'
  end as status,
  case
    when recording_group -> 'IncludeGlobalResourceTypes' = 'true' then a.region || ' IncludeGlobalResourceTypes enabled,'
    else a.region || ' IncludeGlobalResourceTypes disabled,'
  end ||
  case
    when recording_group -> 'AllSupported' = 'true' then ' AllSupported enabled,'
    else ' AllSupported disabled,'
  end ||
  case
    when status ->> 'Recording' = 'true' then ' Recording enabled'
    else ' Recording disabled'
  end ||
  case
    when status ->> 'LastStatus' = 'SUCCESS' then ' and LastStatus is SUCCESS.'
    else ' and LastStatus is not SUCCESS.'
  end as reason,
  -- Additional columns
  a.region,
  a.account_id
from
  global_recorders as g,
  aws_region as a
  left join aws_config_configuration_recorder as r
    on r.account_id = a.account_id and r.region = a.name;
