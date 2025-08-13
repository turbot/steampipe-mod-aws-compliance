locals {
  foundational_security_datafirehose_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/DataFirehose"
  })
}

benchmark "foundational_security_datafirehose" {
  title         = "Data Firehose"
  documentation = file("./foundational_security/docs/foundational_security_datafirehose.md")
  children = [
    control.foundational_security_datafirehose_1
  ]

  tags = merge(local.foundational_security_datafirehose_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_datafirehose_1" {
  title         = "1 Firehose delivery streams should be encrypted at rest"
  description   = "This control checks whether an Amazon Data Firehose delivery stream is encrypted at rest with server-side encryption. This control fails if a Firehose delivery stream isn't encrypted at rest with server-side encryption."
  severity      = "medium"
  query         = query.kinesis_firehose_delivery_stream_server_side_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_datafirehose_1.md")

  tags = merge(local.foundational_security_datafirehose_common_tags, {
    foundational_security_item_id  = "datafirehose_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}
