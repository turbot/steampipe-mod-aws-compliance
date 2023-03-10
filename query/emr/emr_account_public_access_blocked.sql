select
  -- Required Columns
  'arn:' || partition || '::' || region || ':' || account_id as resource,
  case
    when block_public_security_group_rules then 'ok'
    else 'alarm'
  end as status,
  case
    when block_public_security_group_rules then region || ' EMR block public access enabled.' 
    else region || ' EMR block public access disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_emr_block_public_access_configuration;