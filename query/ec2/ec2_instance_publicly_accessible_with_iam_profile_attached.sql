select
  -- Required Columns
  arn as resource,
  case
    when iam_instance_profile_id is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when iam_instance_profile_id is not null then title || ' IAM profile attached.'
    else title || ' IAM profile not attached.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_ec2_instance
where
  public_ip_address is not null;