select
  -- Required Columns
  certificate_arn as resource,
  case
    when type = 'IMPORTED' then 'skip'
    when certificate_transparency_logging_preference = 'ENABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when type = 'IMPORTED' then title || ' is imported.'
    when certificate_transparency_logging_preference = 'ENABLED' then title || ' transparency logging enabled.'
    else title || ' transparency logging disabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_acm_certificate;
