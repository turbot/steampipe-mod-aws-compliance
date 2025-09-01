locals {
  all_controls_transfer_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Transfer"
  })
}

benchmark "all_controls_transfer" {
  title       = "Transfer"
  description = "This section contains recommendations for configuring Transfer resources."
  children = [
    control.transfer_connector_logging_enabled,
    control.transfer_server_no_ftp_protocol
  ]

  tags = merge(local.all_controls_transfer_common_tags, {
    type = "Benchmark"
  })
}


