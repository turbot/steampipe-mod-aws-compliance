locals {
  conformance_pack_efs_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EFS"
  })
}

control "efs_file_system_encrypt_data_at_rest" {
  title       = "EFS file system encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic File System (EFS)."
  query       = query.efs_file_system_encrypt_data_at_rest

  tags = merge(local.conformance_pack_efs_common_tags, {
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
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

control "efs_file_system_in_backup_plan" {
  title       = "EFS file systems should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon Elastic File System (Amazon EFS) file systems are a part of an AWS Backup plan."
  query       = query.efs_file_system_automatic_backups_enabled

  tags = merge(local.conformance_pack_efs_common_tags, {
    cis_controls_v8_ig1                    = "true"
    ffiec                                  = "true"
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

control "efs_file_system_protected_by_backup_plan" {
  title       = "EFS file systems should be protected by backup plan"
  description = "Ensure if Amazon Elastic File System (Amazon EFS) File Systems are protected by a backup plan. The rule is non compliant if the EFS File System is not covered by a backup plan."
  query       = query.efs_file_system_protected_by_backup_plan

  tags = merge(local.conformance_pack_efs_common_tags, {
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

control "efs_file_system_encrypted_with_cmk" {
  title       = "EFS file systems should be encrypted with CMK"
  description = "Ensure Amazon Elastic File Systems (Amazon EFS) are encrypted using CMK. The rule is non compliant if the EFS File System is not encrypted using CMK."
  query       = query.efs_file_system_encrypted_with_cmk

  tags = merge(local.conformance_pack_efs_common_tags, {
    cisa_cyber_essentials = "true"
    other_checks          = "true"
  })
}

control "efs_file_system_enforces_ssl" {
  title       = "EFS file systems should enforce SSL"
  description = "To help protect data in transit, ensure that your EFS file systems require requests to use Secure Socket Layer (SSL)."
  query       = query.efs_file_system_enforces_ssl

  tags = merge(local.conformance_pack_efs_common_tags, {
    other_checks = "true"
  })
}

control "efs_access_point_enforce_user_identity" {
  title       = "EFS access points should enforce a user identity"
  description = "This control checks whether Amazon EFS access points are configured to enforce a user identity. This control fails if a POSIX user identity is not defined while creating the EFS access point."
  query       = query.efs_access_point_enforce_user_identity

  tags = merge(local.conformance_pack_efs_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "efs_access_point_enforce_root_directory" {
  title       = "EFS access points should enforce a root directory"
  description = "This control checks if Amazon EFS access points are configured to enforce a root directory. The control fails if the value of Path is set to / (the default root directory of the file system)."
  query       = query.efs_access_point_enforce_root_directory

  tags = merge(local.conformance_pack_efs_common_tags, {
    nist_csf = "true"
  })
}

control "efs_file_system_restrict_public_access" {
  title       = "EFS file systems should restrict public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS EFS file systems cannot be publicly accessed."
  query       = query.efs_file_system_restrict_public_access

  tags = merge(local.conformance_pack_efs_common_tags, {
    other_checks = "true"
  })
}

query "efs_file_system_encrypt_data_at_rest" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when encrypted then title || ' encrypted at rest.'
        else title || ' not encrypted at rest.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_efs_file_system;
  EOQ
}

query "efs_file_system_automatic_backups_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when automatic_backups = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when automatic_backups = 'enabled' then title || ' automatic backups enabled.'
        else title || ' automatic backups not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_efs_file_system;
  EOQ
}

query "efs_file_system_protected_by_backup_plan" {
  sql = <<-EOQ
    with backup_protected_file_system as (
      select
        resource_arn as arn
      from
        aws_backup_protected_resource as b
      where
        resource_type = 'EFS'
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
      aws_efs_file_system as f
      left join backup_protected_file_system as b on f.arn = b.arn;
  EOQ
}

query "efs_file_system_encrypted_with_cmk" {
  sql = <<-EOQ
    with encrypted_fs as (
      select
        fs.arn as arn,
        key_manager
      from
        aws_efs_file_system as fs
        left join aws_kms_key as k on fs.kms_key_id = k.arn
      where
        enabled
    )
    select
      f.arn as resource,
      case
        when not encrypted then 'alarm'
        when encrypted and e.key_manager = 'CUSTOMER' then 'ok'
        else 'alarm'
      end as status,
      case
        when not encrypted then title || ' not encrypted.'
        when encrypted and e.key_manager = 'CUSTOMER' then title || ' encrypted with CMK.'
        else title || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_efs_file_system as f
      left join encrypted_fs as e on f.arn = e.arn;
  EOQ
}

query "efs_file_system_enforces_ssl" {
  sql = <<-EOQ
    with ssl_ok as (
      select
        distinct name,
        arn,
        'ok' as status
      from
        aws_efs_file_system,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'AWS') as p,
        jsonb_array_elements_text(s -> 'Action') as a,
        jsonb_array_elements_text(
          s -> 'Condition' -> 'Bool' -> 'aws:securetransport'
        ) as ssl
      where
        p = '*'
        and s ->> 'Effect' = 'Deny'
        and ssl :: bool = false
    )
    select
      f.arn as resource,
      case
        when ok.status = 'ok' then 'ok'
        else 'alarm'
      end as status,
      case
        when ok.status = 'ok' then f.title || ' policy enforces HTTPS.'
        else f.title || ' policy does not enforce HTTPS.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "f.")}
    from
      aws_efs_file_system as f
      left join ssl_ok as ok on ok.name = f.name;
  EOQ
}

query "efs_access_point_enforce_user_identity" {
  sql = <<-EOQ
    select
      access_point_arn as resource,
      case
        when posix_user is null then 'alarm'
        else 'ok'
      end as status,
      case
        when posix_user is null then title || ' does not enforce a user identity.'
        else title || ' enforces a user identity.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_efs_access_point;
  EOQ
}

query "efs_access_point_enforce_root_directory" {
  sql = <<-EOQ
    select
      access_point_arn as resource,
      case
        when root_directory ->> 'Path'= '/' then 'alarm'
        else 'ok'
      end as status,
      case
        when root_directory ->> 'Path'= '/' then title || ' not configured to enforce a root directory.'
        else title || ' configured to enforce a root directory.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_efs_access_point;
  EOQ
}

query "efs_file_system_restrict_public_access" {
  sql = <<-EOQ
    with wildcard_action_policies as (
      select
        arn,
        count(*) as statements_num
      from
        aws_efs_file_system,
        jsonb_array_elements(policy_std -> 'Statement') as s
      where
        s ->> 'Effect' = 'Allow'
        and (
          ( s -> 'Principal' -> 'AWS') = '["*"]'
          or s ->> 'Principal' = '*'
        )
      group by
        arn
    )
    select
      f.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when p.arn is null then title || ' does not allow public access.'
        else title || ' contains ' || coalesce(p.statements_num, 0) ||
        ' statements that allows public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "f.")}
    from
      aws_efs_file_system as f
      left join wildcard_action_policies as p on p.arn = f.arn;
  EOQ
}
