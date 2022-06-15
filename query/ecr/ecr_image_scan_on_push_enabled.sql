select
  -- Required Columns
  title as resource,
	case
    when image_scanning_configuration ->> 'ScanOnPush' = 'true'
      then 'ok'
    else 'alarm'
  end status,
  case 
    when image_scanning_configuration ->> 'ScanOnPush' = 'true' 
      then title || ' enabled image scan on push'
    else title || ' disabled image scan on push'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_ecr_repository;