select
  -- Required Columns
  p.name as resource,
  case
    when jsonb_array_length(a.provider_arns) > 0 then 'ok'
    else 'alarm'
  end as status,
  case
    when jsonb_array_length(a.provider_arns) > 0 then p.name || ' authorizers configured.'
    else p.name || ' authorizers not configured.'
  end as reason,
  -- Additional Dimensions
  p.region,
  p.account_id
from
  aws_api_gateway_rest_api as p
  left join aws_api_gateway_authorizer as a on p.api_id = a.rest_api_id;