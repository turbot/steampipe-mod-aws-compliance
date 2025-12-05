locals {
  conformance_pack_cognito_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Cognito"
  })
}

control "cognito_identity_pools_restrict_unauthenticated_identities" {
  title       = "Cognito identity pools should not allow unauthenticated identities"
  description = "This control checks whether an Amazon Cognito identity pool is configured to allow unauthenticated identities. The control fails if guest access is activated (the AllowUnauthenticatedIdentities parameter is set to true) for the identity pool."
  query       = query.cognito_identity_pools_restrict_unauthenticated_identities

  tags = local.conformance_pack_cognito_common_tags
}

control "cognito_user_pool_password_policy_with_strong_configuration" {
  title       = "Cognito user pool password policy should meet requirements"
  description = "Checks if the password policy for Amazon Cognito user pool meets the specified requirements. The rule is non-compliant if the user pool password policy does not meet the specified requirements."
  query       = query.cognito_user_pool_password_policy_with_strong_configuration

  tags = local.conformance_pack_cognito_common_tags
}

query "cognito_identity_pools_restrict_unauthenticated_identities" {
  sql = <<-EOQ
    select
      identity_pool_id as resource,
      case
        when not allow_unauthenticated_identities then 'ok'
        else 'alarm'
      end as status,
      case
        when not allow_unauthenticated_identities then title || ' restrict unauthenticated identities.'
        else title || ' allow unauthenticated identities.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cognito_identity_pool;
  EOQ
}

query "cognito_user_pool_password_policy_with_strong_configuration" {
  sql = <<-EOQ
    select
      id as resource,
      case
        when policies -> 'PasswordPolicy' is null then 'alarm'
        when
          (policies -> 'PasswordPolicy' -> 'MinimumLength')::int >= 8
          and coalesce((policies -> 'PasswordPolicy' -> 'RequireLowercase')::boolean, false) = true
          and coalesce((policies -> 'PasswordPolicy' -> 'RequireUppercase')::boolean, false) = true
          and coalesce((policies -> 'PasswordPolicy' -> 'RequireNumbers')::boolean, false) = true
          and coalesce((policies -> 'PasswordPolicy' -> 'RequireSymbols')::boolean, false) = true
          and coalesce((policies -> 'PasswordPolicy' -> 'TemporaryPasswordValidityDays')::int, 0) <= 7
        then 'ok'
        else 'alarm'
      end as status,
      case
        when policies -> 'PasswordPolicy' is null then title || ' password policy not configured.'
        when
          (policies -> 'PasswordPolicy' -> 'MinimumLength')::int >= 8
          and coalesce((policies -> 'PasswordPolicy' -> 'RequireLowercase')::boolean, false) = true
          and coalesce((policies -> 'PasswordPolicy' -> 'RequireUppercase')::boolean, false) = true
          and coalesce((policies -> 'PasswordPolicy' -> 'RequireNumbers')::boolean, false) = true
          and coalesce((policies -> 'PasswordPolicy' -> 'RequireSymbols')::boolean, false) = true
          and coalesce((policies -> 'PasswordPolicy' -> 'TemporaryPasswordValidityDays')::int, 0) <= 7
        then title || ' strong password policy configured.'
        else title || ' password policy ' ||
          concat_ws(', ',
            case when (policies -> 'PasswordPolicy' -> 'MinimumLength')::int < 8 then ('minimum password length set to ' || ((policies -> 'PasswordPolicy' -> 'MinimumLength')::int)::text) end,
            case when not coalesce((policies -> 'PasswordPolicy' -> 'RequireLowercase')::boolean, false) then 'lowercase characters not required' end,
            case when not coalesce((policies -> 'PasswordPolicy' -> 'RequireUppercase')::boolean, false) then 'uppercase characters not required' end,
            case when not coalesce((policies -> 'PasswordPolicy' -> 'RequireNumbers')::boolean, false) then 'numbers not required' end,
            case when not coalesce((policies -> 'PasswordPolicy' -> 'RequireSymbols')::boolean, false) then 'symbols not required' end,
            case when coalesce((policies -> 'PasswordPolicy' -> 'TemporaryPasswordValidityDays')::int, 0) > 7 then ('temporary password validity set to ' || ((policies -> 'PasswordPolicy' -> 'TemporaryPasswordValidityDays')::int)::text || ' days') end
          ) || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_cognito_user_pool;
  EOQ
}
