Query Optimization:

## 1. query: iam_role_cross_account_read_only_access_policy

  #### Old: Time: 44.4s. Rows returned: 338. Rows fetched: 676 (338 cached). Hydrate calls: 1,690. Scans: 2.

  ```
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
  ```


  ####  New: Time: 12.8s. Rows returned: 338. Rows fetched: 676. Hydrate calls: 1,014. Scans: 2. (No of hydtare calls got reduced)

  ```
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

  ```

  Key Point:
  - Early Filtering: The first CTE (read_only_access_roles) only includes roles with the ReadOnlyAccess policy, reducing the number of rows processed downstream.
  - Lateral Join: The join lateral ensures we only process roles with the policy, and stops at the first match. here we are using limit 1 , sp performance should be good
  - Cross-Account Check: The cross_account CTE only processes relevant roles and checks for cross-account access efficiently.
  - Final Output: The final union all ensures roles without the policy are marked as skip, but avoids unnecessary joins.


## 2. query: iam_policy_no_star_star

  #### Old: Time: 7.2s. Rows returned: 174. Rows fetched: 348. Hydrate calls: 522. Scans: 2.
  ```
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

  ```

  ####  New: Time: 6.1s. Rows returned: 174. Rows fetched: 348. Hydrate calls: 522. Scans: 2.(no significant change)

  ```
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
  ```

  Key Points:
  -  LATERAL join reduced cartesian product: Old query created all combinations of statements × resources × actions-
  -  Early Filtering: LATERAL allows filtering at the statement level before expanding resources/actions


## 3. query: iam_policy_all_attached_no_star_star

  #### Old: Time: 17.1s. Rows returned: 343. Rows fetched: 690. Hydrate calls: 690. Scans: 2.
    ```

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
    ```

  #### New Time: 16.9s. Rows returned: 343. Rows fetched: 690. Hydrate calls: 690. Scans: 2.
    ```
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
    ```

## 4. query: iam_custom_policy_unattached_no_star_star

  #### Old: Time: 9.0s. Rows returned: 23. Rows fetched: 350. Hydrate calls: 525. Scans: 2.

  ```
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
        and not is_attached
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
      p.name || ' contains ' || coalesce(bad.num_bad_statements, 0) ||
        ' statements that allow action "*" on resource "*".' as reason
      -- ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      -- ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join bad_policies as bad on p.arn = bad.arn
    where
      not p.is_aws_managed
      and not is_attached;
   ```

  #### New Time: Time: 6.2s. Rows returned: 23. Rows fetched: 175. Hydrate calls: 350.

   ```
    with policies as materialized (
      select arn, name, policy_std
      from aws_iam_policy
      where not is_aws_managed and not is_attached
    ),
    bad_policies as materialized (
      select
        p.arn,
        count(*) as num_bad_statements
      from policies p,
        lateral jsonb_array_elements(p.policy_std -> 'Statement') as s
      where s.value ->> 'Effect' = 'Allow'
        and (
          (s.value -> 'Resource')::text = '"*"'
          or exists (
            select 1
            from jsonb_array_elements_text(s.value -> 'Resource') as r
            where r = '*'
          )
        )
        and (
          (s.value -> 'Action')::text in ('"*"', '"*:*"')
          or exists (
            select 1
            from jsonb_array_elements_text(s.value -> 'Action') as a
            where a in ('*', '*:*')
          )
        )
      group by p.arn
    )
    select
      p.arn as resource,
      case
        when bad.arn is null then 'ok'
        else 'alarm'
      end as status,
      p.name || ' contains ' || coalesce(bad.num_bad_statements, 0) ||
        ' statements that allow action "*" on resource "*".' as reason
    from policies p
    left join bad_policies bad using (arn);
  ```


