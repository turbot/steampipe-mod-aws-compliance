select
  -- Required Columns
  load_balancer_arn as resource,
  case
    when ssl_policy like any(array['Protocol-SSLv3', 'Protocol-TLSv1']) then 'ok'
    else 'alarm'
  end as status,
  case
    when ssl_policy like any (array['Protocol-SSLv3', 'Protocol-TLSv1']) then title || ' uses secure SSL or TLS cipher.'
    else title || ' uses insecure SSL or TLS cipher.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_load_balancer_listener;
