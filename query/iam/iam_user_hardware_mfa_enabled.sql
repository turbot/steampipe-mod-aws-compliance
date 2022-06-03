select
  -- Required Columns
  u.name as resource,
	case
    when serial_number is null
      then 'info'
    when serial_number like any (ARRAY ['%mfa%','%sms-mfa%'])
      then 'ok'
    else 'alarm'
  end status,
  case
    when serial_number is null
      then u.name || ' having no MFA enabled'
    when serial_number like any (ARRAY ['%mfa%','%sms-mfa%'])
      then u.name || ' having virtual MFA enabled'
    else u.name || ' having hardware MFA enabled'
  end reason,
  -- Additional Dimensions
  u.region,
  u.account_id
from
	aws_iam_virtual_mfa_device m right join aws_iam_user u on m.user_id = u.user_id;