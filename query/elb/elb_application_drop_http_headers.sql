select
  -- Required Columns
  arn as resource,
  case
    when region in ('af-south-1', 'ap-northeast-3', 'eu-south-1') then 'skip'
    when load_balancer_attributes @> '[{"Key": "routing.http.drop_invalid_header_fields.enabled", "Value": "true"}]' then 'ok'
    else 'alarm'
  end as status,
  case
    when region in ('af-south-1', 'ap-northeast-3', 'eu-south-1') then title || ' excluded due to unsupported control region.'
    when load_balancer_attributes @> '[{"Key": "routing.http.drop_invalid_header_fields.enabled", "Value": "true"}]' then title || ' configured to drop http headers.'
    else title || ' not configured to drop http headers.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_application_load_balancer;