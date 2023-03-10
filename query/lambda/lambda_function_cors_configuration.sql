select
  -- Required Columns
  arn as resource,
  case
    when url_config is null then 'info'
    when url_config -> 'Cors' ->> 'AllowOrigins' = '["*"]' then 'alarm'
    else 'ok'
  end as status,
  case
    when url_config is null then title || ' does not has a URL config.'
    when url_config -> 'Cors' ->> 'AllowOrigins' = '["*"]' then title || ' CORS configuration allow all origins.'
    else title || ' CORS configuration does not allow all origins.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_lambda_function;