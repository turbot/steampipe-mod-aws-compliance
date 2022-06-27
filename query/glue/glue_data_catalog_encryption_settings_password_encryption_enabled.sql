select
  -- Required Columns
  case
    when connection_password_encryption is not null and connection_password_encryption ->> 'ReturnConnectionPasswordEncrypted' != 'false' then 'ok'
    else 'alarm'
  end as "status",
  case
    when connection_password_encryption is not null and connection_password_encryption ->> 'ReturnConnectionPasswordEncrypted' != 'false' then 'enabled glue data catalog connection password encryption in ' || region
    else 'disabled glue data catalog connection password encryption in ' || region
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_glue_data_catalog_encryption_settings;