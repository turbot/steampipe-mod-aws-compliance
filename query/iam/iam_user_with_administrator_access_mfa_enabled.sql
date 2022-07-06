with admin_users as (
  select
    user_id,
    name,
    attachments
  from
    aws_iam_user,
    jsonb_array_elements_text(attached_policy_arns) as attachments
  where
    split_part(attachments, '/', 2) = 'AdministratorAccess'
)
select
  -- Required Columns
  u.arn as resource,
  case
    when au.user_id is null then 'skip'
    when au.user_id is not null and u.mfa_enabled then 'ok'
    else 'alarm'
  end as status,
  case
    when au.user_id is null then u.name || ' does not have administrator access.'
    when au.user_id is not null and u.mfa_enabled then u.name || ' has MFA token enabled.'
    else u.name || ' has MFA token disabled.'
  end as reason,
  -- Additional Dimensions
  u.region,
  u.account_id
from
  aws_iam_user as u
  left join admin_users au on u.user_id = au.user_id
order by
  u.name;