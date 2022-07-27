select
  -- Required Columns
  topic_arn as resource,
  case
    when application_failure_feedback_role_arn is null 
      and firehose_failure_feedback_role_arn is null 
      and http_failure_feedback_role_arn is null 
      and lambda_failure_feedback_role_arn is null 
      and sqs_failure_feedback_role_arn is null then 'alarm'
    else 'ok'
  end as status,
  case
    when application_failure_feedback_role_arn is null 
      and firehose_failure_feedback_role_arn is null 
      and http_failure_feedback_role_arn is null 
      and lambda_failure_feedback_role_arn is null 
      and sqs_failure_feedback_role_arn is null then title || ' has delivery status logging for notification messages disabled.'
    else title || ' has delivery status logging for notification messages enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_sns_topic;