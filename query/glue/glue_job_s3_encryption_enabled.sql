select
  -- Required Columns
  j.arn as resource,
  case
    when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then j.title || ' S3 encryption enabled.'
    else j.title || ' S3 encryption disabled.'
  end as reason,
  -- Additional Dimensions
  j.region,
  j.account_id
from
  aws_glue_job as j
  left join aws_glue_security_configuration as s on j.security_configuration = s.name,
  jsonb_array_elements(s.s3_encryption) e;