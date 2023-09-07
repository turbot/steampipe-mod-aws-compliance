locals {
  all_controls_dms_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DMS"
  })
}

benchmark "all_controls_dms" {
  title       = "DMS"
  description = "This section contains recommendations for configuring DMS resources."
  children = [
    control.dms_replication_instance_not_publicly_accessible
  ]

  tags = merge(local.all_controls_dms_common_tags, {
    type = "Benchmark"
  })
}
