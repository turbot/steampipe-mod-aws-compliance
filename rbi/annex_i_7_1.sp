locals {
  rbi_annex_i_7_1_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_7_1"
  })
}

benchmark "rbi_annex_i_7_1" {
  title       = "Annex_I(7.1)"
  description = "TODO"
  children = [
    control.rbi_annex_i_7_1_iam_policy_no_star_star,
    control.rbi_annex_i_7_1_iam_root_user_access_key,
    control.rbi_annex_i_7_1_iam_user_no_policies,
    control.rbi_annex_i_7_1_iam_no_inline_policy
  ]
  tags = local.rbi_annex_i_7_1_common_tags
}

control "rbi_annex_i_7_1_iam_policy_no_star_star" {
  title       = "IAM policies should not allow full \"*:*\" administrative privileges"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing \"Effect\": \"Allow\" with \"Action\": \"*\" over \"Resource\": \"*\"."
  sql         = query.iam_policy_no_star_star.sql

  tags = merge(local.rbi_annex_i_7_1_common_tags, {
    service = "iam"
  })
}

control "rbi_annex_i_7_1_iam_root_user_access_key" {
  title       = "IAM root user access key should not exist"
  description = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  sql         = query.iam_root_user_access_key.sql

  tags = merge(local.rbi_annex_i_7_1_common_tags, {
    service = "iam"
  })
}

control "rbi_annex_i_7_1_iam_user_no_policies" {
  title       = "IAM users should not have IAM policies attached"
  description = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  sql         = query.iam_user_no_policies.sql

  tags = merge(local.rbi_annex_i_7_1_common_tags, {
    service = "iam"
  })
}

control "rbi_annex_i_7_1_iam_no_inline_policy" {
  title       = "IAM user, role, or group should not have any inline policy attached"
  description = "Ensure an AWS Identity and Access Management (IAM) user, IAM role or IAM group does not have an inline policy to control access to systems and assets."
  sql         = query.iam_no_inline_policy.sql

  tags = merge(local.rbi_annex_i_7_1_common_tags, {
    service = "iam"
  })
}