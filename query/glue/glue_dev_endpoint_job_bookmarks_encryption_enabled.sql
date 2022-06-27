select
  -- Required Columns
  d.arn as resource,
  case
    when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as "status",
  case
    when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then d.title || ' enabled job bookmarks encryption'
    else d.title || ' disabled job bookmarks encryption'
  end as reason,
  -- Additional Dimensions
  d.region,
  d.account_id
from
  aws_glue_dev_endpoint d
  left join aws_glue_security_configuration s on d.security_configuration = s.name;