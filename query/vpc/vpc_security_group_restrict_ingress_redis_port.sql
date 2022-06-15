select
  -- Required Columns
  distinct sg.group_name as resource,
	case
    when
      sgr.type = 'ingress'
      and (
        sgr.cidr_ip = '0.0.0.0/0'
        or sgr.cidr_ipv6 = '::/0'
      )
      and (
        (
          sgr.from_port <= '6379'
          and sgr.to_port >= '6379'
        )
        or (
          sgr.from_port is null
          and sgr.to_port is null
        )
      )
      then 'alarm'
    else 'ok'
  end status,
  case 
    when
      sgr.type = 'ingress'
      and (
        sgr.cidr_ip = '0.0.0.0/0'
        or sgr.cidr_ipv6 = '::/0'
      )
      and (
        (
          sgr.from_port <= '6379'
          and sgr.to_port >= '6379'
        )
        or (
          sgr.from_port is null
          and sgr.to_port is null
        )
      )
      then sg.group_name || ' allowed ingress from 0.0.0.0/0 or ::/0 to Redis port 6379'
    else sg.group_name || ' restricted ingress from 0.0.0.0/0 or ::/0 to Redis port 6379'
  end reason,
  -- Additional Dimensions
  sg.region,
  sg.account_id
from
  aws_vpc_security_group as sg
  join aws_vpc_security_group_rule as sgr on sgr.group_name = sg.group_name;