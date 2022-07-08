select
  -- Required Columns
  case
    when connection_password_encryption is not null and connection_password_encryption ->> 'ReturnConnectionPasswordEncrypted' != 'false' then 'ok'
    else 'alarm'
  end as status,
  case
    when connection_password_encryption is not null and connection_password_encryption ->> 'ReturnConnectionPasswordEncrypted' != 'false' then 'Glue data catalog connection password encryption enabled in ' || region || '.'
    else 'Glue data catalog connection password encryption disabled in ' || region || '.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_glue_data_catalog_encryption_settings;