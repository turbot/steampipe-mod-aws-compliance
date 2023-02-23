select
  -- Required Columns
  load_balancer_arn as resource,
  case
    when date(not_after) - date(current_date) >= 30 then 'ok'
    else 'alarm'
  end as status,
  case
    when date(not_after) - date(current_date) >= 30 then l.title || ' certificate set to expire in ' || extract(day from not_after - current_date) || ' days.' else l.title || ' certificate expired' || to_char(not_after, 'DD-Mon-YYYY') || '.'
  end as reason,
  -- Additional Dimensions
  l.region,
  l.account_id
from
  aws_ec2_load_balancer_listener as l,
  jsonb_array_elements(certificates) as c,
  aws_acm_certificate as a
where
  c ->> 'CertificateArn' = a.certificate_arn;
