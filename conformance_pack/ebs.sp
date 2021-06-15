locals {
  conformance_pack_ebs_common_tags = {
    service = "ebs"
  }
}

control "ebs_snapshot_not_publicly_restorable" {
  title       = "EBS snapshots should not be publicly restorable"
  description = "Manage access to the AWS Cloud by ensuring EBS snapshots are not publicly restorable."
  sql         = query.ebs_snapshot_not_publicly_restorable.sql
  tags        = local.conformance_pack_ebs_common_tags
}

control "ebs_volume_encryption_at_rest_enabled" {
  title       = "EBS volume encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql         = query.ebs_volume_encryption_at_rest_enabled.sql
  tags        = local.conformance_pack_ebs_common_tags
}