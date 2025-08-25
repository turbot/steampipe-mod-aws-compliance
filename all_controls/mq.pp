locals {
  all_controls_mq_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/MQ"
  })
}

benchmark "all_controls_mq" {
  title       = "MQ"
  description = "This section contains recommendations for configuring MQ resources."
  children = [
    control.mq_broker_audit_log_enabled,
    control.mq_broker_auto_minor_version_upgrade_enabled,
    control.mq_broker_restrict_public_access
  ]

  tags = merge(local.all_controls_mq_common_tags, {
    type = "Benchmark"
  })
}
