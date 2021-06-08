locals {
  hipaa_164_308_a_3_ii_b_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_3_ii_b"
  })
}

benchmark "hipaa_164_308_a_3_ii_b" {
  title         = "164.308(a)(3)(ii)(B) Workforce clearance procedure"
  description   = "Implement procedures to determine that the access of a workforce member to electronic protected health information is appropriate."
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_b.md")
  children = [
    control.hipaa_164_308_a_3_ii_b_iam_group_not_empty,
    control.hipaa_164_308_a_3_ii_b_iam_policy_no_star_star,
    control.hipaa_164_308_a_3_ii_b_iam_root_user_access_key,
    control.hipaa_164_308_a_3_ii_b_iam_user_no_policies,
    control.hipaa_164_308_a_3_ii_b_iam_user_unused_credentials_90,
    control.hipaa_164_308_a_3_ii_b_iam_user_with_group
  ]
  tags          = local.hipaa_164_308_a_3_ii_b_common_tags
}

control "hipaa_164_308_a_3_ii_b_iam_group_not_empty" {
  title         = "IAM group should not be empty"
  description   = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, by ensuring that IAM groups have at least one IAM user."
  sql           = query.iam_group_not_empty.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_b_iam_group_not_empty.md")

  tags = merge(local.hipaa_164_308_a_3_ii_b_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_b_iam_policy_no_star_star" {
  title         = "IAM policy no statements with admin access"
  description   = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'."
  sql           = query.iam_policy_no_star_star.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_b_iam_policy_no_star_star.md")

  tags = merge(local.hipaa_164_308_a_3_ii_b_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_b_iam_root_user_access_key" {
  title         = "IAM root user should not have access key"
  description   = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  sql           = query.iam_root_user_access_key.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_b_iam_root_user_access_key.md")

  tags = merge(local.hipaa_164_308_a_3_ii_b_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_b_iam_user_with_group" {
  title         = "IAM users should be members of at least one group"
  description   = "AWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  sql           = query.iam_user_with_group.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_b_iam_user_with_group.md")

  tags = merge(local.hipaa_164_308_a_3_ii_b_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_b_iam_user_no_policies" {
  title         = "IAM users should not have IAM policies attached"
  description   = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  sql           = query.iam_user_no_policies.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_b_iam_user_no_policies.md")

  tags = merge(local.hipaa_164_308_a_3_ii_b_common_tags, {
    service  = "iam"
  })
}

control "hipaa_164_308_a_3_ii_b_iam_user_unused_credentials_90" {
  title         = "IAM user credentials unused for 90 days or greater should be disabled"
  description   = "AWS Identity and Access Management (IAM) can help you with access permissions and authorizations by checking for IAM passwords and access keys that are not used for a specified time period."
  sql           = query.iam_user_unused_credentials_90.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_b_iam_user_unused_credentials_90.md")

  tags = merge(local.hipaa_164_308_a_3_ii_b_common_tags, {
    service     = "iam"
  })
}
