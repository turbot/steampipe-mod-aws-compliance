benchmark "hipaa_final_omnibus_security_rule_2013_164_308_a_5_ii_d" {
  title       = "164.308(a)(5)(ii)(D) Password management"
  description = "Procedures for creating, changing, and safeguarding passwords."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_user_access_key_age_90,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_last_changed_90_day,
    control.secretsmanager_secret_rotated_as_scheduled
  ]

  tags = merge(local.hipaa_final_omnibus_security_rule_2013_164_308_common_tags, {
    hipaa_final_omnibus_security_rule_2013_item_id = "164_308_a_5_ii_d"
  })
}
