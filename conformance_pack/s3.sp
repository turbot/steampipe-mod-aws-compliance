locals {
  conformance_pack_s3_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/S3"
  })
}

control "s3_bucket_cross_region_replication_enabled" {
  title       = "S3 bucket cross-region replication should be enabled"
  description = "Amazon Simple Storage Service (Amazon S3) Cross-Region Replication (CRR) supports maintaining adequate capacity and availability."
  query       = query.s3_bucket_cross_region_replication_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
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

control "s3_bucket_default_encryption_enabled" {
  title       = "S3 bucket default encryption should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your Amazon Simple Storage Service (Amazon S3) buckets."
  query       = query.s3_bucket_default_encryption_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_moderate_rev_4                 = "true"
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

control "s3_bucket_enforces_ssl" {
  title       = "S3 buckets should enforce SSL"
  description = "To help protect data in transit, ensure that your Amazon Simple Storage Service (Amazon S3) buckets require requests to use Secure Socket Layer (SSL)."
  query       = query.s3_bucket_enforces_ssl

  tags = merge(local.conformance_pack_s3_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
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

control "s3_bucket_logging_enabled" {
  title       = "S3 bucket logging should be enabled"
  description = "Amazon Simple Storage Service (Amazon S3) server access logging provides a method to monitor the network for potential cybersecurity events."
  query       = query.s3_bucket_logging_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
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

control "s3_bucket_object_lock_enabled" {
  title       = "S3 bucket object lock should be enabled"
  description = "Ensure that your Amazon Simple Storage Service (Amazon S3) bucket has lock enabled, by default."
  query       = query.s3_bucket_object_lock_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    soc_2                                  = "true"
  })
}

control "s3_bucket_restrict_public_read_access" {
  title       = "S3 buckets should prohibit public read access"
  description = "Manage access to resources in the AWS Cloud by only allowing authorized users, processes, and devices access to Amazon Simple Storage Service (Amazon S3) buckets."
  query       = query.s3_bucket_restrict_public_read_access

  tags = merge(local.conformance_pack_s3_common_tags, {
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
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

control "s3_bucket_restrict_public_write_access" {
  title       = "S3 buckets should prohibit public write access"
  description = "Manage access to resources in the AWS Cloud by only allowing authorized users, processes, and devices access to Amazon Simple Storage Service (Amazon S3) buckets."
  query       = query.s3_bucket_restrict_public_write_access

  tags = merge(local.conformance_pack_s3_common_tags, {
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
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

control "s3_bucket_versioning_enabled" {
  title       = "S3 bucket versioning should be enabled"
  description = "Amazon Simple Storage Service (Amazon S3) bucket versioning helps keep multiple variants of an object in the same Amazon S3 bucket."
  query       = query.s3_bucket_versioning_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
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

control "s3_bucket_static_website_hosting_disabled" {
  title       = "S3 buckets static website hosting should be disabled"
  description = "Enabling static website on a S3 bucket requires to grant public read access to the bucket. There is a potential risk of exposure when you turn off block public access settings to make your bucket public. This is recommend to not configure static website on S3 bucket."
  query       = query.s3_bucket_static_website_hosting_disabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    other_checks = "true"
  })
}

control "s3_public_access_block_account" {
  title       = "S3 public access should be blocked at account level"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Simple Storage Service (Amazon S3) buckets cannot be publicly accessed."
  query       = query.s3_public_access_block_account

  tags = merge(local.conformance_pack_s3_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "s3_public_access_block_bucket_account" {
  title       = "S3 public access should be blocked at account and bucket levels"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Simple Storage Service (Amazon S3) buckets cannot be publicly accessed."
  query       = query.s3_public_access_block_bucket_account

  tags = merge(local.conformance_pack_s3_common_tags, {
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    rbi_cyber_security     = "true"
  })
}

control "s3_bucket_default_encryption_enabled_kms" {
  title       = "S3 bucket default encryption should be enabled with KMS"
  description = "To help protect data at rest, ensure encryption is enabled for your Amazon Simple Storage Service (Amazon S3) buckets."
  query       = query.s3_bucket_default_encryption_enabled_kms

  tags = merge(local.conformance_pack_s3_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
  })
}

control "s3_public_access_block_bucket" {
  title       = "S3 public access should be blocked at bucket levels"
  description = "Ensure if Amazon Simple Storage Service (Amazon S3) buckets are publicly accessible. This rule is non compliant if an Amazon S3 bucket is not listed in the excludedPublicBuckets parameter and bucket level settings are public."
  query       = query.s3_public_access_block_bucket

  tags = merge(local.conformance_pack_s3_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
  })
}

control "s3_bucket_policy_restricts_cross_account_permission_changes" {
  title       = "Amazon S3 permissions granted to other AWS accounts in bucket policies should be restricted"
  description = "This control checks whether the S3 bucket policy prevents principals from other AWS accounts from performing denied actions on resources in the S3 bucket."
  query       = query.s3_bucket_policy_restricts_cross_account_permission_changes

  tags = merge(local.conformance_pack_s3_common_tags, {
    nist_csf = "true"
  })
}

control "s3_bucket_object_logging_enabled" {
  title       = "S3 buckets object logging should be enabled"
  description = "Object-Level logging saves events in JSON format in CloudTrail. This is recommended from a security best practice perspective for buckets that contain sensitive data."
  query       = query.s3_bucket_object_logging_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    other_checks = "true"
  })
}

control "s3_bucket_policy_restrict_public_access" {
  title       = "S3 bucket policy should prohibit public access"
  description = "This control checks that the access granted by the S3 bucket is restricted by any of the principals, federated users, service principals, IP addresses, or VPCs that you provide. The rule is compliant if a bucket policy is not present."
  query       = query.s3_bucket_policy_restrict_public_access

  tags = merge(local.conformance_pack_s3_common_tags, {
    cis_controls_v8_ig1                    = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    soc_2                                  = "true"
  })
}

control "s3_bucket_lifecycle_policy_enabled" {
  title       = "S3 buckets should have lifecycle policies configured"
  description = "This control checks if Amazon Simple Storage Service (Amazon S3) buckets have lifecycle policy configured. This rule fails if Amazon S3 lifecycle policy is not enabled."
  query       = query.s3_bucket_lifecycle_policy_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    gxp_21_cfr_part_11 = "true"
    nist_csf           = "true"
    pci_dss_v321       = "true"
    soc_2              = "true"
  })
}

control "s3_bucket_versioning_and_lifecycle_policy_enabled" {
  title       = "S3 buckets with versioning enabled should have lifecycle policies configured"
  description = "This control checks if Amazon Simple Storage Service (Amazon S3) version enabled buckets have lifecycle policy configured. This rule fails if Amazon S3 lifecycle policy is not enabled."
  query       = query.s3_bucket_versioning_and_lifecycle_policy_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    gxp_21_cfr_part_11 = "true"
    nist_csf           = "true"
    pci_dss_v321       = "true"
    soc_2              = "true"
  })
}

control "s3_bucket_event_notifications_enabled" {
  title       = "S3 buckets should have event notifications enabled"
  description = "This control checks whether S3 Event Notifications are enabled on an Amazon S3 bucket. This control fails if S3 Event Notifications are not enabled on a bucket."
  severity    = "medium"
  query       = query.s3_bucket_event_notifications_enabled

  tags = merge(local.conformance_pack_s3_common_tags, {
    nist_csf = "true"
    soc_2    = "true"
  })
}

control "s3_bucket_acls_should_prohibit_user_access" {
  title       = "S3 buckets access control lists (ACLs) should not be used to manage user access to buckets"
  description = "This control checks whether Amazon S3 buckets provide user permissions via ACLs. The control fails if ACLs are configured for managing user access on S3 buckets."
  query       = query.s3_bucket_acls_should_prohibit_user_access

  tags = merge(local.conformance_pack_s3_common_tags, {
    nist_csf = "true"
  })
}

query "s3_bucket_cross_region_replication_enabled" {
  sql = <<-EOQ
    with bucket_with_replication as (
      select
        name,
        r ->> 'Status' as rep_status
      from
        aws_s3_bucket,
        jsonb_array_elements(replication -> 'Rules' ) as r
    )
    select
      b.arn as resource,
      case
        when b.name = r.name and r.rep_status = 'Enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when b.name = r.name and r.rep_status = 'Enabled' then b.title || ' enabled with cross-region replication.'
        else b.title || ' not enabled with cross-region replication.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_s3_bucket b
      left join bucket_with_replication r on b.name = r.name;
  EOQ
}

query "s3_bucket_default_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when server_side_encryption_configuration is not null then 'ok'
        else 'alarm'
      end status,
      case
        when server_side_encryption_configuration is not null then name || ' default encryption enabled.'
        else name || ' default encryption disabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}

query "s3_bucket_enforces_ssl" {
  sql = <<-EOQ
    with ssl_ok as (
      select
        distinct name,
        arn,
        'ok' as status
      from
        aws_s3_bucket,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'AWS') as p,
        jsonb_array_elements_text(s -> 'Action') as a,
        jsonb_array_elements_text(s -> 'Resource') as r,
        jsonb_array_elements_text(
          s -> 'Condition' -> 'Bool' -> 'aws:securetransport'
        ) as ssl
      where
        p = '*'
        and s ->> 'Effect' = 'Deny'
        and ssl :: bool = false
    )
    select
      b.arn as resource,
      case
        when ok.status = 'ok' then 'ok'
        else 'alarm'
      end status,
      case
        when ok.status = 'ok' then b.name || ' bucket policy enforces HTTPS.'
        else b.name || ' bucket policy does not enforce HTTPS.'
      end reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_s3_bucket as b
      left join ssl_ok as ok on ok.name = b.name;
  EOQ
}

query "s3_bucket_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when logging -> 'TargetBucket' is null then 'alarm'
        else 'ok'
      end as status,
      case
        when logging -> 'TargetBucket' is null then title || ' logging disabled.'
        else title || ' logging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}

query "s3_bucket_object_lock_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when object_lock_configuration is null then 'alarm'
        else 'ok'
      end as status,
      case
        when object_lock_configuration is null then title || ' object lock not enabled.'
        else title || ' object lock enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}

query "s3_bucket_restrict_public_read_access" {
  sql = <<-EOQ
    with public_acl as (
      select
        distinct name
      from
        aws_s3_bucket,
        jsonb_array_elements(acl -> 'Grants') as grants
      where
        (grants -> 'Grantee' ->> 'URI' = 'http://acs.amazonaws.com/groups/global/AllUsers'
        or grants -> 'Grantee' ->> 'URI' = 'http://acs.amazonaws.com/groups/global/AuthenticatedUsers')
        and (
          grants ->> 'Permission' = 'FULL_CONTROL'
          or grants ->> 'Permission' = 'READ_ACP'
          or grants ->> 'Permission' = 'READ'
        )
      ),read_access_policy as (
        select
          distinct name
        from
          aws_s3_bucket,
          jsonb_array_elements(policy_std -> 'Statement') as s,
          jsonb_array_elements_text(s -> 'Action') as action
        where
          s ->> 'Effect' = 'Allow'
          and (
            s -> 'Principal' -> 'AWS' = '["*"]'
            or s ->> 'Principal' = '*'
          )
          and (
            action = '*'
            or action = '*:*'
            or action = 's3:*'
            or action ilike 's3:get%'
            or action ilike 's3:list%'
          )
    )
    select
      b.arn as resource,
      case
        when (block_public_acls or a.name is null) and not bucket_policy_is_public then 'ok'
        when (block_public_acls or a.name is null) and (bucket_policy_is_public and block_public_policy) then 'ok'
        when (block_public_acls or a.name is null) and (bucket_policy_is_public and p.name is null) then 'ok'
        else 'alarm'
      end as status,
      case
        when (block_public_acls or a.name is null) and not bucket_policy_is_public then b.title || ' not publicly readable.'
        when (block_public_acls or a.name is null) and (bucket_policy_is_public and block_public_policy) then b.title || ' not publicly readable.'
        when (block_public_acls or a.name is null) and (bucket_policy_is_public and p.name is null) then  b.title || ' not publicly readable.'
        else b.title || ' publicly readable.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_s3_bucket as b
      left join public_acl as a on b.name = a.name
      left join read_access_policy as p on b.name = p.name;
  EOQ
}

query "s3_bucket_restrict_public_write_access" {
  sql = <<-EOQ
    with public_acl as (
      select
        distinct name
      from
        aws_s3_bucket,
        jsonb_array_elements(acl -> 'Grants') as grants
      where
        (grants -> 'Grantee' ->> 'URI' = 'http://acs.amazonaws.com/groups/global/AllUsers'
        or grants -> 'Grantee' ->> 'URI' = 'http://acs.amazonaws.com/groups/global/AuthenticatedUsers')
        and (
          grants ->> 'Permission' = 'FULL_CONTROL'
          or grants ->> 'Permission' = 'WRITE_ACP'
          or grants ->> 'Permission' = 'WRITE'
        )
    ), write_access_policy as (
        select
          distinct name
        from
          aws_s3_bucket,
          jsonb_array_elements(policy_std -> 'Statement') as s,
          jsonb_array_elements_text(s -> 'Action') as action
        where
          s ->> 'Effect' = 'Allow'
          and (
            s -> 'Principal' -> 'AWS' = '["*"]'
            or s ->> 'Principal' = '*'
          )
          and (
            action = '*'
            or action = '*:*'
            or action = 's3:*'
            or action ilike 's3:put%'
            or action ilike 's3:delete%'
            or action ilike 's3:create%'
            or action ilike 's3:update%'
            or action ilike 's3:replicate%'
            or action ilike 's3:restore%'
          )
    )
    select
      b.arn as resource,
      case
        when (block_public_acls or a.name is null) and not bucket_policy_is_public then 'ok'
        when (block_public_acls or a.name is null) and (bucket_policy_is_public and block_public_policy) then 'ok'
        when bucket_policy_is_public and p.name is null then 'ok'
        else 'alarm'
      end status,
      case
        when (block_public_acls or a.name is null ) and not bucket_policy_is_public then b.title || ' not publicly writable.'
        when (block_public_acls or a.name is null) and (bucket_policy_is_public and block_public_policy) then b.title || ' not publicly writable.'
        when (block_public_acls or a.name is null) and (bucket_policy_is_public and p.name is null) then b.title || ' not publicly writable.'
        else b.title || ' publicly writable.'
      end reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_s3_bucket as b
      left join public_acl as a on b.name = a.name
      left join write_access_policy as p on b.name = p.name;
  EOQ
}

query "s3_bucket_versioning_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when versioning_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when versioning_enabled then name || ' versioning enabled.'
        else name || ' versioning disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}

query "s3_bucket_static_website_hosting_disabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when website_configuration -> 'IndexDocument' ->> 'Suffix' is not null then 'alarm'
        else 'ok'
      end status,
      case
        when website_configuration -> 'IndexDocument' ->> 'Suffix' is not null then name || ' static website hosting enabled.'
        else name || ' static website hosting disabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}

query "s3_public_access_block_account" {
  sql = <<-EOQ
    select
      'arn' || ':' || 'aws' || ':::' || account_id as resource,
      case
        when block_public_acls
          and block_public_policy
          and ignore_public_acls
          and restrict_public_buckets
          then 'ok'
        else 'alarm'
      end as status,
      case
        when block_public_acls
          and block_public_policy
          and ignore_public_acls
          and restrict_public_buckets
          then 'Account level public access blocks enabled.'
        else 'Account level public access blocks not enabled for: ' ||
          concat_ws(', ',
            case when not (block_public_acls ) then 'block_public_acls' end,
            case when not (block_public_policy) then 'block_public_policy' end,
            case when not (ignore_public_acls ) then 'ignore_public_acls' end,
            case when not (restrict_public_buckets) then 'restrict_public_buckets' end
          ) || '.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_s3_account_settings;
  EOQ
}

query "s3_public_access_block_bucket_account" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when (bucket.block_public_acls or s3account.block_public_acls)
          and (bucket.block_public_policy or s3account.block_public_policy)
          and (bucket.ignore_public_acls or s3account.ignore_public_acls)
          and (bucket.restrict_public_buckets or s3account.restrict_public_buckets)
          then 'ok'
        else 'alarm'
      end as status,
      case
        when (bucket.block_public_acls or s3account.block_public_acls)
          and (bucket.block_public_policy or s3account.block_public_policy)
          and (bucket.ignore_public_acls or s3account.ignore_public_acls)
          and (bucket.restrict_public_buckets or s3account.restrict_public_buckets)
          then name || ' all public access blocks enabled.'
        else name || ' not enabled for: ' ||
          concat_ws(', ',
            case when not (bucket.block_public_acls or s3account.block_public_acls) then 'block_public_acls' end,
            case when not (bucket.block_public_policy or s3account.block_public_policy) then 'block_public_policy' end,
            case when not (bucket.ignore_public_acls or s3account.ignore_public_acls) then 'ignore_public_acls' end,
            case when not (bucket.restrict_public_buckets or s3account.restrict_public_buckets) then 'restrict_public_buckets' end
          ) || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "bucket.")}
    from
      aws_s3_bucket as bucket,
      aws_s3_account_settings as s3account
    where
      s3account.account_id = bucket.account_id;
  EOQ
}

query "s3_bucket_default_encryption_enabled_kms" {
  sql = <<-EOQ
    with data as (
      select
        distinct name
      from
        aws_s3_bucket,
        jsonb_array_elements(server_side_encryption_configuration -> 'Rules') as rules
      where
        rules -> 'ApplyServerSideEncryptionByDefault' ->> 'KMSMasterKeyID' is not null
      )
    select
      b.arn as resource,
      case
        when d.name is not null then 'ok'
        else 'alarm'
      end status,
      case
        when d.name is not null then b.name || ' default encryption with KMS enabled.'
        else b.name || ' default encryption with KMS disabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_s3_bucket as b
      left join data as d on b.name = d.name;
  EOQ
}

query "s3_public_access_block_bucket" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when block_public_acls
          and block_public_policy
          and ignore_public_acls
          and restrict_public_buckets
          then 'ok'
        else 'alarm'
      end as status,
      case
        when block_public_acls
          and block_public_policy
          and ignore_public_acls
          and restrict_public_buckets
          then name || ' all public access blocks enabled.'
        else name || ' not enabled for: ' ||
          concat_ws(', ',
            case when not block_public_acls then 'block_public_acls' end,
            case when not block_public_policy then 'block_public_policy' end,
            case when not ignore_public_acls then 'ignore_public_acls' end,
            case when not restrict_public_buckets then 'restrict_public_buckets' end
          ) || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}

query "s3_bucket_policy_restricts_cross_account_permission_changes" {
  sql = <<-EOQ
    with cross_account_buckets as (
      select
        distinct arn
      from
        aws_s3_bucket,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'AWS') as p,
        string_to_array(p, ':') as pa,
        jsonb_array_elements_text(s -> 'Action') as a
      where
        s ->> 'Effect' = 'Allow'
        and (
          pa [5] != account_id
          or p = '*'
        )
        and a in (
          's3:deletebucketpolicy',
          's3:putbucketacl',
          's3:putbucketpolicy',
          's3:putencryptionconfiguration',
          's3:putobjectacl'
        )
    )
    select
      a.arn as resource,
      case
        when b.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is null then title || ' restricts cross-account bucket access.'
        else title || ' allows cross-account bucket access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      aws_s3_bucket a
      left join cross_account_buckets b on a.arn = b.arn;
  EOQ
}

query "s3_bucket_object_logging_enabled" {
  sql = <<-EOQ
    with object_logging_cloudtrails as (
      select
        d ->> 'Type' as type,
        replace(replace(v::text,'"',''),'/','') as bucket_arn
      from
        aws_cloudtrail_trail,
        jsonb_array_elements(event_selectors) e,
        jsonb_array_elements(e -> 'DataResources') as d,
        jsonb_array_elements(d -> 'Values') v
      where
        d ->> 'Type' = 'AWS::S3::Object'
    ), object_logging_region as (
        select
          region as  cloudtrail_region,
          replace(replace(v::text,'"',''),'/','') as bucket_arn
        from
          aws_cloudtrail_trail,
          jsonb_array_elements(event_selectors) e,
          jsonb_array_elements(e -> 'DataResources') as d,
          jsonb_array_elements(d -> 'Values') v
        where
          d ->> 'Type' = 'AWS::S3::Object'
          and replace(replace(v::text,'"',''),'/','') = 'arn:aws:s3'
        group by
          region,
          bucket_arn
    ),
    object_logging_region_advance_es as (
      select
        region as  cloudtrail_region
      from
        aws_cloudtrail_trail,
        jsonb_array_elements(advanced_event_selectors) a,
        jsonb_array_elements(a -> 'FieldSelectors') as f,
        jsonb_array_elements_text(f -> 'Equals') e
      where
        e = 'AWS::S3::Object'
        and f ->> 'Field' != 'eventCategory'
      group by
        region
    )
    select
      distinct s.arn as resource,
      case
        when (s.arn = c.bucket_arn)
          or (r.bucket_arn = 'arn:aws:s3' and r. cloudtrail_region = s.region )
          or a. cloudtrail_region =  s.region then 'ok'
        else 'alarm'
      end as status,
      case
        when (s.arn = c.bucket_arn)
          or (r.bucket_arn = 'arn:aws:s3' and r. cloudtrail_region = s.region )
          or a. cloudtrail_region =  s.region then s.name || ' object logging enabled.'
        else s.name || ' object logging not enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket as s
      left join object_logging_cloudtrails as c on s.arn = c.bucket_arn
      left join object_logging_region as r on r. cloudtrail_region = s.region
      left join object_logging_region_advance_es as a on a. cloudtrail_region = s.region;
  EOQ
}

query "s3_bucket_policy_restrict_public_access" {
  sql = <<-EOQ
    with public_buckets as (
      select
        distinct arn as arn
      from
        aws_s3_bucket,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'AWS') as p
      where
        p = '*'
        and s ->> 'Effect' = 'Allow'
    )
    select
      b.arn as resource,
      case
        when b.policy_std is null then 'info'
        when p.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when b.policy_std is null then title || ' does not have defined policy or insufficient access to the policy.'
        when p.arn is not null then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket as b
      left join public_buckets as p on p.arn = b.arn;
  EOQ
}

query "s3_bucket_lifecycle_policy_enabled" {
  sql = <<-EOQ
    with lifecycle_rules_enabled as (
      select
        arn
      from
        aws_s3_bucket,
        jsonb_array_elements(lifecycle_rules) as r
      where
        r ->> 'Status' = 'Enabled'
    )
    select
      b.arn as resource,
      case
        when r.arn is not null then 'ok'
        else 'alarm'
      end status,
      case
        when r.arn is not null then name || ' lifecycle policy or rules configured.'
        else name || ' lifecycle policy or rules not configured.'
      end reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_s3_bucket as b
      left join lifecycle_rules_enabled as r on r.arn = b.arn;
  EOQ
}

query "s3_bucket_versioning_and_lifecycle_policy_enabled" {
  sql = <<-EOQ
    with lifecycle_rules_enabled as (
      select
        arn
      from
        aws_s3_bucket,
        jsonb_array_elements(lifecycle_rules) as r
      where
        r ->> 'Status' = 'Enabled'
    )
    select
      b.arn as resource,
      case
        when not versioning_enabled then 'alarm'
        when versioning_enabled and r.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when not versioning_enabled then name || ' versioning diabled.'
        when versioning_enabled and r.arn is not null then name || ' lifecycle policy configured.'
        else name || ' lifecycle policy not configured.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_s3_bucket as b
      left join lifecycle_rules_enabled as r on r.arn = b.arn;
  EOQ
}

query "s3_bucket_event_notifications_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when
          event_notification_configuration ->> 'EventBridgeConfiguration' is null
          and event_notification_configuration ->> 'LambdaFunctionConfigurations' is null
          and event_notification_configuration ->> 'QueueConfigurations' is null
          and event_notification_configuration ->> 'TopicConfigurations' is null then 'alarm'
        else 'ok'
      end as status,
      case
        when
          event_notification_configuration ->> 'EventBridgeConfiguration' is null
          and event_notification_configuration ->> 'LambdaFunctionConfigurations' is null
          and event_notification_configuration ->> 'QueueConfigurations' is null
          and event_notification_configuration ->> 'TopicConfigurations' is null then title || ' event notifications disabled.'
        else title || ' event notifications enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}

query "s3_bucket_acls_should_prohibit_user_access" {
  sql = <<-EOQ
    with bucket_acl_details as (
      select
        arn,
          title,
          array[acl -> 'Owner' ->> 'ID'] as bucket_owner,
          array_agg(grantee_id) as bucket_acl_permissions,
          object_ownership_controls,
          region,
          account_id,
          _ctx,
          tags
      from
          aws_s3_bucket,
          jsonb_path_query(acl, '$.Grants.Grantee.ID') as grantee_id
      group by
          arn,
          title,
          acl,
          region,
          account_id,
          object_ownership_controls,
          _ctx,
          tags
    ),
    bucket_acl_checks as (
      select
          arn,
          title,
          to_jsonb(bucket_acl_permissions) - bucket_owner as additional_permissions,
          object_ownership_controls,
          region,
          account_id,
          _ctx,
          tags
      from
          bucket_acl_details
    )
    select
      arn as resource,
      case
          when object_ownership_controls -> 'Rules' @> '[{"ObjectOwnership": "BucketOwnerEnforced"} ]' then 'ok'
          when jsonb_array_length(additional_permissions) = 0 then 'ok'
          else 'alarm'
      end as status,
      case
          when object_ownership_controls -> 'Rules' @> '[{"ObjectOwnership": "BucketOwnerEnforced"} ]' then title || ' ACLs are disabled.'
          when jsonb_array_length(additional_permissions) = 0 then title || ' does not have ACLs for user access.'
          else title || ' has ACLs for user access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      bucket_acl_checks;
  EOQ
}

# Non-Config rule query

query "s3_bucket_mfa_delete_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when versioning_mfa_delete then 'ok'
        else 'alarm'
      end as status,
      case
        when versioning_mfa_delete then name || ' MFA delete enabled.'
        else name || ' MFA delete disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}

query "s3_bucket_protected_by_macie" {
  sql = <<-EOQ
    with bucket_list as (
      select
        trim(b::text, '"' ) as bucket_name
      from
        aws_macie2_classification_job,
        jsonb_array_elements(s3_job_definition -> 'BucketDefinitions') as d,
        jsonb_array_elements(d -> 'Buckets') as b
    )
    select
      b.arn as resource,
      case
        when b.region = any(array['us-gov-east-1', 'us-gov-west-1']) then 'skip'
        when l.bucket_name is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.region = any(array['us-gov-east-1', 'us-gov-west-1']) then b.title || ' not protected by Macie as Macie is not supported in ' || b.region || '.'
        when l.bucket_name is not null then b.title || ' protected by Macie.'
        else b.title || ' not protected by Macie.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "b.")}
    from
      aws_s3_bucket as b
      left join bucket_list as l on b.name = l.bucket_name;
  EOQ
}

query "s3_bucket_public_access_blocked" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when
          block_public_acls
          and block_public_policy
          and ignore_public_acls
          and restrict_public_buckets
        then
          'ok'
        else
          'alarm'
      end as status,
      case
        when
          block_public_acls
          and block_public_policy
          and ignore_public_acls
          and restrict_public_buckets
        then name || ' blocks public access.'
        else name || ' does not block public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_s3_bucket;
  EOQ
}
