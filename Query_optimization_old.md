Query optimization:

## 1. query: iam_role_cross_account_read_only_access_policy

  #### Old: Time: 44.4s. Rows returned: 338. Rows fetched: 676 (338 cached). Hydrate calls: 1,690. Scans: 2.

  with read_only_access_roles as (
    select
      *
    from
      aws_iam_role,
      jsonb_array_elements_text(attached_policy_arns) as a
    where
      a = 'arn:aws:iam::aws:policy/ReadOnlyAccess'
    ), read_only_access_roles_with_cross_account_access as (
    select
      arn
    from
      read_only_access_roles,
      jsonb_array_elements(assume_role_policy_std -> 'Statement') as stmt,
      jsonb_array_elements_text( stmt -> 'Principal' -> 'AWS' ) as p
    where
      stmt ->> 'Effect' = 'Allow'
      and (
        p = '*'
        or not (p like '%' || account_id || '%')
      )
    )
    select
      r.arn as resource,
      case
        when ar.arn is null then 'skip'
        when c.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when ar.arn is null then r.title || ' not associated with ReadOnlyAccess policy.'
        when c.arn is not null then r.title || ' associated with ReadOnlyAccess cross account access.'
        else r.title || ' associated ReadOnlyAccess without cross account access.'
      end as reason
    from
      aws_iam_role as r
      left join read_only_access_roles as ar on r.arn = ar.arn
      left join read_only_access_roles_with_cross_account_access as c on c.arn = r.arn;


  ####  New: Time: 12.8s. Rows returned: 338. Rows fetched: 676. Hydrate calls: 1,014. Scans: 2. (No of hydtare calls got reduced)

    with read_only_access_roles as (
      select
        r.arn,
        r.title,
        r.account_id,
        r.assume_role_policy_std
      from
        aws_iam_role r
        join lateral (
          select 1
          from jsonb_array_elements_text(r.attached_policy_arns) as a
          where a = 'arn:aws:iam::aws:policy/ReadOnlyAccess'
          limit 1
        ) as has_read_only on true
    ),
    cross_account as (
      select
        r.arn
      from
        read_only_access_roles r,
        jsonb_array_elements(r.assume_role_policy_std -> 'Statement') as stmt
      where
        stmt ->> 'Effect' = 'Allow'
        and (
          -- Principal is "*" (open to all)
          (stmt -> 'Principal' -> 'AWS')::text = '"*"'
          -- Or principal is an array and not the current account
          or exists (
            select 1
            from jsonb_array_elements_text(stmt -> 'Principal' -> 'AWS') as p
            where p != r.account_id
          )
        )
    )
    select
      r.arn as resource,
      case
        when c.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.arn is not null then r.title || ' associated with ReadOnlyAccess cross account access.'
        else r.title || ' associated ReadOnlyAccess without cross account access.'
      end as reason
    from
      read_only_access_roles r
      left join cross_account c on r.arn = c.arn
    union all
    select
      r.arn as resource,
      'skip' as status,
      r.title || ' not associated with ReadOnlyAccess policy.' as reason
    from
      aws_iam_role r
    where
      not exists (
        select 1
        from jsonb_array_elements_text(r.attached_policy_arns) as a
        where a = 'arn:aws:iam::aws:policy/ReadOnlyAccess'
      );

  Key Point:
  - Early Filtering: The first CTE (read_only_access_roles) only includes roles with the ReadOnlyAccess policy, reducing the number of rows processed downstream.
  - Lateral Join: The join lateral ensures we only process roles with the policy, and stops at the first match. here we are using limit 1 , sp performance should be good
  - Cross-Account Check: The cross_account CTE only processes relevant roles and checks for cross-account access efficiently.
  - Final Output: The final union all ensures roles without the policy are marked as skip, but avoids unnecessary joins.


## 2. query: iam_policy_no_star_star

  #### Old: Time: 7.2s. Rows returned: 174. Rows fetched: 348. Hydrate calls: 522. Scans: 2.

    with bad_policies as (
        select
          arn,
          count(*) as num_bad_statements
        from
          aws_iam_policy,
          jsonb_array_elements(policy_std -> 'Statement') as s,
          jsonb_array_elements_text(s -> 'Resource') as resource,
          jsonb_array_elements_text(s -> 'Action') as action
        where
          not is_aws_managed
          and s ->> 'Effect' = 'Allow'
          and resource = '*'
          and (
            (action = '*'
            or action = '*:*'
            )
          )
        group by
          arn
      )
      select
        p.arn as resource,
        case
          when bad.arn is null then 'ok'
          else 'alarm'
        end status,
        p.name || ' contains ' || coalesce(bad.num_bad_statements,0)  ||
          ' statements that allow action "*" on resource "*".' as reason
      from
        aws_iam_policy as p
        left join bad_policies as bad on p.arn = bad.arn
      where
        not p.is_aws_managed;


  ####  New: Time: 6.1s. Rows returned: 174. Rows fetched: 348. Hydrate calls: 522. Scans: 2.(no significant change)

  with bad_policies as (
    select
      p.arn,
      count(*) as num_bad_statements
    from
      aws_iam_policy p,
      lateral jsonb_array_elements(p.policy_std -> 'Statement') as s
    where
      not p.is_aws_managed
      and s ->> 'Effect' = 'Allow'
      and (
        (
          -- Resource is exactly "*"
          (s -> 'Resource')::text = '"*"'
          or
          -- Resource is an array containing "*"
          exists (
            select 1
            from jsonb_array_elements_text(s -> 'Resource') as r
            where r = '*'
          )
        )
        and (
          -- Action is exactly "*" or "*:*"
          (s -> 'Action')::text in ('"*"','"*:*"')
          or
          -- Action is an array containing "*" or "*:*"
          exists (
            select 1
            from jsonb_array_elements_text(s -> 'Action') as a
            where a in ('*', '*:*')
          )
        )
      )
    group by
      p.arn
  )
  select
    p.arn as resource,
    case
      when bad.arn is null then 'ok'
      else 'alarm'
    end as status,
    p.name || ' contains ' || coalesce(bad.num_bad_statements,0)  ||
      ' statements that allow action "*" on resource "*".' as reason
  from
    aws_iam_policy as p
    left join bad_policies as bad on p.arn = bad.arn
  where
    not p.is_aws_managed;

Key Points:
-  LATERAL join reduced cartesian product: Old query created all combinations of statements × resources × actions-
-  Early Filtering: LATERAL allows filtering at the statement level before expanding resources/actions

## 4. query: iam_policy_all_attached_no_star_star

  #### Old: Time: 17.1s. Rows returned: 343. Rows fetched: 690. Hydrate calls: 690. Scans: 2.

      with star_access_policies as (
          select
            arn,
            is_aws_managed,
            count(*) as num_bad_statements
          from
            aws_iam_policy,
            jsonb_array_elements(policy_std -> 'Statement') as s,
            jsonb_array_elements_text(s -> 'Resource') as resource,
            jsonb_array_elements_text(s -> 'Action') as action
          where
            s ->> 'Effect' = 'Allow'
            and resource = '*'
            and (
              (action = '*'
              or action = '*:*'
              )
            )
            and is_attached
          group by
            arn,
            is_aws_managed
        )
      select
        p.arn as resource,
        case
          when s.arn is not null and s.is_aws_managed then 'info'
          when s.arn is null then 'ok'
          else 'alarm'
        end status,
        case
          when s.arn is not null and s.is_aws_managed then p.name || ' is an AWS managed policy with ' || coalesce(s.num_bad_statements, 0) || ' statements that allow action "*" on resource "*".'
          else p.name || ' contains ' || coalesce(s.num_bad_statements, 0) || ' statements that allow action "*" on resource "*".'
        end as reason
      from
        aws_iam_policy as p
        left join star_access_policies as s on p.arn = s.arn
      where
        p.is_attached;

#### New Time: 16.9s. Rows returned: 343. Rows fetched: 690. Hydrate calls: 690. Scans: 2.

      with star_access_policies as (
      select
        p.arn,
        p.is_aws_managed,
        count(*) as num_bad_statements
      from
        aws_iam_policy p,
        lateral jsonb_array_elements(p.policy_std -> 'Statement') as s
      where
        p.is_attached
        and s ->> 'Effect' = 'Allow'
        and (
          -- Resource is "*" (string or in array)
          (s -> 'Resource')::text = '"*"'
          or exists (
            select 1
            from jsonb_array_elements_text(s -> 'Resource') as r
            where r = '*'
          )
        )
        and (
          -- Action is "*" or "*:*" (string or in array)
          (s -> 'Action')::text in ('"*"','"*:*"')
          or exists (
            select 1
            from jsonb_array_elements_text(s -> 'Action') as a
            where a in ('*', '*:*')
          )
        )
        group by
          p.arn,
          p.is_aws_managed
          )
        select
          p.arn as resource,
          case
            when s.arn is not null and s.is_aws_managed then 'info'
            when s.arn is null then 'ok'
            else 'alarm'
          end as status,
          case
            when s.arn is not null and s.is_aws_managed then p.name || ' is an AWS managed policy with ' || coalesce(s.num_bad_statements, 0) || ' statements that allow action "*" on resource "*".'
            else p.name || ' contains ' || coalesce(s.num_bad_statements, 0) || ' statements that allow action "*" on resource "*".'
          end as reason
        from
          aws_iam_policy p
          left join star_access_policies s on p.arn = s.arn
        where
          p.is_attached;

## 5. query: vpc_security_group_restricted_common_ports

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

## 6. query: vpc_gateway_endpoint_restrict_public_access

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
  ),
  vpc_endpoints as materialized (
    select
      vpc_endpoint_id,
      title,
      vpc_endpoint_type
    from aws_vpc_endpoint
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
  from vpc_endpoints e
  left join wildcard_action_policies p using (vpc_endpoint_id);

  - Added as materialized to both CTEs for better performance, it have a performance impact, f the CTE is expensive to compute (e.g., involves JSON processing, joins, filters), using MATERIALIZED may still improve performance, even when used just once.
  - Separated VPC endpoint data into its own CTE to reduce repeated table access
  - Used using (vpc_endpoint_id) instead of on clause for cleaner join syntax
  - The query now uses materialized CTEs and early filtering.


## 7. query: vpc_configured_to_use_vpc_endpoints

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

    with vpc_endpoints as materialized (
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

  Key Point:
    -- Subquery executed twice now we are uisng just one single join operation,
    -- Added Materialized CTEs -- Caches expensive operations
    -- Used LEFT JOIN Instead of NOT IN
    -- Use as materialized by default for queries, especially when dealing with AWS resources that involve JSON parsing, filtering, or aggregations.


      -- Multiple references
      with shared_cte as materialized (
        select * from expensive_operation
      )
      select * from shared_cte e1
      left join shared_cte e2 on e1.id = e2.id;

      -- Complex operations
      with json_cte as materialized (
        select jsonb_array_elements(data) as item
        from complex_table
      );

      -- Large datasets
      with large_cte as materialized (
        select * from huge_table
        where date > now() - interval '30 days'
      );

  With large amounts of data, as materialized can provide significant performance benefits even for single-use CTEs.


## 8. query: vpc_flow_logs_enabled

  #### Old: Time: 5.2s. Rows returned: 46. Rows fetched: 59. Hydrate calls: 80. Scans: 2.

  with vpcs as materialized (
  select
    arn,
    account_id,
    region,
    owner_id,
    vpc_id,
    tags,
    _ctx
  from aws_vpc
),
flowlogs as materialized (
  select
    resource_id,
    account_id,
    region
  from aws_vpc_flow_log
)
select
  v.arn as resource,
  case
    when v.account_id <> v.owner_id then 'skip'
    when f.resource_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when v.account_id <> v.owner_id then v.vpc_id || ' is a shared VPC.'
    when f.resource_id is not null then v.vpc_id || ' flow logging enabled.'
    else v.vpc_id || ' flow logging disabled.'
  end as reason
  -- ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
  -- ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
from vpcs v
left join flowlogs f using (resource_id);

  #### New Time: 4.8s. Rows returned: 46. Rows fetched: 58. Hydrate calls: 99. Scans: 2.

  with vpcs as materialized (
  select
    arn,
    account_id,
    region,
    owner_id,
    vpc_id,
    tags,
    _ctx
  from aws_vpc
),
flowlogs as materialized (
  select
    resource_id,
    account_id,
    region
  from aws_vpc_flow_log
)
select
  v.arn as resource,
  case
    when v.account_id <> v.owner_id then 'skip'
    when f.resource_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when v.account_id <> v.owner_id then v.vpc_id || ' is a shared VPC.'
    when f.resource_id is not null then v.vpc_id || ' flow logging enabled.'
    else v.vpc_id || ' flow logging disabled.'
  end as reason
  -- ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
  -- ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
from vpcs v
left join flowlogs f on v.vpc_id = f.resource_id;


## 9. query: vpc_network_acl_remote_administration

  #### Old: Time: 5.7s. Rows returned: 40. Rows fetched: 80. Hydrate calls: 80. Scans: 2.

  with bad_rules as (
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
    ),
    network_acls as materialized (
      select
        network_acl_id,
        tags,
        partition,
        region,
        account_id
      from aws_vpc_network_acl
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


## 10. query: vpc_security_group_restrict_ingress_tcp_udp_all

  #### Old: Time: 5.8s. Rows returned: 86. Rows fetched: 245. Hydrate calls: 86. Scans: 2.

    with bad_rules as (
      select
        group_id,
        count(*) as num_bad_rules
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
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when bad_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when bad_rules.group_id is null then sg.group_id || ' does not allow ingress to TCP or UDP ports from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || bad_rules.num_bad_rules || ' rule(s) that allow ingress to TCP or UDP ports from 0.0.0.0/0.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as sg
      left join bad_rules on bad_rules.group_id = sg.group_id;


  #### New Time: 4.8s. Rows returned: 46. Rows fetched: 58. Hydrate calls: 99. Scans: 2.

  with bad_rules as materialized (
      select
        group_id,
        count(*) as num_bad_rules
      from aws_vpc_security_group_rule
      where
        type = 'ingress'
        and cidr_ipv4 = '0.0.0.0/0'
        and (
          ip_protocol in ('tcp', 'udp')
          or (ip_protocol = '-1' and from_port is null)
        )
      group by group_id
    ),
    security_groups as materialized (
      select
        arn,
        group_id
      from aws_vpc_security_group
    )
    select
      sg.arn as resource,
      case
        when br.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when br.group_id is null then sg.group_id || ' does not allow ingress to TCP or UDP ports from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || br.num_bad_rules || ' rule(s) that allow ingress to TCP or UDP ports from 0.0.0.0/0.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from security_groups sg
    left join bad_rules br using (group_id);

## 11. query: vpc_security_group_restrict_ingress_tcp_udp_all

  #### Old: Time: 7.5s. Rows returned: 86. Rows fetched: 245. Hydrate calls: 86. Scans: 2.

  with bad_rules as (
      select
        group_id,
        count(*) as num_bad_rules
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
        )
      group by
        group_id
    )
    select
      arn as resource,
      case
        when bad_rules.group_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when bad_rules.group_id is null then sg.group_id || ' does not allow ingress to TCP or UDP ports from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || bad_rules.num_bad_rules || ' rule(s) that allow ingress to TCP or UDP ports from 0.0.0.0/0.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as sg
      left join bad_rules on bad_rules.group_id = sg.group_id;

   #### New Time: 6.6s. Rows returned: 86. Rows fetched: 245. Hydrate calls: 86. Scans: 2

   with bad_rules as materialized (
    select
      group_id,
      count(*) as num_bad_rules
    from aws_vpc_security_group_rule
    where
      type = 'ingress'
      and cidr_ipv4 = '0.0.0.0/0'
      and (
        ip_protocol in ('tcp', 'udp')
        or (ip_protocol = '-1' and from_port is null)
      )
    group by group_id
  ),
  security_groups as materialized (
    select
      arn,
      group_id
    from aws_vpc_security_group
  )
  select
    sg.arn as resource,
    case
      when br.group_id is null then 'ok'
      else 'alarm'
    end as status,
    case
      when br.group_id is null then sg.group_id || ' does not allow ingress to TCP or UDP ports from 0.0.0.0/0.'
      else sg.group_id || ' contains ' || br.num_bad_rules || ' rule(s) that allow ingress to TCP or UDP ports from 0.0.0.0/0.'
    end as reason
    -- ${local.tag_dimensions_sql}
    -- ${local.common_dimensions_sql}
  from security_groups sg
  left join bad_rules br using (group_id);

## 12. query: vpc_security_group_restrict_ingress_common_ports_all

  #### Old: Time: 6.2s. Rows returned: 86. Rows fetched: 245. Hydrate calls: 86. Scans: 2.

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
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0.'
        else  sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access on ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;

   #### New Time: 6.1s. Rows returned: 86. Rows fetched: 245. Hydrate calls: 86. Scans: 2.

    with ingress_ssh_rules as materialized (
    select
      group_id,
      count(*) as num_ssh_rules
    from aws_vpc_security_group_rule
    where
      type = 'ingress'
      and cidr_ipv4 = '0.0.0.0/0'
      and (
        (ip_protocol = '-1' and from_port is null)
        or (from_port <= 22 and to_port >= 22)
        or (from_port <= 3389 and to_port >= 3389)
        or (from_port <= 21 and to_port >= 21)
        or (from_port <= 20 and to_port >= 20)
        or (from_port <= 3306 and to_port >= 3306)
        or (from_port <= 4333 and to_port >= 4333)
      )
    group by group_id
  ),
  security_groups as materialized (
    select
      arn,
      group_id
    from aws_vpc_security_group
  )
  select
    sg.arn as resource,
    case
      when isr.group_id is null then 'ok'
      else 'alarm'
    end as status,
    case
      when isr.group_id is null then sg.group_id || ' ingress restricted for ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0.'
      else sg.group_id || ' contains ' || isr.num_ssh_rules || ' ingress rule(s) allowing access on ports 20, 21, 22, 3306, 3389, 4333 from 0.0.0.0/0.'
    end as reason
    -- ${local.tag_dimensions_sql}
    -- ${local.common_dimensions_sql}
  from security_groups sg
  left join ingress_ssh_rules isr using (group_id);

## 13. query: vpc_security_group_associated_to_eni

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
  ),
  security_groups as materialized (
    select
      arn,
      group_id,
      title
    from aws_vpc_security_group
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
  from security_groups sg
  left join associated_sg asg on sg.group_id = asg.secgrp_id;

## 14. query: vpc_security_group_allows_ingress_to_oracle_ports

  #### Old: Time: 5.9s. Rows returned: 86. Rows fetched: 245. Hydrate calls: 86. Scans: 2.

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
                from_port <= 1521
                and to_port >= 1521
            ) or (
                from_port <= 2483
                and to_port >= 2483
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
        when ingress_ssh_rules.group_id is null then sg.group_id || ' ingress restricted for oracle ports from 0.0.0.0/0.'
        else sg.group_id || ' contains ' || ingress_ssh_rules.num_ssh_rules || ' ingress rule(s) allowing access for oracle ports from 0.0.0.0/0.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
    from
      aws_vpc_security_group as sg
      left join ingress_ssh_rules on ingress_ssh_rules.group_id = sg.group_id;

  #### New Time: 5.6s. Rows returned: 86. Rows fetched: 245. Hydrate calls: 86. Scans: 2.

  with ingress_ssh_rules as materialized (
    select
      group_id,
      count(*) as num_ssh_rules
    from aws_vpc_security_group_rule
    where
      type = 'ingress'
      and cidr_ipv4 = '0.0.0.0/0'
      and (
        (ip_protocol = '-1' and from_port is null)
        or (from_port <= 1521 and to_port >= 1521)
        or (from_port <= 2483 and to_port >= 2483)
      )
    group by group_id
  ),
  security_groups as materialized (
    select
      arn,
      group_id
    from aws_vpc_security_group
  )
  select
    sg.arn as resource,
    case
      when isr.group_id is null then 'ok'
      else 'alarm'
    end as status,
    case
      when isr.group_id is null then sg.group_id || ' ingress restricted for oracle ports from 0.0.0.0/0.'
      else sg.group_id || ' contains ' || isr.num_ssh_rules || ' ingress rule(s) allowing access for oracle ports from 0.0.0.0/0.'
    end as reason
    -- ${local.tag_dimensions_sql}
    -- ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "sg.")}
  from security_groups sg
  left join ingress_ssh_rules isr using (group_id);

## 15. query: ec2_instance_attached_ebs_volume_delete_on_termination_enabled

 #### Old: Time: 4.3s. Rows returned: 3. Rows fetched: 6. Hydrate calls: 6. Scans: 2.

 with ebs_volume_with_delete_on_termination_enabled as (
      select
        count(*) as count,
        arn
      from
        aws_ec2_instance,
        jsonb_array_elements(block_device_mappings) as p
      where
        p -> 'Ebs' ->> 'DeleteOnTermination' = 'false'
      group by
        arn
    )
    select
      i.arn as resource,
      case
        when e.count > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when e.count > 0 then ' EBS volume(s) attached to ' || title || ' has delete on termination disabled.'
        else ' EBS volume(s) attached to ' || title || ' has delete on termination enabled.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from
      aws_ec2_instance as i
      left join ebs_volume_with_delete_on_termination_enabled as e on e.arn = i.arn;

  #### New Time: 4.0s. Rows returned: 3. Rows fetched: 6 (3 cached). Hydrate calls: 3. Scans: 2.

  with ebs_volume_with_delete_on_termination_enabled as materialized (
  select
    count(*) as count,
    arn
  from aws_ec2_instance,
    jsonb_array_elements(block_device_mappings) as p
  where p -> 'Ebs' ->> 'DeleteOnTermination' = 'false'
  group by arn
),
instances as materialized (
  select
    arn,
    title
  from aws_ec2_instance
)
select
  i.arn as resource,
  case
    when e.count > 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when e.count > 0 then ' EBS volume(s) attached to ' || i.title || ' has delete on termination disabled.'
    else ' EBS volume(s) attached to ' || i.title || ' has delete on termination enabled.'
  end as reason
  -- ${local.tag_dimensions_sql}
  -- ${local.common_dimensions_sql}
from instances i
left join ebs_volume_with_delete_on_termination_enabled e using (arn);

## 16. query: ec2_ami_ebs_encryption_enabled

 #### Old: Time: 5.5s. Rows returned: 2. Rows fetched: 2. Hydrate calls: 2.

 with encryption_status as (
      select
        image_id as resource,
        region,
        account_id,
        tags,
        _ctx,
        bool_and(coalesce((mapping -> 'Ebs' ->> 'Encrypted')::text = 'true', false)) as all_encrypted
      from
        aws_ec2_ami
        cross join jsonb_array_elements(block_device_mappings) as mapping
      group by
        image_id,
        region,
        account_id,
        tags,
        _ctx
    )
    select
      resource,
      case
        when all_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when all_encrypted then resource || ' all EBS volumes are encrypted.'
        else resource || ' all EBS volumes are not encrypted.'
      end as reason
      -- ${local.tag_dimensions_sql}
      -- ${local.common_dimensions_sql}
    from
      encryption_status;

  #### New Time: 5.3s. Rows returned: 2. Rows fetched: 2. Hydrate calls: 2.
  with encryption_status as materialized (
    select
      image_id as resource,
      region,
      account_id,
      tags,
      _ctx,
      bool_and(coalesce((mapping -> 'Ebs' ->> 'Encrypted')::text = 'true', false)) as all_encrypted
    from aws_ec2_ami
      cross join jsonb_array_elements(block_device_mappings) as mapping
    group by image_id, region, account_id, tags, _ctx
  )
  select
    resource,
    case
      when all_encrypted then 'ok'
      else 'alarm'
    end as status,
    case
      when all_encrypted then resource || ' all EBS volumes are encrypted.'
      else resource || ' all EBS volumes are not encrypted.'
    end as reason
    -- ${local.tag_dimensions_sql}
    -- ${local.common_dimensions_sql}
  from encryption_status;


## 17. query: ec2_ami_ebs_encryption_enabled

 #### Old: Time: 5.5s. Rows returned: 2. Rows fetched: 2. Hydrate calls: 2.




 > with trails as materialized (
  select
    trail.account_id,
    trail.name as trail_name,
    trail.is_logging,
    split_part(trail.log_group_arn, ':', 7) as log_group_name
  from aws_cloudtrail_trail as trail,
    jsonb_array_elements(trail.event_selectors) as se
  where trail.is_multi_region_trail is true
    and trail.is_logging
    and se ->> 'ReadWriteType' = 'All'
    and trail.log_group_arn is not null
  order by trail_name
),
alarms as materialized (
  select
    metric_name,
    action_arn as topic_arn
  from aws_cloudwatch_alarm,
    jsonb_array_elements_text(aws_cloudwatch_alarm.alarm_actions) as action_arn
  order by metric_name
),
topic_subscriptions as materialized (
  select
    subscription_arn,
    topic_arn
  from aws_sns_topic_subscription
  order by subscription_arn
),
metric_filters as materialized (
  select
    filter.name as filter_name,
    filter_pattern,
    log_group_name,
    metric_transformation_name
  from aws_cloudwatch_log_metric_filter as filter
  where filter.filter_pattern ~ 'userIdentity.*type.*Root.*invokedBy NOT EXISTS.*eventType.*AwsServiceEvent'
  order by filter_name
),
filter_data as materialized (
  select
    t.account_id,
    t.trail_name,
    f.filter_name
  from trails as t
  join metric_filters as f on f.log_group_name = t.log_group_name
  join alarms as alarm on alarm.metric_name = f.metric_transformation_name
  join topic_subscriptions as subscription on subscription.topic_arn = alarm.topic_arn
),
accounts as materialized (
  select
    partition,
    account_id
  from aws_account
)
select
  distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
  case
    when f.trail_name is null then 'alarm'
    else 'ok'
  end as status,
  case
    when f.trail_name is null then 'No log metric filter and alarm exist for usage of "root" account.'
    else filter_name || ' forwards events for usage of "root" account.'
  end as reason
  -- ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
from accounts a
left join filter_data as f on a.account_id = f.account_id;
+------------------------+--------+-------------------------------------------------------------------+
| resource               | status | reason                                                            |
+------------------------+--------+-------------------------------------------------------------------+
| arn:aws:::632902152528 | alarm  | No log metric filter and alarm exist for usage of "root" account. |
+------------------------+--------+-------------------------------------------------------------------+

Time: 3.4s. Rows returned: 1. Rows fetched: 66. Hydrate calls: 196. Scans: 2.
> .quit









>  with trails as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
      order by
        trail_name
    ),
    alarms as (
      select
        metric_name,
        action_arn as topic_arn
      from
        aws_cloudwatch_alarm,
        jsonb_array_elements_text(aws_cloudwatch_alarm.alarm_actions) as action_arn
      order by
        metric_name
    ),
    topic_subscriptions as (
      select
        subscription_arn,
        topic_arn
      from
        aws_sns_topic_subscription
      order by
        subscription_arn
    ),
    metric_filters as (
      select
        filter.name as filter_name,
        filter_pattern,
        log_group_name,
        metric_transformation_name
      from
        aws_cloudwatch_log_metric_filter as filter
      where
        filter.filter_pattern ~ '\s*\$\.userIdentity\.type\s*=\s*"Root".+\$\.userIdentity\.invokedBy NOT EXISTS.+\$\.eventType\s*!=\s*"AwsServiceEvent"'
      order by
        filter_name
    ),
    filter_data as (
      select
        t.account_id,
        t.trail_name,
        f.filter_name
      from
        trails as t
      join
        metric_filters as f on f.log_group_name = t.log_group_name
      join
        alarms as alarm on alarm.metric_name = f.metric_transformation_name
      join
        topic_subscriptions as subscription on subscription.topic_arn = alarm.topic_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for usage of "root" account.'
        else filter_name || ' forwards events for usage of "root" account.'
      end as reason
     --  ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
+------------------------+--------+-------------------------------------------------------------------+
| resource               | status | reason                                                            |
+------------------------+--------+-------------------------------------------------------------------+
| arn:aws:::632902152528 | alarm  | No log metric filter and alarm exist for usage of "root" account. |
+------------------------+--------+-------------------------------------------------------------------+

Time: 7.5s. Rows returned: 1. Rows fetched: 65. Hydrate calls: 196. Scans: 2.
>


