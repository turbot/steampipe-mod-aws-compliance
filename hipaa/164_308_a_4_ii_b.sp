locals {
  hipaa_164_308_a_4_ii_b_common_tags = merge(local.hipaa_common_tags, {
    service = "164_308_a_4_ii_b"
  })
}

benchmark "hipaa_164_308_a_4_ii_b" {
  title       = "164.308(a)(4)(ii)(B) Access authorization"
  description = "Implement policies and procedures for granting access to electronic protected health information, As one illustrative example, through access to a workstation, transaction, program, process, or other mechanism."
  children = [
    control.hipaa_164_308_a_4_ii_b_iam_group_not_empty,
    control.hipaa_164_308_a_4_ii_b_iam_policy_no_star_star,
    control.hipaa_164_308_a_4_ii_b_iam_user_no_policies,
    control.hipaa_164_308_a_4_ii_b_iam_user_with_group
  ]
  tags          = local.hipaa_164_308_a_4_ii_b_common_tags
}

control "hipaa_164_308_a_4_ii_b_iam_group_not_empty" {
  title       = "IAM group not empty"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, by ensuring that IAM groups have at least one IAM user."
  sql         = query.iam_group_not_empty.sql

  tags = merge(local.hipaa_164_308_a_4_ii_b_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_b_iam_group_not_empty"
  })
}

control "hipaa_164_308_a_4_ii_b_iam_policy_no_star_star" {
  title       = "IAM policy no star star"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'."
  sql         = query.iam_policy_no_star_star.sql

  tags = merge(local.hipaa_164_308_a_4_ii_b_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_b_iam_policy_no_star_star"
  })
}

control "hipaa_164_308_a_4_ii_b_iam_user_with_group" {
  title       = "IAM user with group"
  description = "AWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  sql         = query.iam_user_with_group.sql

  tags = merge(local.hipaa_164_308_a_4_ii_b_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_b_iam_user_with_group"
  })
}

control "hipaa_164_308_a_4_ii_b_iam_user_no_policies" {
  title       = "IAM user no policies"
  description = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  sql         = query.iam_user_no_policies.sql

  tags = merge(local.hipaa_164_308_a_4_ii_b_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_4_ii_b_iam_user_no_policies"
  })
}