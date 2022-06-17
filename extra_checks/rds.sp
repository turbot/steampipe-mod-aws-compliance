locals {
  extra_checks_rds_common_tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}

benchmark "extra_checks_rds" {
  title       = "RDS Extra Checks"
  description = "TODO"
  children = [
    control.rds_db_instance_cloudwatch_logs_enabled
  ]

  tags = local.extra_checks_rds_common_tags
}
