select
  -- Required Columns
  certificate_arn as resource,
  case
    when renewal_eligibility = 'INELIGIBLE' then 'skip'
    when date(not_after) - date(current_date) >= 30 then 'ok'
    else 'alarm'
  end as status,
  case
    when renewal_eligibility = 'INELIGIBLE' then title || ' not eligible for renewal.'
    else title || ' expires ' || to_char(not_after, 'DD-Mon-YYYY') ||
    ' (' || extract(day from not_after - current_date) || ' days).'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_acm_certificate;