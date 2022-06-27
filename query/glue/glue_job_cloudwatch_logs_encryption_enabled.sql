select
  -- Required Columns
  j.arn as resource,
  case
    when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then j.title || ' CloudWatch logs encryption enabled.'
    else j.title || ' CloudWatch logs encryption disabled.'
  end as reason,
  -- Additional Dimensions
  j.region,
  j.account_id
from
  aws_glue_job as j
  left join aws_glue_security_configuration as c on j.security_configuration = c.name;