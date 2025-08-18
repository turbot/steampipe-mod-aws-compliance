locals {
  foundational_security_datasync_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/DataSync"
  })
}

benchmark "foundational_security_datasync" {
  title         = "DataSync"
  documentation = file("./foundational_security/docs/foundational_security_datasync.md")
  children = [
    control.foundational_security_datasync_1
  ]

  tags = merge(local.foundational_security_datasync_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_datasync_1" {
  title         = "1 DataSync tasks should have logging enabled"
  description   = "This control checks whether an AWS DataSync task has logging enabled. The control fails if the task doesn't have logging enabled."
  severity      = "medium"
  query         = query.datasync_task_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_datasync_1.md")

  tags = merge(local.foundational_security_datasync_common_tags, {
    foundational_security_item_id  = "datasync_1"
    foundational_security_category = "logging"
  })
}
