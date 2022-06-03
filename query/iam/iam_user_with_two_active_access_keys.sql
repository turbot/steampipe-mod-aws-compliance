select
    -- Required Columns
	  user_name as resource,
	case
    when count(access_key_id) = 2 and array_position(array_agg(status), 'Inactive') is null
      then 'alarm'
    else 'ok'
  end status,
  case
    when count(access_key_id) = 2 and array_position(array_agg(status), 'Inactive') is null
      then user_name || ' having two active access keys'
    else user_name || ' having single active access key'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_iam_access_key
group by
  user_name,
  region,
  account_id;