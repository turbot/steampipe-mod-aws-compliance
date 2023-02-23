select
  -- Required Columns
  arn as resource,
  case
    when auto_renew then 'alarm'
    else 'ok'
  end as status,
  case
    when auto_renew then title || ' auto renew enabled.' else title || ' auto renew disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_route53_domain;