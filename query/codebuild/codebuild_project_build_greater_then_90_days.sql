with latest_codebuild_build as (
  select
    project_name,
    region,
    account_id,
    min(date_part('day', now() - end_time)) as build_time
  from 
    aws_codebuild_build
  group by
    project_name,
    region,
    account_id
)
select
  -- Required Columns
  p.arn as resource,
  case
    when b.build_time is null then 'alarm'
    when b.build_time < 90 then 'ok'
    else 'alarm'
  end as status,
  case
    when b.build_time is null then p.title || ' was never build.'
    else p.title || ' was build ' || build_time || ' day(s) before.'
  end as reason,
  -- Additional Dimensions
  p.account_id,
  p.region
from
  aws_codebuild_project as p
  left join latest_codebuild_build as b on p.name = b.project_name and p.region = b.region and p.account_id = b.account_id;