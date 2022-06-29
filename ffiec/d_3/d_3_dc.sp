benchmark "ffiec_d_3_dc" {
  title       = "Detective Controls (DC)"
  description = "Detective Controls include threat and vulnerability detection, anomalous activity detection, and event detection, may alert the institution to network and system irregularities that indicate an incident has or may occur."
  children = [
    benchmark.ffiec_d_3_dc_an_b_1,
    benchmark.ffiec_d_3_dc_an_b_2,
    benchmark.ffiec_d_3_dc_an_b_3,
    benchmark.ffiec_d_3_dc_an_b_4,
    benchmark.ffiec_d_3_dc_an_b_5,
    benchmark.ffiec_d_3_dc_ev_b_1,
    benchmark.ffiec_d_3_dc_ev_b_2,
    benchmark.ffiec_d_3_dc_ev_b_3,
    benchmark.ffiec_d_3_dc_th_b_1
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_dc_an_b_1" {
  title       = "D3.DC.An.B.1"
  description = "The institution is able to detect anomalous activities through monitoring across the environment."
  children = [
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_dc_an_b_2" {
  title       = "D3.DC.An.B.2"
  description = "Customer transactions generating anomalous activity alerts are monitored and reviewed."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_dc_an_b_3" {
  title       = "D3.DC.An.B.3"
  description = "Logs of physical and/or logical access are reviewed following events."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_dc_an_b_4" {
  title       = "D3.DC.An.B.4"
  description = "Access to critical systems by third parties is monitored for unauthorized or unusual activity."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.ffiec_common_tags
}


benchmark "ffiec_d_3_dc_an_b_5" {
  title       = "D3.DC.An.B.5"
  description = "Elevated privileges are monitored."
  children = [
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs
  ]

  tags = local.ffiec_common_tags
}


benchmark "ffiec_d_3_dc_ev_b_1" {
  title       = "D3.DC.Ev.B.1"
  description = "A normal network activity baseline is established."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_dc_ev_b_2" {
  title       = "D3.DC.Ev.B.2"
  description = "Mechanisms (e.g., antivirus alerts, log event alerts) are in place to alert management to potential attacks."
  children = [
    control.guardduty_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_dc_ev_b_3" {
  title       = "D3.DC.Ev.B.3"
  description = "Processes are in place to monitor for the presence of unauthorized users, devices, connections, and software."
  children = [
    control.cloudtrail_trail_enabled,
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_3_dc_th_b_1" {
  title       = "D3.DC.Th.B.1"
  description = "Independent testing (including penetration testing and vulnerability scanning) is conducted according to the risk assessment for external-facing systems and the internal network."
  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.ffiec_common_tags
}
