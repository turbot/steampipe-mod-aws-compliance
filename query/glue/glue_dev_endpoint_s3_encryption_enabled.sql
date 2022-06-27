select
  -- Required Columns
	d.arn as resource,
	case
		when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then 'ok'
		else 'alarm'
	end as "status",
  case
    when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then d.title || ' enabled s3 encryption'
    else d.title || ' disabled s3 encryption'
  end as reason,
  -- Additional Dimensions
  d.region,
  d.account_id
from
	aws_glue_dev_endpoint d
  left join aws_glue_security_configuration s on d.security_configuration = s.name,
  jsonb_array_elements(s.s3_encryption) e;