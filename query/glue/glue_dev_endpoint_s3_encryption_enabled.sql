select
  -- Required Columns
  d.arn as resource,
  case
    when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then d.title || ' S3 encryption enabled.'
    else d.title || ' S3 encryption disabled.'
  end as reason,
  -- Additional Dimensions
  d.region,
  d.account_id
from
  aws_glue_dev_endpoint as d
  left join aws_glue_security_configuration s on d.security_configuration = s.name,
  jsonb_array_elements(s.s3_encryption) e;