select
  -- Required Columns
  arn as resource,
  case
    when date_part('day', now() - end_time) < 90 then 'ok'
    else 'alarm'
  end as status,
  case
    when date_part('day', now() - end_time) < 90 then project_name || ' was build in 90 days.'
    else project_name || ' was not build in 90 days.'
  end as reason,
  -- Additional Dimensions
  account_id,
  region
from
  aws_codebuild_build;

