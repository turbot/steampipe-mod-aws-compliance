locals {
  all_controls_drs_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/DRS"
  })
}

benchmark "all_controls_drs" {
  title       = "DRS"
  description = "This section contains recommendations for configuring DRS resources."
  children = [
    control.drs_job_enabled
  ]

  tags = merge(local.all_controls_drs_common_tags, {
    type = "Benchmark"
  })
}
