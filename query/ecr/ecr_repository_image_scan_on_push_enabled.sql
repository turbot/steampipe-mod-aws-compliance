select
  -- Required Columns
  arn as resource,
	case
    when image_scanning_configuration ->> 'ScanOnPush' = 'true' then 'ok'
    else 'alarm'
  end as status,
  case
    when image_scanning_configuration ->> 'ScanOnPush' = 'true' then title || ' scan on push enabled.'
    else title || ' scan on push disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_ecr_repository;