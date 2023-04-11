locals {
  conformance_pack_fsx_common_tags = {
    service = "AWS/FSx"
  }
}

control "fsx_file_system_protected_by_backup_plan" {
  title       = "FSx file system should be protected by backup plan"
  description = "Checks if Amazon FSx File Systems are protected by a backup plan. The rule is non compliant if the Amazon FSx File System is not covered by a backup plan."
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
