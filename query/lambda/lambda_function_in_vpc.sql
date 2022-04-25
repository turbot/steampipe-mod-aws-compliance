select
  -- Required Columns
  arn as resource,
  case
    when vpc_id is null then 'ok'
    else case
      when jsonb_array_length(vpc_subnet_ids) > 1 then 'ok'
      else 'alarm'
    end
  end status,
  case
    when vpc_id is null then title || ' is not in VPC.'
    else title || ' is in VPC ' || vpc_id || '.'
  end reason,
  -- Additional Dimensions
  region,
  account_id
from
  "aws_lambda_function";
