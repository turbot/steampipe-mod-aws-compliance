with group_with_admin_access as (
  select
    group_id
  from
    aws_iam_group,
    jsonb_array_elements_text(attached_policy_arns) as p
  where
   p like '%policy/AdministratorAccess'
  group by
    group_id
),
users_of_admintrator_group as (
  select
   u ->> 'UserId' as user_id,
   b.group_id as group_id
  from
    group_with_admin_access as b
    left join aws_iam_group as c on c.group_id = b.group_id,
    jsonb_array_elements(users) as u
)
select
  -- Required Columns
  a.user_id as resource,
  case
    when mfa_enabled then 'ok'
    else 'alarm'
  end status,
   case
    when mfa_enabled then title || ' admin group' || a.group_id || ' user MFA enabled.'
    else title || ' admin group ' || a.group_id || ' user MFA disabled.'
  end reason,
  -- Additional Dimensions
  b.account_id
from
  users_of_admintrator_group as a
  left join aws_iam_user as b on a.user_id = b.user_id
