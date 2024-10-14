benchmark "hipaa_final_omnibus_security_rule_2013_164_308_a_5_ii_c" {
  title       = "164.308(a)(5)(ii)(C) Log-in monitoring"
  description = "Procedures for monitoring log-in attempts and reporting discrepancies."
  children = [
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_validation_enabled,
    control.guardduty_enabled,
    control.log_metric_filter_console_authentication_failure
  ]

  tags = merge(local.hipaa_final_omnibus_security_rule_2013_164_308_common_tags, {
    hipaa_final_omnibus_security_rule_2013_item_id = "164_308_a_5_ii_c"
  })
}
