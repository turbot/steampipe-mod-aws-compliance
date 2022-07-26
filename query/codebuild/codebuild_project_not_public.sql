with shared_resources as(
  select 
    resource_share_arn, 
    associated_entity
  from 
    aws_ram_resource_association
  where
    status = 'ASSOCIATED'
)
select
  -- Required Columns
  p.arn as resource,
  case
    when project_visibility = 'PRIVATE' and s.resource_share_arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when project_visibility = 'PRIVATE' and s.resource_share_arn is null then title || ' is not a shared project.'
    else title || ' is a shared project.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_codebuild_project p
  left join shared_resources s on p.arn = s.associated_entity;