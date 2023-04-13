benchmark "hipaa_final_omnibus_security_rule_2013_164_308_a_3_ii_a" {
  title       = "164.308(a)(3)(ii)(A) Authorization and/or supervision"
  description = "Implement procedures for the authorization and/or supervision of workforce members who work with electronic protected health information or in locations where it might be accessed."
  children = [
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_user_for_host_mode_check,
    control.elb_application_classic_lb_logging_enabled,
    control.emr_cluster_kerberos_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.guardduty_enabled,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_iam_authentication_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_policy_restrict_public_access,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = merge(local.hipaa_final_omnibus_security_rule_2013_164_308_common_tags, {
    hipaa_final_omnibus_security_rule_2013_item_id = "164_308_a_3_ii_a"
  })
}
