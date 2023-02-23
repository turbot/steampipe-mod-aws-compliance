select
  -- Required Columns
  l.load_balancer_arn as resource,
  case
    when l.ssl_policy = any(array['ELBSecurityPolicy-2016-08', 'ELBSecurityPolicy-FS-2018-0', 'ELBSecurityPolicy-TLS13-1-2-Ext1-2021-06', 'ELBSecurityPolicy-TLS13-1-2-2021-06']) then 'ok'
    else 'alarm'
  end as status,
  case
    when l.ssl_policy = any(array['ELBSecurityPolicy-2016-08', 'ELBSecurityPolicy-FS-2018-0', 'ELBSecurityPolicy-TLS13-1-2-Ext1-2021-06', 'ELBSecurityPolicy-TLS13-1-2-2021-06']) then n.title || ' litnerer has TLS security policy configured.'
    else n.title || ' litnerer does not have TLS security policy configured.'
  end as reason,
  -- Additional Dimensions
  n.region,
  n.account_id
from
  aws_ec2_load_balancer_listener as l,
  aws_ec2_network_load_balancer as n
where
  l.load_balancer_arn = n.arn;