locals {
  conformance_pack_fsx_common_tags = {
    service = "AWS/FSx"
  }
}

control "fsx_file_system_protected_by_backup_plan" {
  title       = "FSx file system should be protected by backup plan"
  description = "Checks if AWS FSx File Systems are protected by a backup plan. The rule is non-compliant if the AWS FSx File System is not covered by a backup plan."
  query       = query.fsx_file_system_protected_by_backup_plan

  tags = merge(local.conformance_pack_fsx_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
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

control "fsx_file_system_copy_tags_to_backup_and_volume_enabled" {
  title         = "FSx for OpenZFS file systems should be configured to copy tags to backups and volumes"
  description   = "This control checks if an Amazon FSx for OpenZFS file system is configured to copy tags to backups and volumes. The control fails if the OpenZFS file system isn't configured to copy tags to backups and volumes."
  query         = query.fsx_file_system_copy_tags_to_backup_and_volume_enabled

  tags = local.conformance_pack_fsx_common_tags
}

query "fsx_file_system_protected_by_backup_plan" {
  sql = <<-EOQ
    with backup_protected_fsx_file_system as (
      select
        resource_arn as arn
      from
        aws_backup_protected_resource as b
      where
        resource_type = 'FSx'
    )
    select
      f.arn as resource,
      case
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is not null then f.title || ' is protected by backup plan.'
        else f.title || ' is not protected by backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "f.")}
    from
      aws_fsx_file_system as f
      left join backup_protected_fsx_file_system as b on f.arn = b.arn;
  EOQ
}

query "fsx_file_system_copy_tags_to_backup_and_volume_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when file_system_type <> 'OPENZFS' then 'skip'
        when (open_zfs_configuration ->> 'CopyTagsToBackups')::bool and (open_zfs_configuration ->> 'CopyTagsToVolumes')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when file_system_type <> 'OPENZFS' then title || ' is of ' || file_system_type || ' type file system.'
        when (open_zfs_configuration ->> 'CopyTagsToBackups')::bool and (open_zfs_configuration ->> 'CopyTagsToVolumes')::bool then title || ' copy tags to backup and volume enabled.'
        when (open_zfs_configuration ->> 'CopyTagsToBackups')::bool then title || ' copy tags to backup enabled but disabled for volume.'
        when (open_zfs_configuration ->> 'CopyTagsToVolumes')::bool then title || ' copy tags to volume enabled but disabled for backup.'
        else title || ' copy tags to backup and volume disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_fsx_file_system;
  EOQ
}
