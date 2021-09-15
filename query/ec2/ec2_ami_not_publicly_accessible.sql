select
  -- Required Columns
  image_id as resource,
  case
    when public then 'alarn'
    else 'ok'
  end status,
  case
    when public then b.title || ' publicly accessible.'
    else b.title || ' not publicly accessible.'
  end reason,
  -- Additional Dimensions
  b.region,
  b.account_id
from
  aws_account as a,
  aws_ec2_ami_shared as b
where
  owner_id = a.account_id