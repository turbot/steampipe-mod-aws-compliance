select
	case
		when encryption_at_rest is not null and encryption_at_rest ->> 'CatalogEncryptionMode' != 'DISABLED' then 'ok'
		else 'alarm'
	end as "status",
  case
    when encryption_at_rest is not null and encryption_at_rest ->> 'CatalogEncryptionMode' != 'DISABLED' then 'enabled glue data catalog metadata encryption in ' || region
    else 'disabled glue data catalog metadata encryption in ' || region
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
	aws_glue_data_catalog_encryption_settings;