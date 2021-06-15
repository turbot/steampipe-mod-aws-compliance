locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_4_ii_b"
  })
}

benchmark "hipaa_164_308_a_4_ii_b" {
  title       = "164.308(a)(4)(ii)(B) Access authorization"
  description = "Implement policies and procedures for granting access to electronic protected health information, As one illustrative example, through access to a workstation, transaction, program, process, or other mechanism."
  children = [
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_user_no_policies,
    control.iam_user_with_group
  ]
  tags          = local.common_tags
}
