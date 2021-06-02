select
  -- Required Columns
  'arn:' || partition || ':apigateway:' || region || '::/apis/' || rest_api_id || '/stages/' as resource,
  case
    when client_certificate_id is null then 'alarm'
    else 'ok'
  end as status,
  case
    when client_certificate_id is null then title || ' not configured to use SSL certificates.'
    else title || ' configured to use SSL certificates.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_api_gateway_stage;