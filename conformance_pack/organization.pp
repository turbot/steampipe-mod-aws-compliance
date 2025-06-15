locals {
  conformance_pack_organization_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Organizations"
  })
}

control "organizational_tag_policies_enabled" {
  title       = "Ensure Tag Policies are enabled"
  description = "Tag policies help you standardize tags on all tagged resources across your organization"
  query       = query.organizational_tag_policies_enabled

  tags = local.conformance_pack_organization_common_tags
}

query "organizational_tag_policies_enabled" {
  sql = <<-EOQ
    with tag_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        type = 'TAG_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Organizational tag policies are enabled.'
        else 'Organizational tag policies are disabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      tag_policy_enabled;
  EOQ
}

control "organizational_guardduty_policy_enabled" {
  title       = "Ensure GuardDuty organization policy is enabled"
  description = "Checks if GuardDuty org-level policy is enabled in AWS Organization."
  query       = query.organizational_guardduty_policy_enabled
  tags        = local.conformance_pack_organization_common_tags
}

query "organizational_guardduty_policy_enabled" {
  sql = <<-EOQ
    with guardduty_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        name ilike '%GuardDuty%'
        and type = 'SERVICE_CONTROL_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'GuardDuty org policy is enabled.'
        else 'GuardDuty org policy is NOT enabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      guardduty_policy_enabled;
  EOQ
}

control "organizational_inspector_policy_enabled" {
  title       = "Ensure Inspector organization policy is enabled"
  description = "Checks if Inspector org-level policy is enabled in AWS Organization."
  query       = query.organizational_inspector_policy_enabled
  tags        = local.conformance_pack_organization_common_tags
}

query "organizational_inspector_policy_enabled" {
  sql = <<-EOQ
    with inspector_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        name ilike '%Inspector%'
        and type = 'SERVICE_CONTROL_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Inspector org policy is enabled.'
        else 'Inspector org policy is NOT enabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      inspector_policy_enabled;
  EOQ
}

control "organizational_auditmanager_policy_enabled" {
  title       = "Ensure Audit Manager organization policy is enabled"
  description = "Checks if Audit Manager org-level policy is enabled in AWS Organization."
  query       = query.organizational_auditmanager_policy_enabled
  tags        = local.conformance_pack_organization_common_tags
}

query "organizational_auditmanager_policy_enabled" {
  sql = <<-EOQ
    with auditmanager_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        name ilike '%Audit Manager%'
        and type = 'SERVICE_CONTROL_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Audit Manager org policy is enabled.'
        else 'Audit Manager org policy is NOT enabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      auditmanager_policy_enabled;
  EOQ
}

control "organizational_backup_policy_enabled" {
  title       = "Ensure Backup organization policy is enabled"
  description = "Checks if Backup org-level policy is enabled in AWS Organization."
  query       = query.organizational_backup_policy_enabled
  tags        = local.conformance_pack_organization_common_tags
}

query "organizational_backup_policy_enabled" {
  sql = <<-EOQ
    with backup_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        name ilike '%Backup%'
        and type = 'SERVICE_CONTROL_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Backup org policy is enabled.'
        else 'Backup org policy is NOT enabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      backup_policy_enabled;
  EOQ
}

control "organizational_controltower_policy_enabled" {
  title       = "Ensure Control Tower organization policy is enabled"
  description = "Checks if Control Tower org-level policy is enabled in AWS Organization."
  query       = query.organizational_controltower_policy_enabled
  tags        = local.conformance_pack_organization_common_tags
}

query "organizational_controltower_policy_enabled" {
  sql = <<-EOQ
    with controltower_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        name ilike '%Control Tower%'
        and type = 'SERVICE_CONTROL_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Control Tower org policy is enabled.'
        else 'Control Tower org policy is NOT enabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      controltower_policy_enabled;
  EOQ
}

control "organizational_config_policy_enabled" {
  title       = "Ensure Config organization policy is enabled"
  description = "Checks if Config org-level policy is enabled in AWS Organization."
  query       = query.organizational_config_policy_enabled
  tags        = local.conformance_pack_organization_common_tags
}

query "organizational_config_policy_enabled" {
  sql = <<-EOQ
    with config_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        name ilike '%Config%'
        and type = 'SERVICE_CONTROL_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Config org policy is enabled.'
        else 'Config org policy is NOT enabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      config_policy_enabled;
  EOQ
}

control "organizational_securityhub_policy_enabled" {
  title       = "Ensure Security Hub organization policy is enabled"
  description = "Checks if Security Hub org-level policy is enabled in AWS Organization."
  query       = query.organizational_securityhub_policy_enabled
  tags        = local.conformance_pack_organization_common_tags
}

query "organizational_securityhub_policy_enabled" {
  sql = <<-EOQ
    with securityhub_policy_enabled as (
      select
        _ctx,
        account_id,
        count(*) as count
      from
        aws_organizations_policy
      where
        name ilike '%Security Hub%'
        and type = 'SERVICE_CONTROL_POLICY'
      group by
        _ctx,
        account_id
    )
    select
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count > 0 then 'Security Hub org policy is enabled.'
        else 'Security Hub org policy is NOT enabled.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      securityhub_policy_enabled;
  EOQ
}