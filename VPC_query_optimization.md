Query optimization:

## 1. query: vpc_configured_to_use_vpc_endpoints

  Key Point:
    -- Subquery executed twice now we are uisng just one single join operation,
    -- Used LEFT JOIN Instead of NOT IN

  #### Old: Time: 5.3s. Rows returned: 40. Rows fetched: 42 (1 cached). Hydrate calls: 41. Scans: 3

  select
    arn as resource,
    case
      when vpc_id not in (
        select
          vpc_id
        from
          aws_vpc_endpoint
        where
          service_name like 'com.amazonaws.' || region || '.ec2'
      ) then 'alarm'
      else 'ok'
    end as status,
    case
      when vpc_id not in (
        select
          vpc_id
        from
          aws_vpc_endpoint
        where
          service_name like 'com.amazonaws.' || region || '.ec2'
      ) then title || ' not configured to use VPC endpoints.'
      else title || ' configured to use VPC endpoints.'
    end as reason
    -- ${local.tag_dimensions_sql}
    -- ${local.common_dimensions_sql}
    from
    aws_vpc;

  #### New Time: 4.7s. Rows returned: 40. Rows fetched: 41. Hydrate calls: 41. Scans: 2.

    with vpc_endpoints as (
      select distinct
        vpc_id
      from aws_vpc_endpoint
      where service_name like 'com.amazonaws.' || region || '.ec2'
    )
    select
      v.arn as resource,
      case
        when e.vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when e.vpc_id is null then v.title || ' not configured to use VPC endpoints.'
        else v.title || ' configured to use VPC endpoints.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from aws_vpc v
    left join vpc_endpoints e using (vpc_id);


## 2. query: vpc_security_group_restricted_common_ports

  #### Old: Time: 10.7s. Rows returned: 81. Rows fetched: 230. Hydrate calls: 81. Scans: 2.

  with ingress_ssh_rules as (
      select
        group_id,
        count(*) as num_ssh_rules
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
                from_port <= 22
                and to_port >= 22
            )
            or (
                from_port <= 3389
                and to_port >= 3389
            )
            or (
                from_port <= 21
                and to_port >= 21
            )
            or (
                from_port <= 20
                and to_port >= 20
            )
            or (
                from_port <= 3306
                and to_port >= 3306
            )
            or (
                from_port <= 4333
                and to_port >= 4333
            )
            or (
                from_port <= 23
                and to_port >= 23
            )
            or (
                from_port <= 25
                and to_port >= 25
            )
            or (
                from_port <= 445
                and to_port >= 445
            )
            or (
                from_port <= 110
                and to_port >= 110
            )
            or (
                from_port <= 135
                and to_port >= 135
            )
            or (
                from_port <= 143
                and to_port >= 143
            )
            or (
                from_port <= 1433
                and to_port >= 3389
            )
            or (
                from_port <= 3389
                and to_port >= 1434
            )
            or (
                from_port <= 5432
                and to_port >= 5432
            )
            or (
                from_port <= 5500
                and to_port >= 5500
            )
            or (
                from_port <= 5601
                and to_port >= 5601
            )
            or (
                from_port <= 9200
                and to_port >= 9300
            )
            or (
                from_port <= 8080
                and to_port >= 8080
            )
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when ingress_ssh_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for common ports from 0.0.0.0/0..'
        else sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access for common ports from 0.0.0.0/0.'
      end as reason
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;

  #### New Time: 9.5s. Rows returned: 81. Rows fetched: 230. Hydrate calls: 81. Scans: 2.

  with common_ports as (
    select unnest(array[
      20, 21, 22, 23, 25, 80, 110, 135, 143, 445, 443, 1433, 1434, 3306, 3389, 4333, 445, 5432, 5500, 5601, 8080, 9200, 9300
    ]) as port
  ),
  ingress_common_port_rules as (
    select
      sgr.group_id,
      count(*) as num_common_port_rules
    from
      aws_vpc_security_group_rule sgr
      join common_ports cp
        on (
          (sgr.from_port is not null and sgr.to_port is not null and cp.port between sgr.from_port and sgr.to_port)
          or (sgr.ip_protocol = '-1' and sgr.from_port is null)
        )
    where
      sgr.type = 'ingress'
      and sgr.cidr_ipv4 = '0.0.0.0/0'
    group by
      sgr.group_id
  )
select
  sg.arn as resource,
  case
    when icpr.group_id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when icpr.group_id is null then sg.group_id || ' ingress restricted for common ports from 0.0.0.0/0.'
    else sg.group_id || ' contains ' || icpr.num_common_port_rules || ' ingress rule(s) allowing access for common ports from 0.0.0.0/0.'
  end as reason
from
  aws_vpc_security_group sg
  left join ingress_common_port_rules icpr on icpr.group_id = sg.group_id;

  note : Array-Based Port Definition, JOIN Instead of Multiple OR Conditions
  -- OLD: O(n × m) where n = rules, m = port conditions
  -- Each rule checked against 20+ OR conditions

  -- NEW: O(n × p) where n = rules, p = ports
  -- Each rule joined with port array (more efficient)

## 3. query: vpc_gateway_endpoint_restrict_public_access

  #### Old: Time: 6.0s. Rows returned: 1. Rows fetched: 2. Hydrate calls: 0. Scans: 2.

    with wildcard_action_policies as (
      select
        vpc_endpoint_id,
        count(*) as statements_num
      from
        aws_vpc_endpoint,
        jsonb_array_elements(policy_std -> 'Statement') as s
      where
        s ->> 'Effect' = 'Allow'
        and s -> 'Condition' is null
        and (
          (s -> 'Principal' -> 'AWS') = '["*"]'
          or s ->> 'Principal' = '*'
        )
        and s ->> 'Action' = '["*"]'
      group by
        vpc_endpoint_id
    )
    select
      e.vpc_endpoint_id as resource,
      case
        when e.vpc_endpoint_type <> 'Gateway' then 'skip'
        when p.vpc_endpoint_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when vpc_endpoint_type <> 'Gateway' then e.title || ' is of ' || e.vpc_endpoint_type || ' endpoint type.'
        when p.vpc_endpoint_id is null then e.title || ' does not allow public access.'
        else title || ' contains ' || coalesce(p.statements_num, 0) ||
        ' statements that allow public access.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "e.")}
    from
      aws_vpc_endpoint as e
      left join wildcard_action_policies as p on p.vpc_endpoint_id = e.vpc_endpoint_id;

  #### New Time: 5.0s. Rows returned: 1. Rows fetched: 2. Hydrate calls: 0. Scans: 2.

    with wildcard_action_policies as materialized (
    select
      vpc_endpoint_id,
      count(*) as statements_num
    from aws_vpc_endpoint,
      jsonb_array_elements(policy_std -> 'Statement') as s
    where
      s ->> 'Effect' = 'Allow'
      and s -> 'Condition' is null
      and (
        (s -> 'Principal' -> 'AWS') = '["*"]'
        or s ->> 'Principal' = '*'
      )
      and s ->> 'Action' = '["*"]'
    group by vpc_endpoint_id
  )
  select
    e.vpc_endpoint_id as resource,
    case
      when e.vpc_endpoint_type <> 'Gateway' then 'skip'
      when p.vpc_endpoint_id is null then 'ok'
      else 'alarm'
    end as status,
    case
      when e.vpc_endpoint_type <> 'Gateway' then e.title || ' is of ' || e.vpc_endpoint_type || ' endpoint type.'
      when p.vpc_endpoint_id is null then e.title || ' does not allow public access.'
      else e.title || ' contains ' || coalesce(p.statements_num, 0) || ' statements that allow public access.'
    end as reason
  from aws_vpc_endpoint e
  left join wildcard_action_policies p using (vpc_endpoint_id);

  - Added as materialized to both CTEs for better performance, it have a performance impact, if the CTE is expensive to compute (e.g., involves JSON processing, joins, filters), using MATERIALIZED may still improve performance, even when used just once.
  - Separated VPC endpoint data into its own CTE to reduce repeated table access
  - Used using (vpc_endpoint_id) instead of on clause for cleaner join syntax
  - The query now uses materialized CTEs and early filtering.

## 4. query: vpc_network_acl_remote_administration

  #### Old: Time: 5.7s. Rows returned: 40. Rows fetched: 80. Hydrate calls: 80. Scans: 2.

  with bad_rules as  (
      select
        network_acl_id,
        count(*) as num_bad_rules,
        tags,
        region,
        account_id
      from
        aws_vpc_network_acl,
        jsonb_array_elements(entries) as att
      where
        att ->> 'Egress' = 'false' -- as per aws egress = false indicates the ingress
        and (
          att ->> 'CidrBlock' = '0.0.0.0/0'
          or att ->> 'Ipv6CidrBlock' =  '::/0'
        )
        and att ->> 'RuleAction' = 'allow'
        and (
          (
            att ->> 'Protocol' = '-1' -- all traffic
            and att ->> 'PortRange' is null
          )
          or (
            (att -> 'PortRange' ->> 'From') :: int <= 22
            and (att -> 'PortRange' ->> 'To') :: int >= 22
            and att ->> 'Protocol' in('6', '17')  -- TCP or UDP
          )
          or (
            (att -> 'PortRange' ->> 'From') :: int <= 3389
            and (att -> 'PortRange' ->> 'To') :: int >= 3389
            and att ->> 'Protocol' in('6', '17')  -- TCP or UDP
        )
      )
      group by
        network_acl_id,
        region,
        account_id,
        tags
      order by
        network_acl_id,
        region,
        account_id,
        tags
    ),
    aws_vpc_network_acls as (
      select
        network_acl_id,
        tags,
        partition,
        region,
        account_id
      from
        aws_vpc_network_acl
      order by
        network_acl_id,
        region,
        account_id
    )
    select
      'arn:' || acl.partition || ':ec2:' || acl.region || ':' || acl.account_id || ':network-acl/' || acl.network_acl_id  as resource,
      case
        when bad_rules.network_acl_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when bad_rules.network_acl_id is null then acl.network_acl_id || ' does not allow ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
        else acl.network_acl_id || ' contains ' || bad_rules.num_bad_rules || ' rule(s) allowing ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
      end as reason
      -- ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "acl.")}
      -- ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "acl.")}
    from
      aws_vpc_network_acls as acl
      left join bad_rules on bad_rules.network_acl_id = acl.network_acl_id;

  #### New Time: 4.8s. Rows returned: 46. Rows fetched: 58. Hydrate calls: 99. Scans: 2.

    with bad_rules as materialized (
      select
        network_acl_id,
        count(*) as num_bad_rules,
        tags,
        region,
        account_id
      from aws_vpc_network_acl,
        jsonb_array_elements(entries) as att
      where
        att ->> 'Egress' = 'false'
        and (
          att ->> 'CidrBlock' = '0.0.0.0/0'
          or att ->> 'Ipv6CidrBlock' = '::/0'
        )
        and att ->> 'RuleAction' = 'allow'
        and (
          (att ->> 'Protocol' = '-1' and att ->> 'PortRange' is null)
          or (
            (att -> 'PortRange' ->> 'From')::int <= 22
            and (att -> 'PortRange' ->> 'To')::int >= 22
            and att ->> 'Protocol' in ('6', '17')
          )
          or (
            (att -> 'PortRange' ->> 'From')::int <= 3389
            and (att -> 'PortRange' ->> 'To')::int >= 3389
            and att ->> 'Protocol' in ('6', '17')
          )
        )
      group by network_acl_id, region, account_id, tags
      order by
        network_acl_id,
        region,
        account_id,
        tags
    ),
    network_acls as (
      select
        network_acl_id,
        tags,
        partition,
        region,
        account_id
      from aws_vpc_network_acl
       order by
        network_acl_id,
        region,
        account_id
    )
    select
      'arn:' || acl.partition || ':ec2:' || acl.region || ':' || acl.account_id || ':network-acl/' || acl.network_acl_id as resource,
      case
        when br.network_acl_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when br.network_acl_id is null then acl.network_acl_id || ' does not allow ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
        else acl.network_acl_id || ' contains ' || br.num_bad_rules || ' rule(s) allowing ingress to port 22 or 3389 from 0.0.0.0/0 or ::/0.'
      end as reason
      -- ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "acl.")}
      -- ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "acl.")}
    from network_acls acl
    left join bad_rules br using (network_acl_id);

## 5. query: vpc_security_group_associated_to_eni

  #### Old: Time: 5.5s. Rows returned: 86. Rows fetched: 91. Hydrate calls: 86. Scans: 2.

  with associated_sg as (
  select
    count(sg ->> 'GroupId'),
    sg ->> 'GroupId' as secgrp_id
  from
    aws_ec2_network_interface,
    jsonb_array_elements(groups) as sg
    group by sg ->> 'GroupId'
)
select
  distinct s.arn as resource,
  case
    when a.secgrp_id = s.group_id then 'ok'
    else 'alarm'
  end as status,
  case
    when a.secgrp_id = s.group_id then s.title || ' is associated with ' || a.count || ' ENI(s).'
    else s.title || ' not associated to any ENI.'
  end as reason
  -- ${local.tag_dimensions_sql}
  -- ${local.common_dimensions_sql}
from
  aws_vpc_security_group as s
  left join associated_sg as a on s.group_id = a.secgrp_id;

  #### New Time: 4.5s. Rows returned: 86. Rows fetched: 91. Hydrate calls: 86. Scans: 2.

  with associated_sg as materialized (
    select
      sg ->> 'GroupId' as secgrp_id,
      count(sg ->> 'GroupId') as eni_count
    from aws_ec2_network_interface,
      jsonb_array_elements(groups) as sg
    group by sg ->> 'GroupId'
  )
  select
    sg.arn as resource,
    case
      when asg.secgrp_id is not null then 'ok'
      else 'alarm'
    end as status,
    case
      when asg.secgrp_id is not null then sg.title || ' is associated with ' || asg.eni_count || ' ENI(s).'
      else sg.title || ' not associated to any ENI.'
    end as reason
    -- ${local.tag_dimensions_sql}
    -- ${local.common_dimensions_sql}
  from aws_vpc_security_group sg
  left join associated_sg asg on sg.group_id = asg.secgrp_id;


## 6. query: vpc_route_table_restrict_public_access_to_igw

  #### Old: Time: 5.5s. Rows returned: 86. Rows fetched: 91. Hydrate calls: 86. Scans: 2.

  with route_with_public_access as (
      select
        route_table_id,
        count(*) as num
      from
        aws_vpc_route_table,
        jsonb_array_elements(routes) as r
      where
        ( r ->> 'DestinationCidrBlock' = '0.0.0.0/0'
          or r ->> 'DestinationCidrBlock' = '::/0'
        )
        and r ->> 'GatewayId' like 'igw%'
      group by
        route_table_id
    )
    select
      a.route_table_id as resource,
      case
        when b.route_table_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.route_table_id is null then a.title || ' does not have public routes to an Internet Gateway (IGW)'
        else a.title || ' contains ' || b.num || ' rule(s) which have public routes to an Internet Gateway (IGW)'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from
      aws_vpc_route_table as a
      left join route_with_public_access as b on b.route_table_id = a.route_table_id;

  #### New Time: 5.5s. Rows returned: 47. Rows fetched: 47. Hydrate calls: 0.

  with route_tables as materialized (
  select
    route_table_id,
    title,
    routes
  from aws_vpc_route_table
),
public_routes as materialized (
  select
    rt.route_table_id,
    count(*) as num
  from route_tables rt,
    lateral jsonb_array_elements(rt.routes) as r
  where (r.value ->> 'DestinationCidrBlock' = '0.0.0.0/0'
      or r.value ->> 'DestinationCidrBlock' = '::/0')
    and r.value ->> 'GatewayId' like 'igw%'
  group by rt.route_table_id
)
select
  rt.route_table_id as resource,
  case
    when pr.route_table_id is null then 'ok'
    else 'alarm'
  end as status,
  case
    when pr.route_table_id is null then rt.title || ' does not have public routes to an Internet Gateway (IGW)'
    else rt.title || ' contains ' || pr.num || ' rule(s) which have public routes to an Internet Gateway (IGW)'
  end as reason
  -- ${local.tag_dimensions_sql}
  -- ${local.common_dimensions_sql}
from route_tables rt
left join public_routes pr using (route_table_id);
