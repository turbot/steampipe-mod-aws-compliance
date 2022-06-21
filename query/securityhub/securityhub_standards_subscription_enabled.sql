select
	standards_arn,
	case
		when standards_status = 'READY' then 'ok'
		else 'alarm'
	end as "status",
  case
    when standards_status = 'READY' then title || ' subscribed to standard ' || standards_subscription_arn
    else title || ' not subscribed to any standard'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_securityhub_standards_subscription;