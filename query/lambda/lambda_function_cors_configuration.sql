select
  -- Required Columns
  arn as resource,
  case
    when url_config -> 'Cors' ->> 'AllowOrigins' = '["*"]' then 'ok'
    when url_config -> 'Cors' is null then 'alarm'
    else 'alarm'
  end status,
  case
    when url_config -> 'Cors' ->> 'AllowOrigins' = '["*"]' then title || ' has a wide CORS configuration.'
    when url_config -> 'Cors' is null then title || ' does not has a CORS configuration.'
    else title || 'does not has a wide CORS configuration.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_lambda_function;
