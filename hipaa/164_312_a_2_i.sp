locals {
  hipaa_164_312_a_2_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_a_2_i"
  })
}

benchmark "hipaa_164_312_a_2_i" {
  title       = "164.312(a)(2)(i) Unique user identification"
  description = "Assign a unique name and/or number for identifying and tracking user identity."
  children = [
    control.iam_root_user_access_key
  ]
  tags = local.hipaa_164_312_a_2_i_common_tags
}
