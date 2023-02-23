select
  -- Required Columns
  arn as resource,
  case
    when admin_privacy then 'ok'
    else 'alarm'
  end as status,
  case
    when admin_privacy then title || ' privacy protection enabled.'
    else title || ' privacy protection disabled.'
    end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_route53_domain;