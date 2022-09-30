with ingress_kibana_port as (
  select
    group_id,
    count(*) as num_ssh_rules
  from
    aws_vpc_security_group_rule
  where
    type = 'ingress'
    and (
      cidr_ipv4 = '0.0.0.0/0'
      or cidr_ipv6 = '::/0'
    )
    and (
        ( ip_protocol = '-1'
        and from_port is null
        )
        or (
          from_port >= 9200
          and to_port <= 9200
        )
        or (
          from_port >= 5601
          and to_port <= 5601
        )
    )
  group by
    group_id
)
select
  -- Required Columns
  arn as resource,
  case
    when k.group_id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when k.group_id is null then sg.group_id || ' ingress restricted for kibana port from 0.0.0.0/0 or :/0.'
    else sg.group_id || ' contains ' || k.num_ssh_rules || ' ingress rule(s) allowing kibana port from 0.0.0.0/0 or ::/0.'
  end as reason,
  -- Additional Dimensions
  sg.region,
  sg.account_id
from
  aws_vpc_security_group as sg
  left join ingress_kibana_port as k on k.group_id = sg.group_id;
