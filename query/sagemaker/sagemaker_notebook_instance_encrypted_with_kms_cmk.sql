select
  -- Required Columns
  i.arn as resource,
  case
    when kms_key_id is null then 'alarm'
    when k.key_manager = 'CUSTOMER' then 'ok'
    else 'alarm'
  end as status,
  case
    when kms_key_id is null then i.title || ' encryption disabled.'
    when k.key_manager = 'CUSTOMER' then i.title || ' encryption at rest with CMK enabled.'
    else i.title || ' encryption at rest with CMK disabled.'
  end as reason,
  -- Additional Dimensions
  i.region,
  i.account_id
from
  aws_sagemaker_notebook_instance as i
  left join aws_kms_key as k on k.arn = i.kms_key_id;