select
  -- Required Columns
  title as resource,
	case
    when enabled_cloudwatch_logs_exports is not null 
      then 'ok'
    else 'alarm'
  end status,
  case 
    when enabled_cloudwatch_logs_exports is not null 
      then title || ' enabled cloudwatch logs'
    else title || ' disabled cloudwatch logs'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_rds_db_instance;