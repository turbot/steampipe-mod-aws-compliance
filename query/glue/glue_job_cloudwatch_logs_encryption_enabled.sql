select
	-- Required Columns
	j.arn as resource,
	case
		when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then 'ok'
		else 'alarm'
	end as "status",
	case
		when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then j.title || ' enabled cloud watch logs encryption'
		else j.title || ' disabled cloud watch logs encryption'
	end as reason,
	-- Additional Dimensions
	j.region,
	j.account_id
from
	aws_glue_job j
	left join aws_glue_security_configuration s on j.security_configuration = s.name;