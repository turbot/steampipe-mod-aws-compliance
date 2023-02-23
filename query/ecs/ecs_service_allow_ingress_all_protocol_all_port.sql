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
      from_port = -1
      and to_port = -1
    )
  )
 group by
  group_id
)
select
 -- Required Columns
 e.arn as resource,
 case
  when i.group_id is not null then 'alarm'
  else 'ok'
 end as status,
 case
  when i.group_id is not null then sg.group_id || ' ingress allowing all protocols from 0.0.0.0/0.'
  else sg.group_id || ' contains ' || i.num_rdp_rules || ' ingress restricted for all ports from 0.0.0.0/0.'
 end as reason,
 -- Additional Dimensions
 e.region,
 e.account_id
from
 aws_vpc_security_group as sg,
 ingress_rdp_rules as i,
 aws_ecs_service as e,
 jsonb_array_elements_text(network_configuration -> 'AwsvpcConfiguration' -> 'SecurityGroups') as esg
where
 i.group_id = esg
 and i.group_id = sg.group_id;