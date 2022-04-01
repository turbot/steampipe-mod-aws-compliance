select
  -- Required Columns
  arn as resource,
  case
    when viewer_certificate ->> 'ACMCertificateArn' is not null and viewer_certificate ->> 'Certificate' is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when viewer_certificate ->> 'ACMCertificateArn' is not null and viewer_certificate ->> 'Certificate' is not null then title || ' uses custom SSL certificate.'
    else title || ' does not use custom SSL certificate.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution;