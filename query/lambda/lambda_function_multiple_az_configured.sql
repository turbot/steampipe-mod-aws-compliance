select
  -- Required Columns
  arn as resource,
  case
    when vpc_id is null then 'skip'
    else case
      when
      (
        select
          count(distinct availability_zone_id)
        from
          aws_vpc_subnet
        where
          subnet_id in (select jsonb_array_elements_text(vpc_subnet_ids) )
      ) >= 2
      then 'ok'
      else 'alarm'
    end
  end as status,
  case
    when vpc_id is null then title || ' is not in VPC.'
    else title || ' has ' || jsonb_array_length(vpc_subnet_ids) || ' availability zone(s).'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_lambda_function;