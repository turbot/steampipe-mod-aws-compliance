select
  -- Required Columns
  title as resource,
	case
    when s -> 'Principal' ->> 'AWS' like '%*%'
      then 'alarm'
    else 'ok'
  end status,
  case 
    when s -> 'Principal' ->> 'AWS' like '%*%'
      then 'KMS key ' || title || ' exposed'
    else 'KMS key ' || title || ' not exposed'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_kms_key,
	jsonb_array_elements(policy -> 'Statement') as s;