benchmark "hipaa_final_omnibus_security_rule_2013_164_312_a_2_i" {
  title       = "164.312(a)(2)(i) Unique user identification"
  description = "Assign a unique name and/or number for identifying and tracking user identity."
  children = [
    control.cloudtrail_s3_data_events_enabled,
    control.iam_root_user_no_access_keys,
    control.s3_bucket_restrict_public_read_access
  ]

  tags = merge(local.hipaa_final_omnibus_security_rule_2013_164_312_common_tags, {
    hipaa_final_omnibus_security_rule_2013_item_id = "164_312_a_2_i"
  })
}
