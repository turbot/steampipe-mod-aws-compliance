locals {
  conformance_pack_kms_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/KMS"
  })
}

control "kms_key_not_pending_deletion" {
  title       = "KMS keys should not be pending deletion"
  description = "To help protect data at rest, ensure necessary customer master keys (CMKs) are not scheduled for deletion in AWS Key Management Service (AWS KMS)."
  query       = query.kms_key_not_pending_deletion

  tags = merge(local.conformance_pack_kms_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "kms_cmk_rotation_enabled" {
  title       = "KMS CMK rotation should be enabled"
  description = "Enable key rotation to ensure that keys are rotated once they have reached the end of their crypto period."
  query       = query.kms_cmk_rotation_enabled

  tags = merge(local.conformance_pack_kms_common_tags, {
    cis_controls_v8_ig1    = "true"
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "kms_cmk_policy_prohibit_public_access" {
  title       = "KMS CMK policies should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS KMS CMK cannot be publicly accessed."
  query       = query.kms_cmk_policy_prohibit_public_access

  tags = merge(local.conformance_pack_kms_common_tags, {
    other_checks = "true"
  })
}

control "kms_key_decryption_restricted_in_iam_customer_managed_policy" {
  title       = "KMS key decryption should be restricted in IAM customer managed policy"
  description = "Checks whether the default version of IAM customer managed policies allow principals to use the AWS KMS decryption actions on all resources. This control uses Zelkova, an automated reasoning engine, to validate and warn you about policies that may grant broad access to your secrets across AWS accounts. This control fails if the kms:Decrypt or kms:ReEncryptFrom actions are allowed on all KMS keys. The control evaluates both attached and unattached customer managed policies. It does not check inline policies or AWS managed policies."
  query       = query.kms_key_decryption_restricted_in_iam_customer_managed_policy

  tags = merge(local.conformance_pack_kms_common_tags, {
    other_checks = "true"
  })
}

control "kms_key_decryption_restricted_in_iam_inline_policy" {
  title       = "KMS key decryption should be restricted in IAM inline policy"
  description = "Checks whether the inline policies that are embedded in your IAM identities (role, user, or group) allow the AWS KMS decryption actions on all KMS keys. This control uses Zelkova, an automated reasoning engine, to validate and warn you about policies that may grant broad access to your secrets across AWS accounts. This control fails if kms:Decrypt or kms:ReEncryptFrom actions are allowed on all KMS keys in an inline policy."
  query       = query.kms_key_decryption_restricted_in_iam_inline_policy

  tags = merge(local.conformance_pack_kms_common_tags, {
    other_checks = "true"
  })
}

control "kms_cmk_unused" {
  title       = "KMS key should be in use"
  description = "This control checks whether there are any unused CMK (Customer Master Key) KMS (Key Management Service) keys."
  query       = query.kms_cmk_unused

  tags = merge(local.conformance_pack_kms_common_tags, {
    other_checks = "true"
  })
}

query "kms_key_not_pending_deletion" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when key_state = 'PendingDeletion' then 'alarm'
        else 'ok'
      end as status,
      case
        when key_state = 'PendingDeletion' then title || ' scheduled for deletion and will be deleted in ' || extract(day from deletion_date - current_timestamp) || ' day(s).'
        else title || ' not scheduled for deletion.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_kms_key
    where
      key_manager = 'CUSTOMER';
  EOQ
}

query "kms_cmk_rotation_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when origin = 'EXTERNAL' then 'skip'
        when key_state = 'PendingDeletion' then 'skip'
        when key_state = 'Disabled' then 'skip'
        when not key_rotation_enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when origin = 'EXTERNAL' then title || ' has imported key material.'
        when key_state = 'PendingDeletion' then title || ' is pending deletion.'
        when key_state = 'Disabled' then title || ' is disabled.'
        when not key_rotation_enabled then title || ' key rotation disabled.'
        else title || ' key rotation enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_kms_key
    where
      key_manager = 'CUSTOMER';
  EOQ
}

query "kms_cmk_policy_prohibit_public_access" {
  sql = <<-EOQ
    with wildcard_action_policies as (
      select
        arn,
        count(*) as statements_num
      from
        aws_kms_key,
        jsonb_array_elements(policy_std -> 'Statement') as s
      where
        s ->> 'Effect' = 'Allow'
        and (
          ( s -> 'Principal' -> 'AWS') = '["*"]'
          or  s ->> 'Principal' = '*'
        )
        and key_manager = 'CUSTOMER'
      group by
        arn
    )
    select
      k.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' does not allow public access.'
        else title || ' contains ' || coalesce(p.statements_num, 0) ||
        ' statements that allow public access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "k.")}
    from
      aws_kms_key as k
      left join wildcard_action_policies as p on p.arn = k.arn
    where
      key_manager = 'CUSTOMER';
  EOQ
}

query "kms_key_decryption_restricted_in_iam_customer_managed_policy" {
  sql = <<-EOQ
    with policy_with_decrypt_grant as (
      select
        distinct arn
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as statement
      where
        not is_aws_managed
        and statement ->> 'Effect' = 'Allow'
        and statement -> 'Resource' ?| array['*', 'arn:aws:kms:*:' || account_id || ':key/*', 'arn:aws:kms:*:' || account_id || ':alias/*']
        and statement -> 'Action' ?| array['*', 'kms:*', 'kms:decrypt', 'kms:reencryptfrom', 'kms:reencrypt*']
    )
    select
      i.arn as resource,
      case
        when d.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when d.arn is null then i.title || ' doesn''t allow decryption actions on all keys.'
        else i.title || ' allows decryption actions on all keys.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_iam_policy i
    left join policy_with_decrypt_grant d on i.arn = d.arn
    where
      not is_aws_managed;
  EOQ
}

query "kms_key_decryption_restricted_in_iam_inline_policy" {
  sql = <<-EOQ
    with user_with_decrypt_grant as (
      select
        distinct arn
      from
        aws_iam_user,
        jsonb_array_elements(inline_policies_std) as inline_policy,
        jsonb_array_elements(inline_policy -> 'PolicyDocument' -> 'Statement') as statement
      where
        statement ->> 'Effect' = 'Allow'
        and statement -> 'Resource' ?| array['*', 'arn:aws:kms:*:' || account_id || ':key/*', 'arn:aws:kms:*:' || account_id || ':alias/*']
        and statement -> 'Action' ?| array['*', 'kms:*', 'kms:decrypt', 'kms:deencrypt*', 'kms:reencryptfrom']
    ),
    role_with_decrypt_grant as (
      select
        distinct arn
      from
        aws_iam_role,
        jsonb_array_elements(inline_policies_std) as inline_policy,
        jsonb_array_elements(inline_policy -> 'PolicyDocument' -> 'Statement') as statement
      where
        statement ->> 'Effect' = 'Allow'
        and statement -> 'Resource' ?| array['*', 'arn:aws:kms:*:' || account_id || ':key/*', 'arn:aws:kms:*:' || account_id || ':alias/*']
        and statement -> 'Action' ?| array['*', 'kms:*', 'kms:decrypt', 'kms:deencrypt*', 'kms:reencryptfrom']
    ),
    group_with_decrypt_grant as (
      select
        distinct arn
      from
        aws_iam_group,
        jsonb_array_elements(inline_policies_std) as inline_policy,
        jsonb_array_elements(inline_policy -> 'PolicyDocument' -> 'Statement') as statement
      where
        statement ->> 'Effect' = 'Allow'
        and statement -> 'Resource' ?| array['*', 'arn:aws:kms:*:' || account_id || ':key/*', 'arn:aws:kms:*:' || account_id || ':alias/*']
        and statement -> 'Action' ?| array['*', 'kms:*', 'kms:decrypt', 'kms:deencrypt*', 'kms:reencryptfrom']
    )
    select
      i.arn as resource,
      case
        when d.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when d.arn is null then 'User ' || i.title || ' not allowed to perform decryption actions on all keys.'
        else 'User ' || i.title || ' allowed to perform decryption actions on all keys.'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_iam_user i
      left join user_with_decrypt_grant d on i.arn = d.arn
    union
    select
      r.arn as resource,
      case
        when d.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when d.arn is null then 'Role ' || r.title || ' not allowed to perform decryption actions on all keys.'
        else 'Role ' || r.title || ' allowed to perform decryption actions on all keys.'
      end as reason

      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "r.")}
    from
      aws_iam_role r
      left join role_with_decrypt_grant d on r.arn = d.arn
    where
      r.arn not like '%service-role/%'
    union
    select
      g.arn as resource,
      case
        when d.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when d.arn is null then 'Role ' || g.title || ' not allowed to perform decryption actions on all keys.'
        else 'Group ' || g.title || ' allowed to perform decryption actions on all keys.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "g.")}
    from
      aws_iam_group g
      left join group_with_decrypt_grant d on g.arn = d.arn;
  EOQ
}

query "kms_cmk_unused" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not enabled and key_state = 'PendingDeletion' then 'ok'
        when not enabled and key_state <> 'PendingDeletion' then 'alarm'
        else 'ok'
      end as status,
      case
        when not enabled and key_state = 'PendingDeletion' then title || ' scheduled for deletion in ' || extract(day from deletion_date - current_timestamp) || ' day(s).'
        when not enabled and key_state <> 'PendingDeletion' then title || ' is unused.'
        else title || ' is in use.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_kms_key
    where
      key_manager = 'CUSTOMER';
  EOQ
}
