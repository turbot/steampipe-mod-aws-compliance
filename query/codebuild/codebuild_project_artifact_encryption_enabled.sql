with secondary_artifact as (
  select
    distinct arn
  from
    aws_codebuild_project,
    jsonb_array_elements(secondary_artifacts) as a
  where
    a -> 'EncryptionDisabled' = 'true'
)
select
  -- Required Columns
  a.arn as resource,
  case
    when p.artifacts ->> 'EncryptionDisabled' = 'false'
    and (p.secondary_artifacts is null or a.arn is null) then 'ok'
    else 'alarm'
  end as status,
  case
    when p.artifacts ->> 'EncryptionDisabled' = 'false'
    and (p.secondary_artifacts is null or a.arn is null) then p.title || ' all artifacts encryption enabled.'
    else p.title || ' all artifacts encryption not enabled.'
  end as reason,
  -- Additional Dimensions
  p.region,
  p.account_id
from
  aws_codebuild_project as p
  left join secondary_artifact as a on a.arn = p.arn;
