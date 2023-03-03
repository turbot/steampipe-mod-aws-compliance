with ingress_ssh_rules as (
  select
    group_id
  from
    aws_vpc_security_group_rule
  where
    type = 'ingress'
    and (cidr_ipv4 = '0.0.0.0/0' or (power(2, 32 - masklen(cidr_ipv4:: cidr)) > 32 and power(2, 32 - masklen(cidr_ipv4:: cidr))<= 256))
    and (
      ip_protocol in ('tcp', 'all')
      or (
        ip_protocol = '-1'
        and from_port is null
      )
      or (
        from_port >= 23
        and to_port <= 23
      )
    )
  group by
    group_id
), ec2_alb_list as (
  select
    distinct a.arn as arn,
    count(*) as num_bad_security_groups
  from
    aws_ec2_application_load_balancer as a,
    jsonb_array_elements(security_groups) as g
    where
    g ->> 'GroupId' in (select group_id from ingress_ssh_rules)
  group by
    a.arn
)
select
  -- Required Columns
  a.arn as resource,
  case
    when a.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when a.arn is null then a.title ||  ' Telnet not exposed to the entire internet.'
    else a.title || ' contains ' || num_bad_security_groups || ' security group(s) with Telnet not exposed to the entire internet.'
  end as reason,
  -- Additional Dimensions
  a.region,
  a.account_id
from
  aws_ec2_application_load_balancer as a
  left join ec2_alb_list on a.arn = ec2_alb_list.arn
