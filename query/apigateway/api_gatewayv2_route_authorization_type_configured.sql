select
  -- Required Columns
  'arn:' || partition || ':apigateway:' || region || '::/apis/' || api_id || '/routes/' || route_id as resource,
  case
    when authorization_type is null then 'alarm'
    else 'ok'
  end as status,
  case
    when authorization_type is null then route_id || ' authorization type not configured.'
    else route_id || ' authorization type ' || authorization_type || ' configured.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_api_gatewayv2_route;