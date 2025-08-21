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
    gxp_21_cfr_part_11 = "true"
    gxp_eu_annex_11    = "true"
    nist_csf           = "true"
    nydfs_23           = "true"
    pci_dss_v321       = "true"
    pci_dss_v40        = "true"
  })
}

control "kinesis_stream_encrypted_with_kms_cmk" {
  title       = "Kinesis streams should be encrypted with CMK"
  description = "Ensure Kinesis streams are encrypted using CMK. Using KMS CMK, you gain full control over who can use the keys to access AWS Kinesis data (including the system metadata)."
  query       = query.kinesis_stream_encrypted_with_kms_cmk

  tags = local.conformance_pack_kinesis_common_tags
}

control "kinesis_firehose_delivery_stream_server_side_encryption_enabled" {
  title       = "Kinesis firehose delivery streams should have server side encryption enabled"
  description = "Enable server side encryption (SSE) of your Kinesis firehose delivery stream, in order to protect your data and metadata from breaches or unauthorized access, and fulfill compliance requirements for data-at-rest encryption within your organization."
  query       = query.kinesis_firehose_delivery_stream_server_side_encryption_enabled

  tags = local.conformance_pack_kinesis_common_tags
}

control "kinesis_stream_retention_period_168_hours" {
  title         = "Kinesis streams should have an adequate data retention period"
  description   = "This control checks whether an Amazon Kinesis data stream has a data retention period greater than or equal to the specified time frame. The control fails if the data retention period is less than the specified time frame. Unless you provide a custom parameter value for the data retention period, Security Hub uses a default value of 168 hours."
  query         = query.kinesis_stream_retention_period_168_hours

  tags = local.conformance_pack_kinesis_common_tags
}

query "kinesis_stream_server_side_encryption_enabled" {
  sql = <<-EOQ
    select
      stream_arn as resource,
      case
        when encryption_type = 'KMS' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_type = 'KMS' then title || ' server side encryption enabled.'
        else title || ' server side encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_kinesis_stream;
  EOQ
}

query "kinesis_stream_encrypted_with_kms_cmk" {
  sql = <<-EOQ
    select
      stream_arn as resource,
      case
        when encryption_type = 'KMS' and key_id <> 'alias/aws/kinesis' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_type = 'KMS' and key_id <> 'alias/aws/kinesis' then title || ' encrypted with CMK.'
        else title || ' not encrypted with CMK.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_kinesis_stream;
  EOQ
}

query "kinesis_firehose_delivery_stream_server_side_encryption_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when delivery_stream_encryption_configuration ->> 'Status' = 'ENABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when delivery_stream_encryption_configuration ->> 'Status' = 'ENABLED' then title || ' server side encryption enabled.'
        else title || ' server side encryption disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_kinesis_firehose_delivery_stream;
  EOQ
}

query "kinesis_stream_retention_period_168_hours" {
  sql = <<-EOQ
    select
      stream_arn as resource,
      case
        when retention_period_hours = 168 then 'ok'
        else 'alarm'
      end as status,
      title || ' retention period set to ' || retention_period_hours || ' hours.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_kinesis_stream;
  EOQ
}
