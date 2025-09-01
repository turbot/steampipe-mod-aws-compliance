locals {
  foundational_security_mq_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/MQ"
  })
}

benchmark "foundational_security_mq" {
  title         = "MQ"
  documentation = file("./foundational_security/docs/foundational_security_mq.md")
  children = [
    control.foundational_security_mq_2,
    control.foundational_security_mq_3
  ]

  tags = merge(local.foundational_security_mq_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_mq_2" {
  title         = "2 Active MQ brokers should stream audit logs to CloudWatch"
  description   = "This control checks whether an Amazon MQ ActiveMQ broker streams audit logs to Amazon CloudWatch Logs. The control fails if the broker doesn't stream audit logs to CloudWatch Logs."
  severity      = "medium"
  query         = query.mq_broker_audit_log_enabled
  documentation = file("./foundational_security/docs/foundational_security_mq_2.md")

  tags = merge(local.foundational_security_mq_common_tags, {
    foundational_security_item_id  = "mq_2"
    foundational_security_category = "logging"
  })
}

control "foundational_security_mq_3" {
  title         = "3 Amazon MQ brokers should have automatic minor version upgrade enabled"
  description   = "This control checks whether an Amazon MQ broker has automatic minor version upgrade enabled. The control fails if the broker doesn't have automatic minor version upgrade enabled."
  severity      = "medium"
  query         = query.mq_broker_auto_minor_version_upgrade_enabled
  documentation = file("./foundational_security/docs/foundational_security_mq_3.md")

  tags = merge(local.foundational_security_mq_common_tags, {
    foundational_security_item_id  = "mq_3"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}