select
  -- Required Columns
  e.arn as resource,
  case
    when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then e.title || ' CloudWatch logs encryption enabled.'
    else e.title || ' CloudWatch logs encryption disabled.'
  end as reason,
  -- Additional Dimensions
  e.region,
  e.account_id
from
  aws_glue_dev_endpoint as e
  left join aws_glue_security_configuration as c on e.security_configuration = c.name;