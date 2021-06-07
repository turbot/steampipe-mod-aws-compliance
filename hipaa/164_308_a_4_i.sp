locals {
  hipaa_164_308_a_4_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_control_id = "hipaa_164_308_a_4_i"
  })
}

benchmark "hipaa_164_308_a_4_i" {
  title         = "164.308(a)(4)(i)"
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_i.md")
  children = [
    control.hipaa_164_308_a_4_i_iam_group_not_empty,
    control.hipaa_164_308_a_4_i_iam_policy_no_star_star,
    control.hipaa_164_308_a_4_i_iam_user_with_group,
    control.hipaa_164_308_a_4_i_iam_user_with_no_policy
  ]
  tags = local.hipaa_164_308_a_4_i_common_tags
}

control "hipaa_164_308_a_4_i_iam_group_not_empty" {
  title         = "IAM groups should have at least one IAM user"
  description   = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, by ensuring that IAM groups have at least one IAM user."
  sql           = query.iam_group_not_empty.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_i_iam_group_not_empty.md")

  tags = merge(local.hipaa_164_308_a_4_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_4_i_iam_group_not_empty"
  })
}

control "hipaa_164_308_a_4_i_iam_policy_no_star_star" {
  title         = "IAM policies with full \"*:*\" administrative privileges are not attached"
  description   = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing \"Effect\": \"Allow\" with \"Action\": \"*\" over \"Resource\": \"*\"."
  sql           = query.iam_policy_no_star_star.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_i_iam_policy_no_star_star.md")

  tags = merge(local.hipaa_164_308_a_4_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_4_i_iam_policy_no_star_star"
  })
}

control "hipaa_164_308_a_4_i_iam_user_with_group" {
  title         = "IAM users are members of at least one group"
  description   = "AWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  sql           = query.iam_user_with_group.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_i_iam_user_with_group.md")

  tags = merge(local.hipaa_164_308_a_4_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_4_i_iam_user_with_group"
  })
}

control "hipaa_164_308_a_4_i_iam_user_with_no_policy" {
  title         = "IAM users should not have IAM policies attached"
  description   = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  sql           = query.iam_user_no_policies.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_4_i_iam_user_with_no_policy.md")

  tags = merge(local.hipaa_164_308_a_4_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_4_i_iam_user_with_no_policy"
  })
}