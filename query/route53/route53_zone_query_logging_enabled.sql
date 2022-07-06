select
  -- Required Columns
  id as resource,
  case
    when private_zone then 'skip'
    when query_logging_configs is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when private_zone then title || ' is private hosted zone.'
    when query_logging_configs is not null then title || ' query logging to CloudWatch enabled.'
    else title || ' query logging to CloudWatch disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_route53_zone;