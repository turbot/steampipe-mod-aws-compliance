select
  -- Required Columns
  'arn:' || partition || ':apigateway:' || region || '::/apis/' || api_id || '/stages/' || stage_name as resource,
  case
    when access_log_settings is null then 'alarm'
    else 'ok'
  end as status,
  case
    when access_log_settings is null then title || ' access logging disabled.'
    else title || ' access logging enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_api_gatewayv2_stage;