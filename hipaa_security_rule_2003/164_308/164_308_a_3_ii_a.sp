benchmark "hipaa_security_rule_2003_164_308_a_3_ii_a" {
  title       = "164.308(a)(3)(ii)(A) Authorization and/or supervision"
  description = "Implement procedures for the authorization and/or supervision of workforce members who work with electronic protected health information or in locations where it might be accessed."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.emr_cluster_kerberos_enabled,
    control.guardduty_enabled,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_iam_authentication_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled
  ]

  tags = merge(local.hipaa_security_rule_2003_164_308_common_tags, {
    hipaa_security_rule_2003_item_id = "164_308_a_3_ii_a"
  })
}
