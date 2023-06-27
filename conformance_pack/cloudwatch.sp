locals {
  conformance_pack_cloudwatch_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudWatch"
  })
}

control "cloudwatch_alarm_action_enabled" {
  title       = "CloudWatch alarm should have an action configured"
  description = "Checks if CloudWatch alarms have an action configured for the ALARM, INSUFFICIENT_DATA, or OK state. Optionally checks if any actions match a named ARN. The rule is non compliant if there is no action specified for the alarm or optional parameter."
  query       = query.cloudwatch_alarm_action_enabled

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    soc_2                                  = "true"
  })
}

control "cloudwatch_alarm_action_enabled_check" {
  title       = "CloudWatch alarm action should be enabled"
  description = "Checks if Amazon CloudWatch alarm actions are in enabled state. The rule is non compliant if the CloudWatch alarm actions are not in enabled state."
  query       = query.cloudwatch_alarm_action_enabled_check

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
    soc_2        = "true"
  })
}

control "cloudwatch_cross_account_sharing" {
  title       = "CloudWatch should not allow cross-account sharing"
  description = "Ensure that your Amazon CloudWatch is configured to allow access only to friendly AWS accounts in order to prevent unauthorized users from sharing their CloudWatch events."
  query       = query.cloudwatch_cross_account_sharing

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    other_checks = "true"
  })
}

control "log_group_encryption_at_rest_enabled" {
  title       = "Log group encryption at rest should be enabled"
  description = "To help protect sensitive data at rest, ensure encryption is enabled for your Amazon CloudWatch Log Group"
  query       = query.log_group_encryption_at_rest_enabled

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "cloudwatch_log_group_retention_period_365" {
  title       = "Log group retention period should be at least 365 days"
  description = "Ensure a minimum duration of event log data is retained for your log groups to help with troubleshooting and forensics investigations."
  query       = query.cloudwatch_log_group_retention_period_365

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    cis_controls_v8_ig1                    = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "log_metric_filter_unauthorized_api" {
  title       = "Ensure a log metric filter and alarm exist for unauthorized API calls"
  description = "Real-time monitoring of API calls can be achieved by directing CloudTrail Logs to CloudWatch Logs and establishing corresponding metric filters and alarms. It is recommended that a metric filter and alarm be established for unauthorized API calls."
  query       = query.log_metric_filter_unauthorized_api

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_console_login_mfa" {
  title       = "Ensure a log metric filter and alarm exist for AWS Management Console sign-in without MFA"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm console logins that aren't protected by MFA."
  query       = query.log_metric_filter_console_login_mfa

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_root_login" {
  title       = "Ensure a log metric filter and alarm exist for usage of 'root' account"
  description = "You can do real-time monitoring of API calls directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms.Security Hub recommends that you create a metric filter and alarm for root login attempts. Monitoring for root account logins provides visibility into the use of a fully privileged account and an opportunity to reduce the use of it."
  query       = query.log_metric_filter_root_login

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr                                   = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
  })
}

control "log_metric_filter_iam_policy" {
  title       = "Ensure a log metric filter and alarm exist for IAM policy changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes made to IAM policies. Monitoring these changes helps ensure that authentication and authorization controls remain intact."
  query       = query.log_metric_filter_iam_policy

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
    pci_dss_v321       = "true"
  })
}

control "log_metric_filter_vpc" {
  title       = "Ensure a log metric filter and alarm exist for VPC changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. You can have more than one VPC in an account, and you can create a peer connection between two VPCs, enabling network traffic to route between VPCs. Security Hub recommends that you create a metric filter and alarm for changes to VPCs."
  query       = query.log_metric_filter_vpc

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_route_table" {
  title       = "Ensure a log metric filter and alarm exist for route table changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Routing tables route network traffic between subnets and to network gateways. Security Hub recommends that you create a metric filter and alarm for changes to route tables. Monitoring these changes helps ensure that all VPC traffic flows through an expected path."
  query       = query.log_metric_filter_route_table

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_network_gateway" {
  title       = "Ensure a log metric filter and alarm exist for changes to network gateways"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Network gateways are required to send and receive traffic to a destination outside a VPC. Security Hub recommends that you create a metric filter and alarm for changes to network gateways."
  query       = query.log_metric_filter_network_gateway

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_network_acl" {
  title       = "Ensure a log metric filter and alarm exist for changes to Network Access Control Lists (NACL)"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. NACLs are used as a stateless packet filter to control ingress and egress traffic for subnets in a VPC. Security Hub recommends that you create a metric filter and alarm for changes to NACLs. Monitoring these changes helps ensure that AWS resources and services aren't unintentionally exposed."
  query       = query.log_metric_filter_network_acl

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_security_group" {
  title       = "Ensure a log metric filter and alarm exist for security group changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security groups are a stateful packet filter that controls ingress and egress traffic in a VPC. Security Hub recommends that you create a metric filter and alarm for changes to security groups. Monitoring these changes helps ensure that resources and services aren't unintentionally exposed."
  query       = query.log_metric_filter_security_group

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_config_configuration" {
  title       = "Ensure a log metric filter and alarm exist for AWS Config configuration changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes to AWS Config configuration settings. Monitoring these changes helps ensure sustained visibility of configuration items in the account"
  query       = query.log_metric_filter_config_configuration

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_bucket_policy" {
  title       = "Ensure a log metric filter and alarm exist for S3 bucket policy changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes to S3 bucket policies. Monitoring these changes might reduce time to detect and correct permissive policies on sensitive S3 buckets."
  query       = query.log_metric_filter_bucket_policy

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

control "log_metric_filter_disable_or_delete_cmk" {
  title       = "Ensure a log metric filter and alarm exist for disabling or scheduled deletion of customer managed keys"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for customer managed keys that have changed state to disabled or scheduled deletion. Data encrypted with disabled or deleted keys is no longer accessible."
  query       = query.log_metric_filter_disable_or_delete_cmk

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr     = "true"
    nist_csf = "true"
  })
}

control "log_metric_filter_console_authentication_failure" {
  title       = "Ensure a log metric filter and alarm exist for AWS Management Console authentication failures"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for failed console authentication attempts."
  query       = query.log_metric_filter_console_authentication_failure

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr                                   = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
  })
}

control "log_metric_filter_cloudtrail_configuration" {
  title       = "Ensure a log metric filter and alarm exist for CloudTrail configuration changes"
  description = "You can do real-time monitoring of API calls by directing CloudTrail logs to CloudWatch Logs and establishing corresponding metric filters and alarms. Security Hub recommends that you create a metric filter and alarm for changes to CloudTrail configuration settings. Monitoring these changes helps ensure sustained visibility to activities in the account."
  query       = query.log_metric_filter_cloudtrail_configuration

  tags = merge(local.conformance_pack_cloudwatch_common_tags, {
    gdpr               = "true"
    nist_800_171_rev_2 = "true"
    nist_csf           = "true"
  })
}

query "cloudwatch_alarm_action_enabled" {
  sql = <<-EOQ
    select
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
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudwatch_alarm;
  EOQ
}

query "cloudwatch_alarm_action_enabled_check" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when actions_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when actions_enabled then title || ' alarm actions enabled.'
        else title || ' alarm actions disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudwatch_alarm;
  EOQ
}

query "cloudwatch_cross_account_sharing" {
  sql = <<-EOQ
    with iam_role_cross_account_sharing_count as (
      select
        arn,
        replace(replace(replace((a -> 'Principal' ->> 'AWS'), '[',''), ']', ''), '"', '') as cross_account_details,
        account_id
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as a
      where
        name = 'CloudWatch-CrossAccountSharingRole'
    )
    select
      a.arn as resource,
      case
        when c.arn is null then 'ok'
        else 'info'
      end as status,
      case
        when c.arn is null then 'CloudWatch does not allow cross-account sharing.'
        else 'CloudWatch allow cross-account sharing with '|| cross_account_details || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join iam_role_cross_account_sharing_count as c on c.account_id = a.account_id;
  EOQ
}

query "log_group_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when kms_key_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when kms_key_id is null then title || ' not encrypted at rest.'
        else title || ' encrypted at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudwatch_log_group;
  EOQ
}

query "cloudwatch_log_group_retention_period_365" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when retention_in_days is null or retention_in_days < 365 then 'alarm'
        else 'ok'
      end as status,
      case
        when retention_in_days is null then title || ' retention period not set.'
        when retention_in_days < 365 then title || ' retention period less than 365 days.'
        else title || ' retention period 365 days or above.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudwatch_log_group;
  EOQ
}

query "log_metric_filter_unauthorized_api" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        -- As per cis recommended exact pattern order
        -- {($.errorCode = "*UnauthorizedOperation") || ($.errorCode = "AccessDenied*") || ($.sourceIPAddress!="delivery.logs.amazonaws.com") || ($.eventName!="HeadBucket") }
        and filter.filter_pattern ~ '\$\.errorCode\s*=\s*"\*UnauthorizedOperation".+\$\.errorCode\s*=\s*"AccessDenied\*".+\$\.sourceIPAddress\s*!=\s*"delivery.logs.amazonaws.com".+\$\.eventName\s*!=\s*"HeadBucket"'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for unauthorized API calls.'
        else filter_name || ' forwards events for unauthorized API calls.'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_console_login_mfa" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\(\s*\$\.eventName\s*=\s*"ConsoleLogin"\)\s+&&\s+\(\s*\$.additionalEventData\.MFAUsed\s*!=\s*"Yes"'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for console sign-in without MFA.'
        else filter_name || ' forwards events for console sign-in without MFA.'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_root_login" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.userIdentity\.type\s*=\s*"Root".+\$\.userIdentity\.invokedBy NOT EXISTS.+\$\.eventType\s*!=\s*"AwsServiceEvent"'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for usage of "root" account.'
        else filter_name || ' forwards events for usage of "root" account.'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_iam_policy" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging as is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern,
        filter.metric_transformation_name
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
      and filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*DeleteGroupPolicy.+\$\.eventName\s*=\s*DeleteRolePolicy.+\$\.eventName\s*=\s*DeleteUserPolicy.+\$\.eventName\s*=\s*PutGroupPolicy.+\$\.eventName\s*=\s*PutRolePolicy.+\$\.eventName\s*=\s*PutUserPolicy.+\$\.eventName\s*=\s*CreatePolicy.+\$\.eventName\s*=\s*DeletePolicy.+\$\.eventName\s*=\s*CreatePolicyVersion.+\$\.eventName\s*=\s*DeletePolicyVersion.+\$\.eventName\s*=\s*AttachRolePolicy.+\$\.eventName\s*=\s*DetachRolePolicy.+\$\.eventName\s*=\s*AttachUserPolicy.+\$\.eventName\s*=\s*DetachUserPolicy.+\$\.eventName\s*=\s*AttachGroupPolicy.+\$\.eventName\s*=\s*DetachGroupPolicy'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for IAM policy changes.'
        else filter_name || ' forwards events for IAM policy changes.'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_vpc" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        alarm.name as alarm_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*CreateVpc.+\$\.eventName\s*=\s*DeleteVpc.+\$\.eventName\s*=\s*ModifyVpcAttribute.+\$\.eventName\s*=\s*AcceptVpcPeeringConnection.+\$\.eventName\s*=\s*CreateVpcPeeringConnection.+\$\.eventName\s*=\s*DeleteVpcPeeringConnection.+\$\.eventName\s*=\s*RejectVpcPeeringConnection.+\$\.eventName\s*=\s*AttachClassicLinkVpc.+\$\.eventName\s*=\s*DetachClassicLinkVpc.+\$\.eventName\s*=\s*DisableVpcClassicLink.+\$\.eventName\s*=\s*EnableVpcClassicLink'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for VPC changes.'
        else filter_name || ' forwards events for VPC changes.'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_route_table" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        alarm.name as alarm_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*CreateRoute.+\$\.eventName\s*=\s*CreateRouteTable.+\$\.eventName\s*=\s*ReplaceRoute.+\$\.eventName\s*=\s*ReplaceRouteTableAssociation.+\$\.eventName\s*=\s*DeleteRouteTable.+\$\.eventName\s*=\s*DeleteRoute.+\$\.eventName\s*=\s*DisassociateRouteTable'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for route table changes.'
        else filter_name || ' forwards events for route table changes.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_network_gateway" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        alarm.name as alarm_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*CreateCustomerGateway.+\$\.eventName\s*=\s*DeleteCustomerGateway.+\$\.eventName\s*=\s*AttachInternetGateway.+\$\.eventName\s*=\s*CreateInternetGateway.+\$\.eventName\s*=\s*DeleteInternetGateway.+\$\.eventName\s*=\s*DetachInternetGateway'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for changes to network gateways.'
        else filter_name || ' forwards events for changes to network gateways.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_network_acl" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*CreateNetworkAcl.+\$\.eventName\s*=\s*CreateNetworkAclEntry.+\$\.eventName\s*=\s*DeleteNetworkAcl.+\$\.eventName\s*=\s*DeleteNetworkAclEntry.+\$\.eventName\s*=\s*ReplaceNetworkAclEntry.+\$\.eventName\s*=\s*ReplaceNetworkAclAssociation'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for changes to NACLs.'
        else filter_name || ' forwards events for changes to NACLs.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_security_group" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*AuthorizeSecurityGroupIngress.+\$\.eventName\s*=\s*AuthorizeSecurityGroupEgress.+\$\.eventName\s*=\s*RevokeSecurityGroupIngress.+\$\.eventName\s*=\s*RevokeSecurityGroupEgress.+\$\.eventName\s*=\s*CreateSecurityGroup.+\$\.eventName\s*=\s*DeleteSecurityGroup'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for security group changes.'
        else filter_name || ' forwards events for security group changes.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_config_configuration" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventSource\s*=\s*config.amazonaws.com.+\$\.eventName\s*=\s*StopConfigurationRecorder.+\$\.eventName\s*=\s*DeleteDeliveryChannel.+\$\.eventName\s*=\s*PutDeliveryChannel.+\$\.eventName\s*=\s*PutConfigurationRecorder'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for AWS Config configuration changes.'
        else filter_name || ' forwards events for AWS Config configuration changes.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_bucket_policy" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging as is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern,
        filter.metric_transformation_name
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventSource\s*=\s*s3.amazonaws.com.+\$\.eventName\s*=\s*PutBucketAcl.+\$\.eventName\s*=\s*PutBucketPolicy.+\$\.eventName\s*=\s*PutBucketCors.+\$\.eventName\s*=\s*PutBucketLifecycle.+\$\.eventName\s*=\s*PutBucketReplication.+\$\.eventName\s*=\s*DeleteBucketPolicy.+\$\.eventName\s*=\s*DeleteBucketCors.+\$\.eventName\s*=\s*DeleteBucketLifecycle.+\$\.eventName\s*=\s*DeleteBucketReplication'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for S3 bucket policy changes.'
        else filter_name || ' forwards events for S3 bucket policy changes.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_disable_or_delete_cmk" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventSource\s*=\s*kms.amazonaws.com.+\$\.eventName\s*=\s*DisableKey.+\$\.eventName\s*=\s*ScheduleKeyDeletion'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for disabling/deletion of CMKs.'
        else filter_name || ' forwards events for disabling/deletion of CMKs.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_console_authentication_failure" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*ConsoleLogin.+\$\.errorMessage\s*=\s*"Failed authentication"'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for console authentication failures.'
        else filter_name || ' forwards events for console authentication failures.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

query "log_metric_filter_cloudtrail_configuration" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventName\s*=\s*CreateTrail.+\$\.eventName\s*=\s*UpdateTrail.+\$\.eventName\s*=\s*DeleteTrail.+\$\.eventName\s*=\s*StartLogging.+\$\.eventName\s*=\s*StopLogging'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exist for CloudTrail configuration changes.'
        else filter_name || ' forwards events for CloudTrail configuration changes.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}

# Non-Config rule query

query "log_metric_filter_organization" {
  sql = <<-EOQ
    with filter_data as (
      select
        trail.account_id,
        trail.name as trail_name,
        trail.is_logging,
        split_part(trail.log_group_arn, ':', 7) as log_group_name,
        filter.name as filter_name,
        action_arn as topic_arn,
        alarm.metric_name,
        alarm.name as alarm_name,
        subscription.subscription_arn,
        filter.filter_pattern
      from
        aws_cloudtrail_trail as trail,
        jsonb_array_elements(trail.event_selectors) as se,
        aws_cloudwatch_log_metric_filter as filter,
        aws_cloudwatch_alarm as alarm,
        jsonb_array_elements_text(alarm.alarm_actions) as action_arn,
        aws_sns_topic_subscription as subscription
      where
        trail.is_multi_region_trail is true
        and trail.is_logging
        and se ->> 'ReadWriteType' = 'All'
        and trail.log_group_arn is not null
        and filter.log_group_name = split_part(trail.log_group_arn, ':', 7)
        and filter.filter_pattern ~ '\s*\$\.eventSource\s*=\s*organizations.amazonaws.com.+\$\.eventName\s*=\s*"?AcceptHandshake"?.+\$\.eventName\s*=\s*"?AttachPolicy"?.+\$\.eventName\s*=\s*"?CreateAccount"?.+\$\.eventName\s*=\s*"?CreateOrganizationalUnit"?.+\$\.eventName\s*=\s*"?CreatePolicy"?.+\$\.eventName\s*=\s*"?DeclineHandshake"?.+\$\.eventName\s*=\s*"?DeleteOrganization"?.+\$\.eventName\s*=\s*"?DeleteOrganizationalUnit"?.+\$\.eventName\s*=\s*"?DeletePolicy"?.+\$\.eventName\s*=\s*"?DetachPolicy"?.+\$\.eventName\s*=\s*"?DisablePolicyType"?.+\$\.eventName\s*=\s*"?EnablePolicyType"?.+\$\.eventName\s*=\s*"?InviteAccountToOrganization"?.+\$\.eventName\s*=\s*"?LeaveOrganization"?.+\$\.eventName\s*=\s*"?MoveAccount"?.+\$\.eventName\s*=\s*"?RemoveAccountFromOrganization"?.+\$\.eventName\s*=\s*"?UpdatePolicy"?.+\$\.eventName\s*=\s*"?UpdateOrganizationalUnit"?'
        and alarm.metric_name = filter.metric_transformation_name
        and subscription.topic_arn = action_arn
    )
    select
      distinct 'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when f.trail_name is null then 'alarm'
        else 'ok'
      end as status,
      case
        when f.trail_name is null then 'No log metric filter and alarm exists for AWS Organizations changes.'
        else filter_name || ' forwards relevant events for AWS Organizations changes.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join filter_data as f on a.account_id = f.account_id;
  EOQ
}
