select
  -- Required Columns
  j.arn as resource,
  case
    when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then j.title || ' job bookmarks encryption enabled.'
    else j.title || ' job bookmarks encryption disabled.'
  end as reason,
  -- Additional Dimensions
  j.region,
  j.account_id
from
  aws_glue_job as j
  left join aws_glue_security_configuration as c on j.security_configuration = c.name;