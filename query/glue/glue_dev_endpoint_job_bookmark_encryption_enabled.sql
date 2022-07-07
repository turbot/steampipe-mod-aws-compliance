select
  -- Required Columns
  e.arn as resource,
  case
    when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then e.title || ' job bookmark encryption enabled.'
    else e.title || ' job bookmark encryption disabled.'
  end as reason,
  -- Additional Dimensions
  e.region,
  e.account_id
from
  aws_glue_dev_endpoint as e
  left join aws_glue_security_configuration as c on e.security_configuration = c.name;