select
  -- Required Columns
  case
    when encryption_at_rest is not null and encryption_at_rest ->> 'CatalogEncryptionMode' != 'DISABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when encryption_at_rest is not null and encryption_at_rest ->> 'CatalogEncryptionMode' != 'DISABLED' then 'Glue data catalog metadata encryption is enabled in ' || region || '.'
    else 'Glue data catalog metadata encryption is disabled in ' || region || '.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_glue_data_catalog_encryption_settings;