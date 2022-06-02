benchmark "nist_800_53_rev_5_ma" {
  title       = "Maintenance (MA)"
  description = "The MA controls in NIST 800-53 revision five detail requirements for maintaining organizational systems and the tools used."
  children = [
    benchmark.nist_800_53_rev_5_ma_4
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ma_4" {
  title       = "Nonlocal Maintenance (MA-4)"
  description = "a. Approve and monitor nonlocal maintenance and diagnostic activities; b. Allow the use of nonlocal maintenance and diagnostic tools only as consistent with organizational policy and documented in the security plan for the system; c. Employ strong authentication in the establishment of nonlocal maintenance and diagnostic sessions; d. Maintain records for nonlocal maintenance and diagnostic activities; and e. Terminate session and network connections when nonlocal maintenance is completed."
  children = [
    benchmark.nist_800_53_rev_5_ma_4_1,
    benchmark.nist_800_53_rev_5_ma_4_c
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ma_4_c" {
  title       = "MA-4(c)"
  description = "Employ strong authentication in the establishment of nonlocal maintenance and diagnostic sessions."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/IAM"
  })
}

benchmark "nist_800_53_rev_5_ma_4_1" {
  title       = "MA-4(1) Logging And Review"
  description = "a. Log [Assignment: organization-defined audit events] for nonlocal maintenance and diagnostic sessions; and b. Review the audit records of the maintenance and diagnostic sessions to detect anomalous behavior."
  children = [
    benchmark.nist_800_53_rev_5_ma_4_1_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_ma_4_1_a" {
  title       = "MA-4(1)(a)"
  description = "Log [Assignment: organization-defined audit events] for nonlocal maintenance and diagnostic sessions."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}