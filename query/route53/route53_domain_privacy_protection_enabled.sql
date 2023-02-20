select
  -- Required Columns
  arn as resource,
  case
    when admin_privacy then 'ok'
    else 'alarm'
  end as status,
  case
    when admin_privacy then title || ' route53 privacy protection enabled.'
    else title || ' route53 privacy protection disabled.'
    end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_route53_domain;