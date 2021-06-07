locals {
  hipaa_164_308_a_4_ii_c_common_tags = merge(local.hipaa_common_tags, {
    service = "164_308_a_4_ii_c"
  })
}

benchmark "hipaa_164_308_a_4_ii_c" {
  title         = "164.308(a)(4)(ii)(C)"
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c.md")
  children = [
    control.hipaa_164_308_a_4_ii_c_secretsmanager_secrets_automatic_rotation_enabled,
    control.hipaa_164_308_a_4_ii_c_iam_user_access_key_age_90,
    control.hipaa_164_308_a_4_ii_c_iam_group_not_empty,
    control.hipaa_164_308_a_4_ii_c_iam_account_password_policy_strong_min_resuse_24,
    control.hipaa_164_308_a_4_ii_c_iam_policy_no_statements_with_admin_access,
    control.hipaa_164_308_a_4_ii_c_iam_root_user_access_key,
    control.hipaa_164_308_a_4_ii_c_iam_user_with_group,
    control.hipaa_164_308_a_4_ii_c_iam_user_no_policies,
    control.hipaa_164_308_a_4_ii_c_iam_user_unused_credentials_90
  ]
  tags          = local.hipaa_164_308_a_4_ii_c_common_tags
}

control "hipaa_164_308_a_4_ii_c_secretsmanager_secrets_automatic_rotation_enabled" {
  title         = "Secretsmanager secrets automatic rotation should be enabled"
  description   = "This rule ensures AWS Secrets Manager secrets have rotation enabled. Rotating secrets on a regular schedule can shorten the period a secret is active, and potentially reduce the business impact if the secret is compromised."
  sql           = query.secretsmanager_secrets_automatic_rotation_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_secretsmanager_secrets_automatic_rotation_enabled.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_c_secretsmanager_secrets_automatic_rotation_enabled"
  })
}

control "hipaa_164_308_a_4_ii_c_iam_user_access_key_age_90" {
  title         = "IAM user access keys are rotated every 90 days or less"
  description   = "The credentials are audited for authorized devices, users, and processes by ensuring IAM access keys are rotated as per organizational policy."
  sql           = query.iam_user_access_key_age_90.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_iam_user_access_key_age_90.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_c_iam_user_access_key_age_90"
  })
}

control "hipaa_164_308_a_4_ii_c_iam_group_not_empty" {
  title         = "IAM groups should have at least one IAM user"
  description   = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, by ensuring that IAM groups have at least one IAM user."
  sql           = query.iam_group_not_empty.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_iam_group_not_empty.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_4_ii_c_iam_group_not_empty"
  })
}

control "hipaa_164_308_a_4_ii_c_iam_account_password_policy_strong_min_resuse_24" {
  title         = "Password policies for IAM users should have strong configurations"
  description   = "The identities and the credentials are issued, managed, and verified based on an organizational IAM password policy."
  sql           = query.iam_account_password_policy_strong_min_resuse_24.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_iam_account_password_policy_strong_min_resuse_24.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_c_iam_account_password_policy_strong_min_resuse_24"
  })
}

control "hipaa_164_308_a_4_ii_c_iam_policy_no_statements_with_admin_access" {
  title         = "IAM policy no statements with admin access"
  description   = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'."
  sql           = query.iam_policy_no_star_star.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_iam_policy_no_statements_with_admin_access.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_c_iam_policy_no_statements_with_admin_access"
  })
}

control "hipaa_164_308_a_4_ii_c_iam_root_user_access_key" {
  title         = "IAM root user should not have access key"
  description   = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  sql           = query.iam_root_user_access_key.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_iam_root_user_access_key.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_c_iam_root_user_access_key"
  })
}

control "hipaa_164_308_a_4_ii_c_iam_user_with_group" {
  title         = "IAM users are members of at least one group"
  description   = "AAWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  sql           = query.iam_user_with_group.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_iam_user_with_group.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_4_ii_c_iam_user_with_group"
  })
}

control "hipaa_164_308_a_4_ii_c_iam_user_no_policies" {
  title         = "IAM user should not have any policy attached"
  description   = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  sql           = query.iam_user_no_policies.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_iam_user_no_policies.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_c_iam_user_no_policies"
  })
}

control "hipaa_164_308_a_4_ii_c_iam_user_unused_credentials_90" {
  title         = "IAM user credentials unused for 90 days or greater should be disabled"
  description   = "AWS Identity and Access Management (IAM) can help you with access permissions and authorizations by checking for IAM passwords and access keys that are not used for a specified time period."
  sql           = query.iam_user_unused_credentials_90.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_ii_c_iam_user_unused_credentials_90.md")

  tags = merge(local.hipaa_164_308_a_4_ii_c_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_c_iam_user_unused_credentials_90"
  })
}