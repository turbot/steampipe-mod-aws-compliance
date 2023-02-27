select
  -- Required Columns
  load_balancer_arn as resource,
  case
    when date(not_after) - date(current_date) >= 7 then 'ok'
    else 'alarm'
  end as status,
   l.title || ' certificate set to expire in ' || extract(day from not_after - current_date) || ' days.' as reason,
  -- Additional Dimensions
  l.region,
  l.account_id
from
  aws_ec2_load_balancer_listener as l,
  jsonb_array_elements(certificates) as c
  left join aws_acm_certificate as a on c ->> 'CertificateArn' = a.certificate_arn;