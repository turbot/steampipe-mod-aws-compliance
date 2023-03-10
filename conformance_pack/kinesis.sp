locals {
  conformance_pack_kinesis_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Kinesis"
  })
}

control "kinesis_stream_server_side_encryption_enabled" {
  title       = "Kinesis streams should have server side encryption enabled"
  description = "Enable server side encryption (SSE) of your AWS Kinesis Server data at rest, in order to protect your data and metadata from breaches or unauthorized access, and fulfill compliance requirements for data-at-rest encryption within your organization."
  query       = query.kinesis_stream_server_side_encryption_enabled

  tags = merge(local.conformance_pack_kinesis_common_tags, {
    audit_manager_pci_v321 = "true"
    other_checks           = "true"
  })
}

control "kinesis_stream_encrypted_with_kms_cmk" {
  title       = "Kinesis streams should be encrypted with CMK"
  description = "Ensure Kinesis streams are encrypted using CMK. Using KMS CMK, you gain full control over who can use the keys to access AWS Kinesis data (including the system metadata)."
  query       = query.kinesis_stream_encrypted_with_kms_cmk

  tags = merge(local.conformance_pack_kinesis_common_tags, {
    other_checks = "true"
  })
}
