select
  -- Required Columns
  arn as resource,
  case
    when jsonb_array_length(alarm_actions) = 0
    and jsonb_array_length(insufficient_data_actions) = 0
    and jsonb_array_length(ok_actions) = 0 then 'alarm'
    else 'ok'
  end as status,
  case
    when jsonb_array_length(alarm_actions) = 0
    and jsonb_array_length(insufficient_data_actions) = 0
    and jsonb_array_length(ok_actions) = 0 then title || ' no action enabled.'
    when jsonb_array_length(alarm_actions) != 0 then title || ' alarm action enabled.'
    when jsonb_array_length(insufficient_data_actions) != 0 then title || ' insufficient data action enabled.'
    when jsonb_array_length(ok_actions) != 0 then title || ' ok action enabled.'
    else 'ok'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudwatch_alarm;
