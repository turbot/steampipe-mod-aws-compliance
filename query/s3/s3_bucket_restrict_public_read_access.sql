with public_acl as (
  select
    distinct name
  from
    aws_s3_bucket,
    jsonb_array_elements(acl -> 'Grants') as grants
  where
    (grants -> 'Grantee' ->> 'URI' = 'http://acs.amazonaws.com/groups/global/AllUsers'
    or grants -> 'Grantee' ->> 'URI' = 'http://acs.amazonaws.com/groups/global/AuthenticatedUsers')
    and (
      grants ->> 'Permission' = 'FULL_CONTROL'
      or grants ->> 'Permission' = 'READ_ACP'
      or grants ->> 'Permission' = 'READ'
    )
  ),read_access_policy as (
    select
      distinct name
    from
      aws_s3_bucket,
      jsonb_array_elements(policy_std -> 'Statement') as s,
      jsonb_array_elements_text(s -> 'Action') as action
    where
      s ->> 'Effect' = 'Allow'
      and (
        s -> 'Principal' -> 'AWS' = '["*"]'
        or s ->> 'Principal' = '*'
      )
      and (
        action = '*'
        or action = '*:*'
        or action = 's3:*'
        or action ilike 's3:get%'
        or action ilike 's3:list%'
      )
)
select
  -- Required Columns
  b.arn as resource,
  case
    when (block_public_acls or a.name is null) and not bucket_policy_is_public then 'ok'
    when (block_public_acls or a.name is null) and (bucket_policy_is_public and block_public_policy) then 'ok'
    when (block_public_acls or a.name is null) and (bucket_policy_is_public and p.name is null) then 'ok'
    else 'alarm'
  end status,
  case
    when (block_public_acls or a.name is null) and not bucket_policy_is_public then b.title || ' not publicly readable.'
    when (block_public_acls or a.name is null) and (bucket_policy_is_public and block_public_policy) then b.title || ' not publicly readable.'
    when (block_public_acls or a.name is null) and (bucket_policy_is_public and p.name is null) then  b.title || ' not publicly readable.'
    else b.title || ' publicly readable.'
  end reason,
  -- Additional Dimensions
  b.region,
  b.account_id
from
  aws_s3_bucket as b
  left join public_acl as a on b.name = a.name
  left join read_access_policy as p on b.name = p.name;