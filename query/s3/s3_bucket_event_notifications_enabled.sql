select
  -- Required Columns
  arn as resource,
  case
    when
      event_notification_configuration ->> 'EventBridgeConfiguration' is null
      and event_notification_configuration ->> 'LambdaFunctionConfigurations' is null
      and event_notification_configuration ->> 'QueueConfigurations' is null
      and event_notification_configuration ->> 'TopicConfigurations' is null then 'alarm'
    else 'ok'
  end as status,
  case
     when
      event_notification_configuration ->> 'EventBridgeConfiguration' is null
      and event_notification_configuration ->> 'LambdaFunctionConfigurations' is null
      and event_notification_configuration ->> 'QueueConfigurations' is null
      and event_notification_configuration ->> 'TopicConfigurations' is null then title || ' event notifications disabled.'
    else title || ' event notifications enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_s3_bucket;
