select
	j.arn as resource,
	case
		when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then 'ok'
		else 'alarm'
	end as "status",
  case
    when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then j.title || ' enabled job bookmarks encryption'
    else j.title || ' disabled job bookmarks encryption'
  end as reason,
  -- Additional Dimensions
  j.region,
  j.account_id
from
	aws_glue_job j
  left join aws_glue_security_configuration s on j.security_configuration = s.name;