select
  -- Required Columns
  certificate_arn as resource,
  case
    when domain_name like '*%' then 'alarm'
    else 'ok'
  end as status,
  case
    when domain_name like '*%' then title || ' uses wildcard domain name.'
    else title || ' does not use wildcard domain name.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_acm_certificate;
