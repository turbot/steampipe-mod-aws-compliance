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
), ec2_instance_list as (
  select
    distinct i.arn as arn,
    count(*) as num_bad_security_groups
  from
    aws_ec2_instance as i,
    jsonb_array_elements(security_groups) as g
    where
    g ->> 'GroupId' in (select group_id from ingress_ssh_rules)
  group by
    i.arn
)
select
  -- Required Columns
  i.arn as resource,
  case
    when i.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when i.arn is null then i.title ||  ' Telnet not exposed to the entire internet.'
    else i.title || ' contains ' || num_bad_security_groups || ' security group(s) with Telnet not exposed to the entire internet.'
  end as reason,
  -- Additional Dimensions
  i.region,
  i.account_id
from
  aws_ec2_instance as i
  left join ec2_instance_list on i.arn = ec2_instance_list.arn
