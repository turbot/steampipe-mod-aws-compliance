select
  -- Required Columns
  load_balancer_arn as resource,
  case
    when (protocol != 'HTTPS' or ssl_policy not like '%TLS%') then 'skip'
    when protocol = 'HTTPS' and ssl_policy like any(array['ELBSecurityPolicy-TLS-1-2%', 'ELBSecurityPolicy-TLS-1-1%']) then 'ok'
    else 'alarm'
  end as status,
  case
    when protocol != 'HTTPS' or ssl_policy not like '%TLS%' then title || ' security policy not based on TLS'
    when protocol = 'HTTPS' and ssl_policy like any(array['ELBSecurityPolicy-TLS-1-2%', 'ELBSecurityPolicy-TLS-1-1%']) then title || ' does not use weak TLS ciphers.'
    else title || ' uses weak TLS ciphers.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_load_balancer_listener;