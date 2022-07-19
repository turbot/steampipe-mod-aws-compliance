select
  -- Required Columns
  access_point_arn as resource,
  case
    when root_directory ->> 'Path'= '/' then 'alarm'
    else 'ok'
  end as status,
  case
    when root_directory ->> 'Path'= '/' then title || ' not configured to enforce a root directory.'
    else title || ' configured to enforce a root directory.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_efs_access_point;
