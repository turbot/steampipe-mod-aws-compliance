select
  -- Required Columns
  arn as resource,
  case
    when vpc_subnet_ids is null then 'alarm'
    when jsonb_array_length(vpc_subnet_ids) > 1 then 'ok'
    else 'alarm'
  end as status,
  case
    when vpc_subnet_ids is null then title || ' is not in VPC.'
    else title || ' has ' || jsonb_array_length(vpc_subnet_ids) || ' availability zone(s).'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  "aws_lambda_function";
