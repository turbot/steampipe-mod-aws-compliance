with tls_listeners as (
  select
    distinct load_balancer_arn
  from
    aws_ec2_load_balancer_listener
  where
    protocol = 'TLS'
    and ssl_policy not in ('ELBSecurityPolicy-2016-08', 'ELBSecurityPolicy-FS-2018-0', 'ELBSecurityPolicy-TLS13-1-2-Ext1-2021-06', 'ELBSecurityPolicy-TLS13-1-2-2021-06')
  group by
    load_balancer_arn
), nwl_without_tls_listener as (
    select
     load_balancer_arn,
     count(*)
    from
      aws_ec2_load_balancer_listener
    where
      protocol = 'TLS'
    group by
      load_balancer_arn
)
select
  -- Required Columns
  lb.arn as resource,
  case
    when l.load_balancer_arn is not null and lb.arn in (select load_balancer_arn from tls_listeners) then 'alarm'
    when l.load_balancer_arn is not null then 'ok'
    else 'info'
  end as status,
  case
    when l.load_balancer_arn is not null and lb.arn in (select load_balancer_arn from tls_listeners) then lb.title || ' TLS listener security policy not updated.'
    when l.load_balancer_arn is not null then lb.title || ' TLS listener security policy updated.'
    else lb.title || ' does not use TLS listener.'
  end as reason,
  -- Additional Dimensions
  lb.region,
  lb.account_id
from
  aws_ec2_network_load_balancer as lb
  left join nwl_without_tls_listener as l on l.load_balancer_arn = lb.arn