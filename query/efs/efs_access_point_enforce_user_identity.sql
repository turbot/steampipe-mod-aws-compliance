select
  -- Required Columns
  access_point_arn as resource,
  case
    when posix_user is null then 'alarm'
    else 'ok'
  end as status,
  case
    when posix_user is null then title || ' does not enforce a user identity.'
    else title || ' enforce a user identity.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_efs_access_point;
