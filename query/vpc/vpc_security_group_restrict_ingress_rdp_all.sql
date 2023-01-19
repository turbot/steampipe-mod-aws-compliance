with ingress_rdp_rules as (
  select
    group_id,
    count(*) as num_rdp_rules
  from
    aws_vpc_security_group_rule
  where
    type = 'ingress'
    and cidr_ipv4 = '0.0.0.0/0'
    and (
        ( ip_protocol = '-1'
        and from_port is null
        )
        or (
            from_port >= 3389
            and to_port <= 3389
        )
    )
  group by
    group_id
)
select
  -- Required Columns
  arn as resource,
  case
    when ingress_rdp_rules.group_id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when ingress_rdp_rules.group_id is null then sg.group_id || ' ingress restricted for RDP from 0.0.0.0/0.'
    else sg.group_id || ' contains ' || ingress_rdp_rules.num_rdp_rules || ' ingress rule(s) allowing RDP from 0.0.0.0/0.'
  end as reason,
  -- Additional Dimensions
  sg.region,
  sg.account_id
from
  aws_vpc_security_group as sg
  left join ingress_rdp_rules on ingress_rdp_rules.group_id = sg.group_id;
