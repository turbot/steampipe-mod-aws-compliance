select
  -- Required Columns
  'arn:' || partition || ':ec2:' || region || ':' || account_id || ':internet-gateway/' || title as resource,
  case
    when jsonb_array_length(attachments) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when jsonb_array_length(attachments) = 0 then title || ' not attached to VPC.'
    else title || ' attached to ' || split_part(
      substring(attachments :: text, 3, length(attachments :: text) -6),
      '"VpcId": "',
      2
    ) || '.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_vpc_internet_gateway;