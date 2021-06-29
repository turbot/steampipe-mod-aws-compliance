benchmark "nist_cyber_security_pr_pt_1" {
  title       = "PR.PT-1"
  description = "Audit/log records are determined, documented, implemented, and reviewed in accordance with policy."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_pt_1"
  })
}
