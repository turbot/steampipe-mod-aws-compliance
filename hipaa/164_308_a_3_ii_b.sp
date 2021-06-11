locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_3_ii_b"
  })
}

benchmark "hipaa_164_308_a_3_ii_b" {
  title       = "164.308(a)(3)(ii)(B) Workforce clearance procedure"
  description = "Implement procedures to determine that the access of a workforce member to electronic protected health information is appropriate."
  children = [
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_access_key,
    control.iam_user_no_policies,
    control.iam_user_unused_credentials_90,
    control.iam_user_with_group
  ]
  tags          = local.common_tags
}
