locals {
  # Shared CloudWatch CTEs that can be referenced by multiple queries
  cloudwatch_shared_ctes = {
    trails_cte = <<-EOQ
      with trails as materialized (
        select
          trail.account_id,
          trail.name as trail_name,
          trail.is_logging,
          split_part(trail.log_group_arn, ':', 7) as log_group_name
        from aws_cloudtrail_trail as trail,
          jsonb_array_elements(trail.event_selectors) as se
        where trail.is_multi_region_trail is true
          and trail.is_logging
          and se ->> 'ReadWriteType' = 'All'
          and trail.log_group_arn is not null
        order by trail_name
      )
    EOQ

    alarms_cte = <<-EOQ
      alarms as materialized (
        select
          metric_name,
          action_arn as topic_arn
        from aws_cloudwatch_alarm,
          jsonb_array_elements_text(aws_cloudwatch_alarm.alarm_actions) as action_arn
        order by metric_name
      )
    EOQ

    topic_subscriptions_cte = <<-EOQ
      topic_subscriptions as materialized (
        select
          subscription_arn,
          topic_arn
        from aws_sns_topic_subscription
        order by subscription_arn
      )
    EOQ

    # Specific metric filter patterns
    unauthorized_api_filter_cte = <<-EOQ
      metric_filters as materialized (
        select
          filter.name as filter_name,
          filter_pattern,
          log_group_name,
          metric_transformation_name
        from aws_cloudwatch_log_metric_filter as filter
        where filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"ConsoleLogin"'
          and filter.filter_pattern ~ '\s*\$\.additionalEventData\.MFAUsed\s*!=\s*"Yes"'
        order by filter_name
      )
    EOQ

    console_login_mfa_filter_cte = <<-EOQ
      metric_filters as materialized (
        select
          filter.name as filter_name,
          filter_pattern,
          log_group_name,
          metric_transformation_name
        from aws_cloudwatch_log_metric_filter as filter
        where filter.filter_pattern ~ '\(\s*\$\.eventName\s*=\s*"ConsoleLogin"\)\s+&&\s+\(\s*\$.additionalEventData\.MFAUsed\s*!=\s*"Yes"'
        order by filter_name
      )
    EOQ

    root_login_filter_cte = <<-EOQ
      metric_filters as materialized (
        select
          filter.name as filter_name,
          filter_pattern,
          log_group_name,
          metric_transformation_name
        from aws_cloudwatch_log_metric_filter as filter
        where filter.filter_pattern ~ '\s*\$\.userIdentity\.type\s*=\s*"Root".+\$\.userIdentity\.invokedBy NOT EXISTS.+\$\.eventType\s*!=\s*"AwsServiceEvent"'
        order by filter_name
      )
    EOQ

    iam_policy_filter_cte = <<-EOQ
      metric_filters as materialized (
        select
          filter.name as filter_name,
          filter_pattern,
          log_group_name,
          metric_transformation_name
        from aws_cloudwatch_log_metric_filter as filter
        where filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"DeleteGroupPolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"DeleteRolePolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"DeleteUserPolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"PutGroupPolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"PutRolePolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"PutUserPolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"AttachGroupPolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"AttachRolePolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"AttachUserPolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"DetachGroupPolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"DetachRolePolicy"'
          or filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"DetachUserPolicy"'
        order by filter_name
      )
    EOQ

    # Generic filter data CTE template
    filter_data_template = <<-EOQ
      filter_data as (
        select
          t.account_id,
          t.trail_name,
          f.filter_name
        from trails as t
        join metric_filters as f on f.log_group_name = t.log_group_name
        join alarms as alarm on alarm.metric_name = f.metric_transformation_name
        join topic_subscriptions as subscription on subscription.topic_arn = alarm.topic_arn
      )
    EOQ
  }
}