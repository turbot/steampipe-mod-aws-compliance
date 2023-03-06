locals {
  conformance_pack_cloudformation_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFormation"
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
      -- Required Columns
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
      -- Additional Dimensions
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
      -- Required Columns
      id as resource,
      case
        when jsonb_array_length(notification_arns) > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when jsonb_array_length(notification_arns) > 0 then title || ' notifications enabled.'
        else title || ' notifications disabled.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudformation_stack;
  EOQ
}

query "cloudformation_stack_rollback_enabled" {
  sql = <<-EOQ
    select
      -- Required Columns
      id as resource,
      case
        when not disable_rollback then 'ok'
        else 'alarm'
      end as status,
      case
        when not disable_rollback then title || ' rollback enabled.'
        else title || ' rollback disabled.'
      end as reason
      -- Additional Dimensions
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cloudformation_stack;
  EOQ
}
