select
  -- Required Columns
  d.arn as resource,
  case
    when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as "status",
  case
    when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then d.title || ' enabled cloud watch logs encryption'
    else d.title || ' disabled cloud watch logs encryption'
  end as reason,
  -- Additional Dimensions
  d.region,
  d.account_id
from
  aws_glue_dev_endpoint d
  left join aws_glue_security_configuration s on d.security_configuration = s.name;