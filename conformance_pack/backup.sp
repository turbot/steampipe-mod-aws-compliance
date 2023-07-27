locals {
  conformance_pack_backup_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Backup"
  })
}

control "backup_recovery_point_manual_deletion_disabled" {
  title       = "Backup recovery points manual deletion should be disabled"
  description = "Checks if a backup vault has an attached resource-based policy which prevents deletion of recovery points. The rule is non compliant if the Backup Vault does not have resource-based policies or has policies without a suitable 'Deny' statement."
  query       = query.backup_recovery_point_manual_deletion_disabled

  tags = merge(local.conformance_pack_backup_common_tags, {
    cisa_cyber_essentials                  = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "backup_plan_min_retention_35_days" {
  title       = "Backup plan min frequency and min retention check"
  description = "Checks if a backup plan has a backup rule that satisfies the required frequency and retention period(35 Days). The rule is non compliant if recovery points are not created at least as often as the specified frequency or expire before the specified period."
  query       = query.backup_plan_min_retention_35_days

  tags = merge(local.conformance_pack_backup_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "backup_recovery_point_encryption_enabled" {
  title       = "Backup recovery points should be encrypted"
  description = "Ensure if a recovery point is encrypted. The rule is non compliant if the recovery point is not encrypted."
  query       = query.backup_recovery_point_encryption_enabled

  tags = merge(local.conformance_pack_backup_common_tags, {
    cisa_cyber_essentials                  = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "backup_recovery_point_min_retention_35_days" {
  title       = "Backup recovery points should not expire before retention period"
  description = "Ensure a recovery point expires no earlier than after the specified period. The rule is non-compliant if the recovery point has a retention point less than 35 days."
  query       = query.backup_recovery_point_min_retention_35_days

  tags = merge(local.conformance_pack_backup_common_tags, {
    cisa_cyber_essentials                  = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "backup_plan_region_configured" {
  title       = "Backup plan should exist in a region"
  description = "Ensure that there exists at least one backup plan in a region. The rule is non-compliant if there are no backup plans in a region."
  query       = query.backup_plan_region_configured

  tags = merge(local.conformance_pack_backup_common_tags, {
    other_checks = "true"
  })
}

control "backup_vault_region_configured" {
  title       = "Backup vaults should exist in a region"
  description = "Ensure that there exists at least one backup vault in a region. The rule is non-compliant if there are no backup vaults in a region."
  query       = query.backup_vault_region_configured

  tags = merge(local.conformance_pack_backup_common_tags, {
    other_checks = "true"
  })
}

control "backup_report_plan_configured" {
  title       = "Backup report plan should exist in a region where backup plan is enabled"
  description = "Ensure that there is a minimum of one backup report plan in each region. The rule will be considered non-compliant if a region with backup plans does not have any backup report plans."
  query       = query.backup_report_plan_configured

  tags = merge(local.conformance_pack_backup_common_tags, {
    other_checks = "true"
  })
}

query "backup_recovery_point_manual_deletion_disabled" {
  sql = <<-EOQ
    with recovery_point_manual_deletion_disabled as (
      select
        arn
      from
        aws_backup_vault,
        jsonb_array_elements(policy -> 'Statement') as s
      where
        s ->> 'Effect' = 'Deny' and
        s -> 'Action' @> '["backup:DeleteRecoveryPoint","backup:UpdateRecoveryPointLifecycle","backup:PutBackupVaultAccessPolicy"]'
        and s ->> 'Resource' = '*'
      group by
        arn
    )
    select
      v.arn as resource,
      case
        when d.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when d.arn is not null then v.title || ' recovery point manual deletion disabled.'
        else v.title || ' recovery point manual deletion not disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "v.")}
    from
      aws_backup_vault as v
      left join recovery_point_manual_deletion_disabled as d on v.arn = d.arn;
  EOQ
}

query "backup_plan_min_retention_35_days" {
  sql = <<-EOQ
    with all_plans as (
      select
        arn,
        r as Rules,
        title,
        region,
        account_id,
        _ctx
      from
        aws_backup_plan,
        jsonb_array_elements(backup_plan -> 'Rules') as r
    )
    select
      -- The resource ARN can be duplicate as we are checking all the associated rules to the backup-plan
      -- Backup plans are composed of one or more backup rules.
      -- https://docs.aws.amazon.com/aws-backup/latest/devguide/creating-a-backup-plan.html
      r.arn as resource,
      case
        when r.Rules is null then 'alarm'
        when r.Rules ->> 'Lifecycle' is null then 'ok'
        when (r.Rules -> 'Lifecycle' ->> 'DeleteAfterDays')::int >= 35 then 'ok'
        else 'alarm'
      end as status,
      case
        when r.Rules is null then r.title || ' retention period not set.'
        when r.Rules ->> 'Lifecycle' is null then (r.Rules ->> 'RuleName') || ' retention period set to never expire.'
        else (r.Rules ->> 'RuleName') || ' retention period set to ' || (r.Rules -> 'Lifecycle' ->> 'DeleteAfterDays') || ' days.'
      end as reason
      ${local.common_dimensions_sql}
    from
      all_plans as r;
  EOQ
}

query "backup_recovery_point_encryption_enabled" {
  sql = <<-EOQ
    select
      recovery_point_arn as resource,
      case
        when is_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when is_encrypted then recovery_point_arn || ' encryption enabled.'
        else recovery_point_arn || ' encryption disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_backup_recovery_point;
  EOQ
}

query "backup_recovery_point_min_retention_35_days" {
  sql = <<-EOQ
    select
      recovery_point_arn as resource,
      case
        when (lifecycle -> 'DeleteAfterDays') is null then 'ok'
        when (lifecycle -> 'DeleteAfterDays')::int >= 35 then 'ok'
        else 'alarm'
      end as status,
      case
        when (lifecycle -> 'DeleteAfterDays') is null then split_part(recovery_point_arn, ':', -1) || ' retention period set to never expire.'
        else split_part(recovery_point_arn, ':', -1) || ' recovery point has a retention period of ' || (lifecycle -> 'DeleteAfterDays')::int || ' days.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_backup_recovery_point;
  EOQ
}

query "backup_plan_region_configured" {
  sql = <<-EOQ
    with count_plans as (
      select
        region,
        account_id,
        count(*) as count
      from
        aws_backup_plan
      group by
        region,
        account_id
    )
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when cp.count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when cp.count > 0 then cp.count || ' backup plan(s) exist in region ' || r.region || '.'
        else 'No backup plans exist in region ' || r.region || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join count_plans as cp on r.account_id = cp.account_id and r.region = cp.region;
  EOQ
}

query "backup_vault_region_configured" {
  sql = <<-EOQ
    with count_vaults as (
      select
        region,
        account_id,
        count(*) as count
      from
        aws_backup_vault
      group by
        region,
        account_id
    )
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when v.count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when v.count > 0 then v.count || ' backup vault(s) exist in region ' || r.region || '.'
        else 'No backup vault exists in region ' || r.region || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join count_vaults as v on r.account_id = v.account_id and r.region = v.region;
  EOQ
}

query "backup_report_plan_configured" {
  sql = <<-EOQ
    with backup_plan_configured_regions as (
      select
        distinct region,
        account_id
      from
        aws_backup_plan
      group by
        region,
        account_id
    ), backup_report_plan_configured as  (
      select
        distinct region,
        account_id
      from
        aws_backup_report_plan
      group by
        region,
        account_id
    )
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when cp.region is not null and rp.region is not null then 'ok'
        when cp.region is not null and rp.region is null then 'alarm'
        else 'info'
      end as status,
      case
        when cp.region is not null and rp.region is not null then 'Backup report plan(s) exist in region ' || r.region || '.'
        when cp.region is not null and rp.region is null then 'No backup report plan(s) exist in region ' || r.region || '.'
        else 'No backup plan(s) configured in region ' || r.region || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join backup_plan_configured_regions as cp on r.account_id = cp.account_id and r.region = cp.region
      left join backup_report_plan_configured as rp on r.account_id = rp.account_id and r.region = rp.region;
  EOQ
}