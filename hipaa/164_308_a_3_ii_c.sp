locals {
  hipaa_164_308_a_3_ii_c_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_3_ii_c"
  })
}

benchmark "hipaa_164_308_a_3_ii_c" {
  title         = "164.308(a)(3)(ii)(C) Termination procedures"
  description   = "Implement procedures for terminating access to electronic protected health information when the employment of, or other arrangement with, a workforce member ends or as required by determinations made as specified in paragraph (a)(3)(ii)(b)."
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_c.md")
  children = [
    control.hipaa_164_308_a_3_ii_c_iam_user_access_key_age_90
  ]
  tags = local.hipaa_164_308_a_3_ii_c_common_tags
}

control "hipaa_164_308_a_3_ii_c_iam_user_access_key_age_90" {
  title         = "IAM user access keys are rotated every 90 days or less"
  description   = "The credentials are audited for authorized devices, users, and processes by ensuring IAM access keys are rotated as per organizational policy."
  sql           = query.iam_user_access_key_age_90.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_c_iam_user_access_key_age_90.md")

  tags = merge(local.hipaa_164_308_a_3_ii_c_common_tags, {
    service     = "iam"
  })
}