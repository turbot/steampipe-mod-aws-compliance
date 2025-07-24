# Single shared query that handles multiple CloudWatch metric filter checks
# This approach reduces the number of queries and maximizes CTE reuse

query "cloudwatch_metric_filters_comprehensive" {
  sql = <<-EOQ
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
    ),
    alarms as materialized (
      select
        metric_name,
        action_arn as topic_arn
      from aws_cloudwatch_alarm,
        jsonb_array_elements_text(aws_cloudwatch_alarm.alarm_actions) as action_arn
      order by metric_name
    ),
    topic_subscriptions as materialized (
      select
        subscription_arn,
        topic_arn
      from aws_sns_topic_subscription
      order by subscription_arn
    ),
    all_metric_filters as materialized (
      select
        filter.name as filter_name,
        filter_pattern,
        log_group_name,
        metric_transformation_name,
        case
          when filter.filter_pattern ~ '\(\s*\$\.eventName\s*=\s*"ConsoleLogin"\)\s+&&\s+\(\s*\$.additionalEventData\.MFAUsed\s*!=\s*"Yes"'
            then 'console_login_mfa'
          when filter.filter_pattern ~ '\s*\$\.userIdentity\.type\s*=\s*"Root".+\$\.userIdentity\.invokedBy NOT EXISTS.+\$\.eventType\s*!=\s*"AwsServiceEvent"'
            then 'root_login'
          when filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"DeleteGroupPolicy"'
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
            then 'iam_policy_changes'
          when filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*"ConsoleLogin"'
            and filter.filter_pattern ~ '\s*\$\.additionalEventData\.MFAUsed\s*!=\s*"Yes"'
            then 'unauthorized_api_calls'
          else 'other'
        end as filter_type
      from aws_cloudwatch_log_metric_filter as filter
      order by filter_name
    ),
    filter_data as materialized (
      select
        t.account_id,
        t.trail_name,
        f.filter_name,
        f.filter_type
      from trails as t
      join all_metric_filters as f on f.log_group_name = t.log_group_name
      join alarms as alarm on alarm.metric_name = f.metric_transformation_name
      join topic_subscriptions as subscription on subscription.topic_arn = alarm.topic_arn
    )
    select
      'arn:' || a.partition || ':::' || a.account_id || ':' || f.filter_type as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then
          case f.filter_type
            when 'console_login_mfa' then 'No log metric filter and alarm exist for console sign-in without MFA.'
            when 'root_login' then 'No log metric filter and alarm exist for usage of "root" account.'
            when 'iam_policy_changes' then 'No log metric filter and alarm exist for IAM policy changes.'
            when 'unauthorized_api_calls' then 'No log metric filter and alarm exist for unauthorized API calls.'
            else 'No log metric filter and alarm exist for ' || f.filter_type || '.'
          end
        else filter_name || ' forwards events for ' || f.filter_type || '.'
      end as reason,
      f.filter_type as filter_type
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from aws_account as a
    cross join (
      select distinct filter_type from all_metric_filters
    ) as filter_types
    left join filter_data as f on a.account_id = f.account_id and f.filter_type = filter_types.filter_type;
  EOQ
}