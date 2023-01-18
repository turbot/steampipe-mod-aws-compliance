with public_acl as (
  select
    distinct name
  from
    aws_s3_bucket,
    jsonb_array_elements(acl -> 'Grants') as grants
  where
    grants -> 'Grantee' ->> 'URI' = 'http://acs.amazonaws.com/groups/global/AllUsers'
    and (
      grants ->> 'Permission' = 'FULL_CONTROL'
      or grants ->> 'Permission' = 'WRITE_ACP'
    )
), public_policy as (
  select
    distinct name
  from
    aws_s3_bucket,
    jsonb_array_elements(policy_std -> 'Statement') as s,
    jsonb_array_elements_text(s -> 'Action') as a
  where
    s ->> 'Effect' = 'Allow'
    and (s -> 'Principal' -> 'AWS' = '["*"]' or s ->> 'Principal' = '*')
    and (a = '*' or a = 's3:*')
)
select
  -- Required Columns
  b.arn as resource,
  case
    when (block_public_acls or a.name is null) and (block_public_policy or p.name is null) then 'ok'
    else 'alarm'
  end status,
  case
    when (block_public_acls or a.name is null) and (block_public_policy or p.name is null) then b.title || ' not publicly writable.'
    else b.title || ' publicly writable.'
  end reason,
  -- Additional Dimensions
  b.region,
  b.account_id
from
  aws_s3_bucket as b
  left join public_acl as a on b.name = a.name
  left join public_policy as p on b.name = p.name;