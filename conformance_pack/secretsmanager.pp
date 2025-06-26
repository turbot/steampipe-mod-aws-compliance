locals {
  conformance_pack_secretsmanager_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/SecretsManager"
  })
}

control "secretsmanager_secret_last_used_1_day" {
  title       = "Remove unused Secrets Manager secrets"
  description = "This control checks whether your secrets have been accessed within a specified number of days. The default value is 90 days. If a secret was accessed even once within the defined number of days, this control fails."
  query       = query.secretsmanager_secret_last_used_1_day

  tags = local.conformance_pack_secretsmanager_common_tags
}

control "secretsmanager_secret_automatic_rotation_lambda_enabled" {
  title       = "Secrets Manager secrets should be rotated within a specified number of days"
  description = "This control checks whether your secrets have been rotated at least once within 90 days. Rotating secrets can help you to reduce the risk of an unauthorized use of your secrets in your AWS account. Examples include database credentials, passwords, third-party API keys, and even arbitrary text. If you do not change your secrets for a long period of time, the secrets are more likely to be compromised."
  query       = query.secretsmanager_secret_automatic_rotation_lambda_enabled

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "secretsmanager_secret_automatic_rotation_enabled" {
  title       = "Secrets Manager secrets should have automatic rotation enabled"
  description = "This rule ensures AWS Secrets Manager secrets have rotation enabled. Rotating secrets on a regular schedule can shorten the period a secret is active, and potentially reduce the business impact if the secret is compromised."
  query       = query.secretsmanager_secret_automatic_rotation_enabled

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    cisa_cyber_essentials                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "secretsmanager_secret_rotated_as_scheduled" {
  title       = "Secrets Manager secrets should be rotated as per the rotation schedule"
  description = "This rule ensures that AWS Secrets Manager secrets have rotated successfully according to the rotation schedule. Rotating secrets on a regular schedule can shorten the period that a secret is active, and potentially reduce the business impact if it is compromised."
  query       = query.secretsmanager_secret_rotated_as_scheduled

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "secretsmanager_secret_unused_90_day" {
  title       = "Secrets Manager secrets that have not been used in 90 days should be removed"
  description = "Ensure that AWS Secrets Manager secrets have been accessed within a specified number of days. The rule is non-compliant if a secret has not been accessed in 'unusedForDays' number of days. The default value is 90 days."
  query       = query.secretsmanager_secret_unused_90_day

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    cisa_cyber_essentials                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v40                            = "true"
  })
}

control "secretsmanager_secret_encrypted_with_kms_cmk" {
  title       = "Secrets Manager secrets should be encrypted using CMK"
  description = "Ensure that all secrets in AWS Secrets Manager are encrypted using the AWS managed key (aws/secretsmanager) or a customer managed key that was created in AWS Key Management Service (AWS KMS). The rule is compliant if a secret is encrypted using a customer managed key. This rule is non-compliant if a secret is encrypted using aws/secretsmanager."
  query       = query.secretsmanager_secret_encrypted_with_kms_cmk

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
  })
}

control "secretsmanager_secret_last_changed_90_day" {
  title       = "Secrets Manager secrets should be rotated within specific number of days"
  description = "Ensure that AWS Secrets Manager secrets have been rotated in the past specified number of days. The rule is non-compliant if a secret has not been rotated for more than 'maxDaysSinceRotation' number of days. The default value is 90 days."
  query       = query.secretsmanager_secret_last_changed_90_day

  tags = merge(local.conformance_pack_secretsmanager_common_tags, {
    cisa_cyber_essentials                  = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
  })
}

control "secretsmanager_secret_last_changed_365_day" {
  title       = "Secrets Manager secrets should be rotated within 365 days"
  description = "Ensure that AWS Secrets Manager secrets have been rotated in the past 365 days. The rule is non-compliant if a secret has not been rotated for more than 365 days. This control provides a more lenient rotation period compared to the 90-day requirement, which may be more suitable for some organizations."
  query       = query.secretsmanager_secret_last_changed_365_day

  tags = local.conformance_pack_secretsmanager_common_tags
}

query "secretsmanager_secret_automatic_rotation_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when rotation_rules is null then 'alarm'
        else 'ok'
      end as status,
      case
        when rotation_rules is null then title || ' automatic rotation not enabled.'
        else title || ' automatic rotation enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_secretsmanager_secret;
  EOQ
}

query "secretsmanager_secret_rotated_as_scheduled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when primary_region is not null and region != primary_region then 'skip' -- Replica secret
        when rotation_rules is null then 'alarm' -- Rotation not enabled
        when last_rotated_date is null
          and (date(current_date) - date(created_date)) <= (rotation_rules -> 'AutomaticallyAfterDays')::integer then 'ok' -- New secret not due for rotation yet
        when last_rotated_date is null
          and (date(current_date) - date(created_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then 'alarm' -- New secret overdue for rotation
        when last_rotated_date is not null
        and (date(current_date) - date(last_rotated_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then 'alarm' -- Secret has been rotated before but is overdue for another rotation
      end as status,
      case
        when primary_region is not null and region != primary_region then title || ' is a replica.'
        when rotation_rules is null then title || ' rotation not enabled.'
        when last_rotated_date is null
          and (date(current_date) - date(created_date)) <= (rotation_rules -> 'AutomaticallyAfterDays')::integer then title || ' scheduled for rotation.'
        when last_rotated_date is null
        and (date(current_date) - date(created_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then title || ' not rotated as per schedule.'
        when last_rotated_date is not null
          and (date(current_date) - date(last_rotated_date)) > (rotation_rules -> 'AutomaticallyAfterDays')::integer then title || ' not rotated as per schedule.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_secretsmanager_secret;
  EOQ
}

query "secretsmanager_secret_unused_90_day" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when last_accessed_date is null then 'alarm'
        when date(current_date) - date(last_accessed_date) <= 90 then 'ok'
        else 'alarm'
      end as status,
      case
        when last_accessed_date is null then title || ' never accessed.'
        else
          title || ' last used ' || extract(day from current_timestamp - last_accessed_date) || ' day(s) ago.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_secretsmanager_secret;
  EOQ
}

query "secretsmanager_secret_encrypted_with_kms_cmk" {
  sql = <<-EOQ
    with encryption_keys as (
      select
        distinct s.arn,
        k.aliases as alias
      from
        aws_secretsmanager_secret as s
        left join aws_kms_key as k on k.arn = s.kms_key_id
      where
        jsonb_array_length(k.aliases) > 0
    )
    select
      s.arn as resource,
      case
        when kms_key_id is null
          or kms_key_id = 'alias/aws/secretsmanager'
          or k.alias @> '[{"AliasName":"alias/aws/secretsmanager"}]'then 'alarm'
        else 'ok'
      end as status,
      case
        when kms_key_id is null then title || ' not encrypted with KMS.'
        when kms_key_id = 'alias/aws/secretsmanager' or k.alias @> '[{"AliasName":"alias/aws/secretsmanager"}]' then title || ' encrypted with AWS managed key.'
        else title || ' encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_secretsmanager_secret as s
      left join encryption_keys as k on s.arn = k.arn;

  EOQ
}

query "secretsmanager_secret_last_changed_90_day" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when last_changed_date is null then 'alarm'
        when date(current_date) - date(last_changed_date) <= 90 then 'ok'
        else 'alarm'
      end as status,
      case
        when last_changed_date is null then title || ' never rotated.'
        else
          title || ' last rotated ' || extract(day from current_timestamp - last_changed_date) || ' day(s) ago.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_secretsmanager_secret;
  EOQ
}

query "secretsmanager_secret_last_changed_365_day" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when last_changed_date is null then 'alarm'
        when date(current_date) - date(last_changed_date) <= 365 then 'ok'
        else 'alarm'
      end as status,
      case
        when last_changed_date is null then title || ' never rotated.'
        else
          title || ' last rotated ' || extract(day from current_timestamp - last_changed_date) || ' day(s) ago.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_secretsmanager_secret;
  EOQ
}

query "secretsmanager_secret_automatic_rotation_lambda_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when rotation_rules is not null and rotation_lambda_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when rotation_rules is not null and rotation_lambda_arn is not null then title || ' scheduled for rotation using Lambda function.'
        else title || ' automatic rotation using Lambda function disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_secretsmanager_secret;
  EOQ
}

query "secretsmanager_secret_last_used_1_day" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when date(last_accessed_date) - date(created_date) >= 1 then 'ok'
        else 'alarm'
      end as status,
      case
        when date(last_accessed_date)- date(created_date) >= 1 then title || ' recently used.'
        else title || ' not used recently.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_secretsmanager_secret;
  EOQ
}
