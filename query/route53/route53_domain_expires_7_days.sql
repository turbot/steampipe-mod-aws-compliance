select
  -- Required Columns
  arn as resource,
  case
    when date(expiration_date) - date(current_date) >= 7 then 'ok' else 'alarm'
  end as status,
  case
    when date(expiration_date) - date(current_date) >= 7 then
    title || ' set to expire in ' || extract(day from expiration_date - current_date) || ' days.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_route53_domain;