with bad_rules as (
  select
    group_id
  from
    aws_vpc_security_group_rule
  where
    type = 'ingress'
    and cidr_ipv4 = '0.0.0.0/0'
    and (
      ip_protocol in ('tcp', 'udp')
      or (
        ip_protocol = '-1'
        and from_port is null
      )
      or (
        from_port >= 22
        and to_port <= 22
      )
      or (
        from_port >= 67
        and to_port <= 67
      )
      or (
        from_port >= 68
        and to_port <= 68
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
    jsonb_array_elements_text(security_groups) as g
    where
    g in (select group_id from bad_rules)
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
    when a.arn is null then a.title ||  ' does not allow ingress to TCP or UDP ports from 0.0.0.0/0.'
    else a.title || ' contains ' || num_bad_security_groups || ' security group(s) that allow ingress to TCP or UDP ports from 0.0.0.0/0.'
  end as reason,
  -- Additional Dimensions
  a.region,
  a.account_id
from
  aws_ec2_application_load_balancer as a
  left join ec2_alb_list on a.arn = ec2_alb_list.arn

