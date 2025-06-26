locals {
  conformance_pack_sqs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SQS"
  })
}

control "sqs_queue_encrypted_at_rest" {
  title       = "AWS SQS queues should be encrypted at rest"
  description = "This control checks whether AWS SQS queues are encrypted at rest."
  query       = query.sqs_queue_encrypted_at_rest

  tags = merge(local.conformance_pack_sqs_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "sqs_queue_policy_prohibit_public_access" {
  title       = "SQS queue policies should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS SQS queues cannot be publicly accessed."
  query       = query.sqs_queue_policy_prohibit_public_access

  tags = local.conformance_pack_sqs_common_tags
}

control "sqs_queue_dead_letter_queue_configured" {
  title       = "SQS queues should be configured with a dead-letter queue."
  description = "Ensure SQS queue is configured with a dead-letter queue. Dead-letter queues are useful for debugging your application or messaging system because they let you isolate problematic messages to determine why their processing didn't succeed."
  query       = query.sqs_queue_dead_letter_queue_configured

  tags = local.conformance_pack_sqs_common_tags
}

control "sqs_queue_encrypted_with_kms_cmk" {
  title       = "SQS queues should be encrypted with KMS CMK"
  description = "To help protect sensitive data at rest, ensure encryption is enabled for your AWS SQS queues with KMS CMK."
  query       = query.sqs_queue_encrypted_with_kms_cmk

  tags = merge(local.conformance_pack_sqs_common_tags, {
    nist_csf_v2 = "true"
  })
}

query "sqs_queue_policy_prohibit_public_access" {
  sql = <<-EOQ
    with wildcard_action_policies as (
      select
        queue_arn,
        count(*) as statements_num
      from
        aws_sqs_queue,
        jsonb_array_elements(policy_std -> 'Statement') as s
      where
        s ->> 'Effect' = 'Allow'
        and (
          ( s -> 'Principal' -> 'AWS') = '["*"]'
          or s ->> 'Principal' = '*'
        )
      group by
        queue_arn
    )
    select
      q.queue_arn as resource,
      case
        when p.queue_arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when p.queue_arn is null then title || ' does not allow public access.'
        else title || ' contains ' || coalesce(p.statements_num,0) ||
        ' statements that allows public access.'
      end as reason

      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "q.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "q.")}
    from
      aws_sqs_queue as q
      left join wildcard_action_policies as p on q.queue_arn = p.queue_arn;
  EOQ
}

query "sqs_queue_dead_letter_queue_configured" {
  sql = <<-EOQ
    select
      queue_arn as resource,
      case
        when redrive_policy is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when redrive_policy is not null then title || ' configured with dead-letter queue.'
        else title || ' not configured with dead-letter queue.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sqs_queue;
  EOQ
}

query "sqs_queue_encrypted_at_rest" {
  sql = <<-EOQ
    select
      queue_arn as resource,
      case
        when sqs_managed_sse_enabled then 'ok'
        when kms_master_key_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when sqs_managed_sse_enabled then  title || ' secured with managed SQS-SSE.'
        when kms_master_key_id is null then title || ' encryption at rest disabled.'
        else title || ' encryption at rest enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sqs_queue;
  EOQ
}

query "sqs_queue_encrypted_with_kms_cmk" {
  sql = <<-EOQ
    select
      queue_arn as resource,
      case
        when kms_master_key_id is null then 'alarm'
        when kms_master_key_id is not null and kms_master_key_id = 'alias/aws/sqs' then 'alarm'
        else 'ok'
      end as status,
      case
        when kms_master_key_id is null then title || ' encryption at rest disabled.'
        when kms_master_key_id is not null and kms_master_key_id = 'alias/aws/sqs' then title || ' not encrypted with CMK.'
        else title || ' encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sqs_queue;
  EOQ
}
