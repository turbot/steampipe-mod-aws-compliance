with ingress_redis_port as (
  select
    group_id,
    count(*) as num_redis_rules
  from
    aws_vpc_security_group_rule
  where
    type = 'ingress'
    and
      (cidr_ipv4 = '0.0.0.0/0'
      or cidr_ipv6 = '::/0')
    and
    (
      ( ip_protocol = '-1'
      and from_port is null
      )
      or (
        from_port >= 6379
        and to_port <= 6379
      )
    )
  group by
    group_id
)
select
  -- Required Columns
  arn as resource,
  case
    when ingress_redis_port.group_id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when ingress_redis_port.group_id is null then sg.group_id || ' restricted ingress from 0.0.0.0/0 or ::/0 to Redis port 6379.'
    else sg.group_id || ' contains ' || ingress_redis_port.num_redis_rules || ' ingress rule(s) from 0.0.0.0/0 or ::/0 to Redis port 6379.'
  end as reason,
  -- Additional Dimensions
  sg.region,
  sg.account_id
from
  aws_vpc_security_group as sg
  left join ingress_redis_port on ingress_redis_port.group_id = sg.group_id;