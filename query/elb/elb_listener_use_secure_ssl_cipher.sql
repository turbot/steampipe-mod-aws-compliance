select
 -- Required Columns
  load_balancer_arn as resource,
  case
    when ssl_policy like any (
    ARRAY ['ELBSecurityPolicy-TLS-1-2-2017-01', 'ELBSecurityPolicy-TLS-1-1-2017-01']
    ) then 'ok'
    else 'alarm'
  end as status,
  case
    when ssl_policy like any (
    ARRAY ['ELBSecurityPolicy-TLS-1-2-2017-01', 'ELBSecurityPolicy-TLS-1-1-2017-01']
    ) then title || ' having secure ssl cipher'
    else title || ' having insecure ssl cipher'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_load_balancer_listener;
