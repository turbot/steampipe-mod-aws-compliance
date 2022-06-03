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
	u.name as resource,
	case
		when split_part(attachments, '/', 2) = 'AdministratorAccess' and not u.mfa_enabled
      then 'alarm'
		else 'ok'
	end status,
  case
    when split_part(attachments, '/', 2) = 'AdministratorAccess' and not u.mfa_enabled
      then u.name || ' with AdministratorAccess has MFA tokens disabled'
    when split_part(attachments, '/', 2) = 'AdministratorAccess' and u.mfa_enabled
      then u.name || ' with AdministratorAccess has MFA tokens enabled'
    else u.name || ' not having AdministratorAccess'
  end reason,
  -- Additional Dimensions
  u.region,
  u.account_id
from
	aws_iam_user u left join admin_users au on u.user_id = au.user_id
order by u.name;