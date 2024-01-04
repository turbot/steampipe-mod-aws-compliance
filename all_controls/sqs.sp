locals {
  all_controls_sqs_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/SQS"
  })
}

benchmark "all_controls_sqs" {
  title       = "SQS"
  description = "This section contains recommendations for configuring SQS resources."
  children = [
    control.sqs_queue_dead_letter_queue_configured,
    control.sqs_queue_encrypted_at_rest,
    control.sqs_queue_encrypted_with_kms_cmk,
    control.sqs_queue_policy_prohibit_public_access
  ]

  tags = merge(local.all_controls_sqs_common_tags, {
    type = "Benchmark"
  })
}
