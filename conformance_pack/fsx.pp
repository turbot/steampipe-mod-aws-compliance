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
    acsc_essential_eight                   = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "fsx_file_system_copy_tags_to_backup_and_volume_enabled" {
  title       = "FSx for OpenZFS file systems should be configured to copy tags to backups and volumes"
  description = "This control checks if an Amazon FSx for OpenZFS file system is configured to copy tags to backups and volumes. The control fails if the OpenZFS file system isn't configured to copy tags to backups and volumes."
  query       = query.fsx_file_system_copy_tags_to_backup_and_volume_enabled

  tags = local.conformance_pack_fsx_common_tags
}

control "fsx_lustre_file_system_copy_tags_to_backup_enabled" {
  title         = "FSx for Lustre file systems should be configured to copy tags to backups"
  description   = "This control checks whether an Amazon FSx for Lustre file system is configured to copy tags to backups and volumes. The control fails if the Lustre file system isn't configured to copy tags to backups and volumes."
  query         = query.fsx_lustre_file_system_copy_tags_to_backup_enabled

  tags = local.conformance_pack_fsx_common_tags
}

control "fsx_openzfs_file_system_multi_az_deployment_enabled" {
  title         = "FSx for OpenZFS file systems should be configured for Multi-AZ deployment"
  description   = "This control checks whether an Amazon FSx for OpenZFS file system is configured to use the multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use the Multi-AZ deployment type."
  query         = query.fsx_openzfs_file_system_multi_az_deployment_enabled

  tags = local.conformance_pack_fsx_common_tags
}

control "fsx_netapp_ontap_file_system_multi_az_deployment_enabled" {
  title         = "FSx for NetApp ONTAP file systems should be configured for Multi-AZ deployment"
  description   = "This control checks whether an Amazon FSx for NetApp ONTAP file system is configured to use a multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use a Multi-AZ deployment type. You can optionally specify a list of deployment types to include in the evaluation."
  query         = query.fsx_netapp_ontap_file_system_multi_az_deployment_enabled

  tags = local.conformance_pack_fsx_common_tags
}

control "fsx_windows_file_system_multi_az_deployment_enabled" {
  title         = "FSx for Windows File Server file systems should be configured for Multi-AZ deployment"
  description   = "This control checks whether an Amazon FSx for Windows File Server file system is configured to use the multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use the Multi-AZ deployment type."
  query         = query.fsx_windows_file_system_multi_az_deployment_enabled

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

query "fsx_lustre_file_system_copy_tags_to_backup_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when file_system_type <> 'LUSTRE' then 'skip'
        when (lustre_configuration ->> 'CopyTagsToBackups')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when file_system_type <> 'LUSTRE' then title || ' is of ' || file_system_type || ' type file system.'
        when (lustre_configuration ->> 'CopyTagsToBackups')::bool then title || ' copy tags to backup enabled.'
        else title || ' copy tags to backup disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_fsx_file_system;
  EOQ
}

query "fsx_openzfs_file_system_multi_az_deployment_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when file_system_type <> 'OPENZFS' then 'skip'
        when open_zfs_configuration ->> 'DeploymentType' = 'MULTI_AZ_1' then 'ok'
        else 'alarm'
      end as status,
      case
        when file_system_type <> 'OPENZFS' then title || ' is of ' || file_system_type || ' type file system.'
        when open_zfs_configuration ->> 'DeploymentType' = 'MULTI_AZ_1' then title || ' Multi-AZ deployment enabled.'
        else title || ' Multi-AZ deployment disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_fsx_file_system;
  EOQ
}

query "fsx_netapp_ontap_file_system_multi_az_deployment_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when file_system_type <> 'ONTAP' then 'skip'
        when (ontap_configuration ->> 'DeploymentType') in ('MULTI_AZ_1', 'MULTI_AZ_2') then 'ok'
        else 'alarm'
      end as status,
      case
        when file_system_type <> 'ONTAP' then title || ' is of ' || file_system_type || ' type file system.'
        when (ontap_configuration ->> 'DeploymentType') in ('MULTI_AZ_1', 'MULTI_AZ_2') then title || ' Multi-AZ deployment enabled.'
        else title || ' Multi-AZ deployment disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_fsx_file_system;
  EOQ
}

query "fsx_windows_file_system_multi_az_deployment_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when file_system_type <> 'WINDOWS' then 'skip'
        when (windows_configuration ->> 'DeploymentType') = 'MULTI_AZ_1' then 'ok'
        else 'alarm'
      end as status,
      case
        when file_system_type <> 'WINDOWS' then title || ' is of ' || file_system_type || ' type file system.'
        when (windows_configuration ->> 'DeploymentType') = 'MULTI_AZ_1' then title || ' Multi-AZ deployment enabled.'
        else title || ' Multi-AZ deployment disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_fsx_file_system;
  EOQ
}