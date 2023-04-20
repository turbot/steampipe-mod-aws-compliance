locals {
  conformance_pack_sns_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SNS"
  })
}

control "sns_topic_encrypted_at_rest" {
  title       = "SNS topics should be encrypted at rest"
  description = "To help protect data at rest, ensure that your Amazon Simple Notification Service (Amazon SNS) topics require encryption using AWS Key Management Service (AWS KMS)."
  query       = query.sns_topic_encrypted_at_rest

  tags = merge(local.conformance_pack_sns_common_tags, {
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
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "sns_topic_policy_prohibit_public_access" {
  title       = "SNS topic policies should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS SNS topics cannot be publicly accessed."
  query       = query.sns_topic_policy_prohibit_public_access

  tags = merge(local.conformance_pack_sns_common_tags, {
    other_checks = "true"
  })
}

control "sns_topic_notification_delivery_status_enabled" {
  title       = "Logging of delivery status should be enabled for notification messages sent to a topic"
  description = "This control checks whether logging is enabled for the delivery status of notification messages sent to an Amazon SNS topic for the endpoints. This control fails if the delivery status notification for messages is not enabled."
  query       = query.sns_topic_notification_delivery_status_enabled

  tags = merge(local.conformance_pack_sns_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

query "sns_topic_encrypted_at_rest" {
  sql = <<-EOQ
    select
      topic_arn as resource,
      case
        when kms_master_key_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when kms_master_key_id is null then title || ' encryption at rest disabled.'
        else title || ' encryption at rest enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sns_topic;
  EOQ
}

query "sns_topic_policy_prohibit_public_access" {
  sql = <<-EOQ
    with wildcard_action_policies as (
      select
        topic_arn,
        count(*) as statements_num
      from
        aws_sns_topic,
        jsonb_array_elements(policy_std -> 'Statement') as s
      where
        s ->> 'Effect' = 'Allow'
        and (
          ( s -> 'Principal' -> 'AWS') = '["*"]'
          or s ->> 'Principal' = '*'
        )
      group by
        topic_arn
    )
    select
      t.topic_arn as resource,
      case
        when p.topic_arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when p.topic_arn is null then title || ' does not allow public access.'
        else title || ' contains ' || coalesce(p.statements_num,0) ||
        ' statements that allows public access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      aws_sns_topic as t
      left join wildcard_action_policies as p on p.topic_arn = t.topic_arn;
  EOQ
}

query "sns_topic_notification_delivery_status_enabled" {
  sql = <<-EOQ
    select
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
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sns_topic;
  EOQ
}
