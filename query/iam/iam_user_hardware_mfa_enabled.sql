select
  -- Required Columns
  u.arn as resource,
  case
    when serial_number is null then 'alarm'
    when serial_number like any(array['%mfa%','%sms-mfa%']) then 'info'
    else 'ok'
  end as status,
  case
    when serial_number is null then u.name || ' MFA device not configured.'
    when serial_number like any(array['%mfa%','%sms-mfa%']) then u.name || ' MFA enabled, but the MFA associated is a virtual device.'
    else u.name || ' hardware MFA device enabled.'
  end as reason,
  -- Additional Dimensions
  u.region,
  u.account_id
from
  aws_iam_virtual_mfa_device as m
  right join aws_iam_user as u on m.user_id = u.user_id;
