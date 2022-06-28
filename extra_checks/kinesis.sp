locals {
  extra_checks_kinesis_common_tags = merge(local.extra_checks_common_tags, {
     ype = "Benchmark"
  })
}

benchmark "extra_checks_kinesis" {
  title       = "Kinesis"
  description = "This benchmark contains additional checks for AWS kinesis service, these checks are out of the scope of any predefined benchmarks for AWS."
  children = [
    control.kinesis_stream_encrypted_with_kms_cmk,
    control.kinesis_stream_server_side_encryption_enabled
  ]

  tags = local.extra_checks_kinesis_common_tags
}
