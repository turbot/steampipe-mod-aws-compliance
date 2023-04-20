locals {
  conformance_pack_cloudformation_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFormation"
  })
}

control "cloudformation_stack_drift_detection_check" {
  title       = "CloudFormation stacks differ from the expected configuration"
  description = "Ensure if the actual configuration of a Cloud Formation stack differs, or has drifted, from the expected configuration, a stack is considered to have drifted if one or more of its resources differ from their expected configuration."
  query       = query.cloudformation_stack_drift_detection_check

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "cloudformation_stack_output_no_secrets" {
  title       = "CloudFormation stacks outputs should not have any secrets"
  description = "Ensure CloudFormation stacks outputs do not contain secrets like user names, passwords, and tokens. It is recommended to remove secrets since outputs cannot be encrypted resulting in any entity with basic read-metadata-only and access to CloudFormation outputs having access to these secrets."
  query       = query.cloudformation_stack_output_no_secrets

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    other_checks = "true"
  })
}

control "cloudformation_stack_notifications_enabled" {
  title       = "CloudFormation stacks should have notifications enabled"
  description = "Ensure CloudFormation stacks are associated with an SNS topic to receive notifications when an event occurs."
  query       = query.cloudformation_stack_notifications_enabled

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    nist_csf     = "true"
    other_checks = "true"
  })
}

control "cloudformation_stack_rollback_enabled" {
  title       = "CloudFormation stacks should have rollback enabled"
  description = "Ensure CloudFormation stacks have the rollback feature enabled. Rollback triggers enable you to have AWS CloudFormation monitor the state of your application during stack creation and updating, and to rollback that operation if the application breaches the threshold of any of the alarms you've specified."
  query       = query.cloudformation_stack_rollback_enabled

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    other_checks = "true"
  })
}

control "cloudformation_stack_termination_protection_enabled" {
  title       = "Cloudformation stacks termination protection should be enabled"
  description = "Ensure that Amazon CloudFormation stacks have termination protection feature enabled in order to protect them from being accidentally deleted. The safety feature can be enabled when you create the CloudFormation stack or for existing stacks using the AWS API (UpdateTerminationProtection command)."
  query       = query.cloudformation_stack_termination_protection_enabled

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    other_checks = "true"
  })
}

query "cloudformation_stack_drift_detection_check" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when stack_drift_status = 'IN_SYNC' then 'ok'
        when stack_drift_status = 'DRIFTED' then 'alarm'
        else 'skip'
      end as status,
      case
        when stack_drift_status = 'IN_SYNC' then title || ' drift status is ' || stack_drift_status || '.'
        when stack_drift_status = 'DRIFTED' then title || ' drift status is ' || stack_drift_status || '.'
        else title || ' drift status is ' || stack_drift_status || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudformation_stack;
  EOQ
}

query "cloudformation_stack_output_no_secrets" {
  sql = <<-EOQ
    with stack_output as (
      select
        id,
        jsonb_array_elements(outputs) -> 'OutputKey' as k,
        jsonb_array_elements(outputs) -> 'OutputValue' as v,
        region,
        account_id
      from
        aws_cloudformation_stack
    ),
    stack_with_secrets as (
      select
        distinct id
      from
        stack_output
      where
        lower(k::text) like any (array ['%pass%', '%secret%','%token%','%key%'])
        or k::text ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' or lower(v::text) like any (array ['%pass%', '%secret%','%token%','%key%']) or v::text ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]'
    )
    select
      c.id as resource,
      case
        when c.outputs is null then 'ok'
        when s.id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when c.outputs is null then title || ' has no outputs.'
        when s.id is null then title || ' no secrets found in outputs.'
        else title || ' has secrets in outputs.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_cloudformation_stack as c
      left join stack_with_secrets as s on c.id = s.id;
  EOQ
}

query "cloudformation_stack_notifications_enabled" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when jsonb_array_length(notification_arns) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(notification_arns) > 0 then title || ' notifications enabled.'
        else title || ' notifications disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudformation_stack;
  EOQ
}

query "cloudformation_stack_rollback_enabled" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when not disable_rollback then 'ok'
        else 'alarm'
      end as status,
      case
        when not disable_rollback then title || ' rollback enabled.'
        else title || ' rollback disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudformation_stack;
  EOQ
}

query "cloudformation_stack_termination_protection_enabled" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when enable_termination_protection then 'ok'
        else 'alarm'
      end as status,
      case
        when enable_termination_protection then title || ' termination protection enabled.'
        else title || ' termination protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudformation_stack;
  EOQ
}
