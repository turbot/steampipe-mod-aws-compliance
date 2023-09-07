locals {
  all_controls_kinesis_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/Kinesis"
  })
}

benchmark "all_controls_kinesis" {
  title       = "Kinesis"
  description = "This section contains recommendations for configuring Kinesis resources."
  children = [
    control.kinesis_stream_encrypted_with_kms_cmk,
    control.kinesis_stream_server_side_encryption_enabled
  ]

  tags = merge(local.all_controls_kinesis_common_tags, {
    type = "Benchmark"
  })
}
