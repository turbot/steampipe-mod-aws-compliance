select
	arn,
	case
		when log ->> 'Enabled' = 'true' then 'ok'
		else 'alarm'
	end as "status",
  case
    when log ->> 'Enabled' = 'true' then title || ' enabled logging for ' || (log ->> 'Types')
    else title || ' disabled logging for ' || (log ->> 'Types')
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_eks_cluster,
	jsonb_array_elements(logging -> 'ClusterLogging') as log;