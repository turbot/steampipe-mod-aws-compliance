locals {
  hipaa_164_312_a_2_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_control_id = "hipaa_164_312_a_2_i"
  })
}

benchmark "hipaa_164_312_a_2_i" {
  title         = "164.312(a)(2)(i) Unique user identification"
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_i.md")
  children = [
    control.hipaa_164_312_a_2_i_iam_root_user_with_no_access_key
  ]
  tags = local.hipaa_164_312_a_2_i_common_tags
}

control "hipaa_164_312_a_2_i_iam_root_user_with_no_access_key" {
  title         = "IAM root user access key should not exist"
  description   = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  sql           = query.iam_root_user_access_key.sql
  #documentation = file("./hipaa/docs/hipaa_164_312_a_2_i_iam_root_user_with_no_access_key.md")

  tags = merge(local.hipaa_164_312_a_2_i_common_tags, {
    hipaa_item_id = "hipaa_164_312_a_2_i_iam_root_user_with_no_access_key"
  })
}